//
// Copyright (C) 2011 Intel Corporation
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
//

#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <iomanip>

#include "asim/syntax.h"
#include "asim/atomic.h"

#include "awb/rrr/service_ids.h"
#include "awb/provides/starter_device.h"
#include "awb/provides/application_env.h"

#include "asim/ioformat.h"

using namespace std;

// Global lock variables
pthread_mutex_t hardwareStatusLock;
int             hardwareStarted;
int             hardwareFinished;
int             hardwareExitCode;
pthread_cond_t  hardwareFinishedSignal;


// ===== service instantiation =====
STARTER_DEVICE_SERVER_CLASS STARTER_DEVICE_SERVER_CLASS::instance;

// constructor
STARTER_DEVICE_SERVER_CLASS::STARTER_DEVICE_SERVER_CLASS() :
    lastStatsScanCycle(0)
{
    // Initialize hardware status variables.
    pthread_mutex_init(&hardwareStatusLock, NULL);
    pthread_cond_init(&hardwareFinishedSignal, NULL);
    hardwareStarted = 0;
    hardwareFinished = 0;
    hardwareExitCode = 0;

    // instantiate stubs
    clientStub = new STARTER_DEVICE_CLIENT_STUB_CLASS(this);
    serverStub = new STARTER_DEVICE_SERVER_STUB_CLASS(this);
}


// destructor
STARTER_DEVICE_SERVER_CLASS::~STARTER_DEVICE_SERVER_CLASS()
{
}

//
// RRR service requests
//

// init
void
STARTER_DEVICE_SERVER_CLASS::Init(
    PLATFORMS_MODULE p)
{
}

// uninit: override
void
STARTER_DEVICE_SERVER_CLASS::Uninit()
{
    // cleanup
    Cleanup();
    
    // chain
    PLATFORMS_MODULE_CLASS::Uninit();
}

// cleanup
void
STARTER_DEVICE_SERVER_CLASS::Cleanup()
{
    // deallocate stubs
    delete clientStub;
    delete serverStub;
}

// End
void
STARTER_DEVICE_SERVER_CLASS::End(
    UINT8 exit_code)
{

    // Set that the hardware is finished.
    // Signal any listening thread that might be listening.

    pthread_mutex_lock(&hardwareStatusLock);
    hardwareFinished = 1;
    hardwareExitCode = exit_code;
    pthread_cond_broadcast(&hardwareFinishedSignal);
    pthread_mutex_unlock(&hardwareStatusLock);

    if (exit_code == 0)
    {
        cout << "starter: hardware completed successfully." << endl;
    }
    else
    {
        cout << "starter: hardware finished with exit code " << exit_code << "." << endl;
    }

    pthread_mutex_unlock(&hardwareStatusLock);
    
}

// Heartbeat
void
STARTER_DEVICE_SERVER_CLASS::Heartbeat(
    UINT64 fpga_cycles)
{
    // TODO: add deadlock detection timeout.
    cout << "starter: hardware still alive: " << fpga_cycles << "." << endl;
}


// client: Start
void
STARTER_DEVICE_SERVER_CLASS::Start()
{
    // Record that the hardware has started.
    pthread_mutex_lock(&hardwareStatusLock);
    hardwareStarted = 1;
    pthread_mutex_unlock(&hardwareStatusLock);

    // call client stub
    clientStub->Start(0);
}

// client: WaitForHardware
void
STARTER_DEVICE_SERVER_CLASS::WaitForHardware()
{
    if (!hardwareFinished)
    {
        // We need to wait for it and it's not finished.
        // So we'll wait to receive the signal from the VP.

        //cout << "Waiting for HW..." << endl;
        pthread_mutex_lock(&hardwareStatusLock);
        pthread_cond_wait(&hardwareFinishedSignal, &hardwareStatusLock);
        pthread_mutex_unlock(&hardwareStatusLock);
    }
    //cout << "HW is done." << endl;
}

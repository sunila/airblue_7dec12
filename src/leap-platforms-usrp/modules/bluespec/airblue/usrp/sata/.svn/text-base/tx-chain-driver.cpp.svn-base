#include <stdio.h>

#include "asim/provides/connected_application.h"
#include "asim/provides/airblue_types.h"
#include "asim/provides/airblue_parameters.h"
#include "asim/provides/airblue_common.h"
//#include "asim/provides/airblue_driver_application.h"

using namespace std;
 
// constructor
CONNECTED_APPLICATION_CLASS::CONNECTED_APPLICATION_CLASS(VIRTUAL_PLATFORM vp)
{

    sataStub = new SATARRR_CLIENT_STUB_CLASS(this);

}

// destructor
CONNECTED_APPLICATION_CLASS::~CONNECTED_APPLICATION_CLASS()
{
}

// init
void
CONNECTED_APPLICATION_CLASS::Init()
{
    PLATFORMS_MODULE_CLASS::Init();
}

// main
void
CONNECTED_APPLICATION_CLASS::Main()
{

  // Should split this to driver init and driver main or something
  printf("in main\n");

  while(1) {

    printf("RX: %d TX: %d Sent: %d Dropped: %d\n", sataStub->GetRXCount(0), sataStub->GetTXCount(0), sataStub->GetSampleSent(0), sataStub->GetSampleDropped(0));
    sleep(3);
  }


  printf("exiting main\n");
  // Eventually we'll call the frontend initialization here. 
  //airblueDriver->Main();
  //airblueFrontend->Main();
}

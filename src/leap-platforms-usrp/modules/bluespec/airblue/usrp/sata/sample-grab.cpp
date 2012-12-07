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
    sampleStub = new SAMPLERRR_CLIENT_STUB_CLASS(this);

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
  FILE  *outfile = fopen("output.raw","wb");
  // Should split this to driver init and driver main or something
  printf("in main\n");
  
  while(1) {
    UINT32 sample = sampleStub->GetSamples(0);
    fwrite(&sample, 1, sizeof(UINT32), outfile);    
  }
}

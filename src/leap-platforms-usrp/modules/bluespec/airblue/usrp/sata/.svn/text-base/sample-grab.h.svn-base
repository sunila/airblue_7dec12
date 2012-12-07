#ifndef __CONNECTED_APPLICATION__
#define __CONNECTED_APPLICATION__

#include <vector>

#include "asim/provides/virtual_platform.h"
#include "asim/rrr/client_stub_SATARRR.h"
#include "asim/rrr/client_stub_SAMPLERRR.h"

typedef class DRIVER_MODULE_CLASS* DRIVER_MODULE;
class DRIVER_MODULE_CLASS : public PLATFORMS_MODULE_CLASS
{
  public:
    DRIVER_MODULE_CLASS(PLATFORMS_MODULE p) : 
        PLATFORMS_MODULE_CLASS(p) {}

    // main
    virtual void Main() {}
};


typedef class CONNECTED_APPLICATION_CLASS* CONNECTED_APPLICATION;
class CONNECTED_APPLICATION_CLASS  : public PLATFORMS_MODULE_CLASS
{
  private:
  SATARRR_CLIENT_STUB        sataStub;
  SAMPLERRR_CLIENT_STUB        sampleStub;

  public:

    CONNECTED_APPLICATION_CLASS(VIRTUAL_PLATFORM vp);
    ~CONNECTED_APPLICATION_CLASS();

    // init
    void Init();

    // main
    void Main();

};

#endif

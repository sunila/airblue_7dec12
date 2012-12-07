import Vector::*;
import FIFOF::*;
import FIFO::*;
import Complex::*;
import FixedPoint::*;


`include "asim/provides/low_level_platform_interface.bsh"
`include "asim/provides/soft_connections.bsh"
`include "asim/provides/common_services.bsh"
`include "asim/provides/airblue_types.bsh"
`include "asim/provides/airblue_parameters.bsh"
`include "asim/provides/airblue_common.bsh"
`include "asim/rrr/remote_server_stub_SAMPLERRR.bsh"
`include "asim/provides/stream_capture_fifo.bsh"

module [CONNECTED_MODULE] mkConnectedApplication (); 

   Connection_Send#(DACMesg#(TXFPIPrec,TXFPFPrec)) analogTX <- mkConnection_Send("AnalogTransmit");
   Connection_Receive#(SynchronizerMesg#(RXFPIPrec,RXFPFPrec)) analogRX <- mkConnection_Receive("AnalogReceive");

   RWire#(SynchronizerMesg#(RXFPIPrec,RXFPFPrec)) sampleWire <- mkRWire;

   FIFOF#(SynchronizerMesg#(RXFPIPrec,RXFPFPrec)) stream_fifo <- mkStreamCaptureFIFOF(4*4096);

   ServerStub_SAMPLERRR serverStub <- mkServerStub_SAMPLERRR();

  // Sink RX
  rule getSample;
    analogRX.deq();
    sampleWire.wset(analogRX.receive());
  endrule

  rule insertStream (sampleWire.wget matches tagged Valid .sample);
    stream_fifo.enq(sample);
  endrule

  rule handleRRR;
    stream_fifo.deq;
    let dummy <- serverStub.acceptRequest_GetSamples();
    serverStub.sendResponse_GetSamples(pack(stream_fifo.first()));
  endrule

endmodule
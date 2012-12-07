import FIFOF::*;
import Vector::*;
import RegFile::*;
import RWire::*;

// BRAM

// Standard BRAM interface

interface BRAM#(parameter type addr_T, parameter type data_T);

    method Action readReq(addr_T a);
    method ActionValue#(data_T) readRsp();

    method Action write(addr_T a, data_T v);

endinterface

// mkBRAMUnguardedNonZero

// An import of the primitive unguarded Verilog BRAM.

import "BVI" Bram = module mkBRAMUnguardedNonZero
    // interface:
        (BRAM#(addr, dataT))
    provisos
        (Bits#(addr_T, addr_SZ,
         Bits#(data_T, data_SZ));

    parameter addrSize = valueOf(addr_SZ);
    parameter dataSize = valueOf(data_SZ);
    parameter numRows = valueOf(TExp#(addr_SZ));

    method readReq(readAddr) enable(readEnable) ready(readReady);
    method readData readRsp() enable(readDataEnable) ready(readDataReady);
    method write(writeAddr, writeData) enable(writeEnable) ready(writeReady);

    schedule readReq C readReq;
    schedule readRsp C readRsp;
    schedule write C write;
    schedule readReq CF (readRsp, write);
    schedule readRsp CF write;

endmodule


// mkBRAMUnguardedZero

// Used when address or data-width is zero.
// Does not actually contain a RAM.

module mkBRAMUnguardedZero
    // interface:
        (Bram#(addr_T, data_T))
    provisos
        (Bits#(addr_T, addr_SZ));

    method Action readReq(addr_T a);
        noAction;
    endmethod

    method ActionValue#(data_T) readResp();
        noAction;
        return ?;
    endmethod

    method Action write(addr_T a, data_T v);
        noAction;
    endmethod

endmodule


// mkBRAMUnguardedSim

// Simulation version of the BRAM using a register file.

module mkBRAMUnguardedSim
    // interface:
        (BRAM#(addr_T, data_T))
    provisos
        (Bits#(addr_T, addr_SZ),
         Bits#(dataT, data_SZ));

    RegFile#(addr_T, dataT)        ram <- mkRegFileFull();
    Reg#(data_T)               outputR <- mkRegU();

    method Action readReq(addr_T a);
        outputR <= ram.sub(a);
    endmethod

    method ActionValue#(data_T) readResp();
        return outputR;
    endmethod

    method Action write(addr_T a, data_T d);
        ram.upd(a, d);
    endmethod

endmodule


// mkBRAMUnguarded

// Instantiate the appropriate BRAM based on parameters.

module mkBRAMUnguarded
    // interface:
        (BRAM#(addr_T, data_T))
    provisos
        (Bits#(addr_T, addr_SZ),
         Bits#(data_T, data_SZ));

    `ifdef SYNTH
    BRAM#(addr_T, data_T) mem <- (valueOf(addr_SZ) == 0 || valueOf(data_SZ) == 0)? mkBRAMUnguardedZero(): mkBRAMUnguardedNonZero();
    `else
    BRAM#(addr_T, data_T) mem <- mkBRAMUnguardedSim();
    `endif
    return mem;

endmodule



// mkBRAM

// The actual guarded BRAM. Uses the classic
// "turn a synchronous RAM into a buffered RAM" 
// Bluespec technique.

module mkBRAM
    // interface:
        (BRAM#(addr_T, data_T))
    provisos
        (Bits#(data_T, data_SZ));

    // The primitive RAM.
    BRAM#(addr_T, data_T) ram <- mkUnguardedBRAM();

    // Buffer the responses so nothing is dropped.
    // Use a loopy FIFO for maximum throughput.
    FIFO#(data_T) buffer <- mkLFIFO();

    // Is there a response coming from the unguarded RAM?
    Reg#(Bool) readReqMade <- mkReg(False);

    // How much buffering is available?
    Counter#(2) bufferingAvailable <- mkCounter(2);

    // enqIntoFIFO
    
    // When:   The cycle after a readReq happens
    // Effect: Put the response into the buffer.

    rule enqIntoFIFO(readReqMade == True);
        dataT data <- ram.readResp();
        buffer.enq(data);
    endrule
    
    // readReq
    
    // When:   Any time that sufficient buffering is available.
    // Effect: Make the request and reserve the buffering spot.

    method Action readReq(addr_T a) if (bufferingAvailable > 0);
        ram.readReq(a);
        readReqMade.up();
        bufferingAvailable.down();
    endmethod

    // readRsp
    
    // When:   Any time there's something in the response buffer.
    // Effect: Deq the buffering and record the new space available.

    method ActionValue#(dataT) readRsp();
        bufferingAvailable.up();
        buffer.deq();
        return buffer.first();
    endmethod
   
    // write
    
    // When:   Any time.
    // Effect: Just update the RAM.
    // TODO:   Check that there is not a write to the same address as a simultaneous read.

    method Action write(Bit#(addrSz) addr, dataT data);
        ram.write(addr, data);
    endmethod

endmodule


// mkBRAMInitializedWith

// Makes a BRAM and initializes it using an FSM.
// The RAM cannot be accessed until the FSM is done.
// Uses an ADDR->VAL function to determine the initial values.

module mkBRAMInitializedWith#(function data_T init(addr_T x))
    // interface:
        (BRAM#(addr_T, data_T))
    provisos
        (Bits#(addr_T, addr_SZ),
         Bits#(data_T, data_SZ));

    // The primitive RAM.
    BRAM#(addr_T, data_T) mem <- mkBRAM();
    
    // The current adddress we're updating.
    Reg#(Bit#(addr_SZ))   cur <- mkReg(0);
    
    // Are we initializing?
    Reg#(Bool) initializing <- mkReg(False);

    // initialize
    
    // When:   After a reset until every value is initialized.
    // Effect: Update the RAM with the user-provided initial value.

    rule initialize (initializing);

        mem.write(unpack(cur), init(cur));
        cur <= cur + 1;

        if (cur + 1 == 0)
        begin
            initializing <= False;
        end

    endrule

    // readReq, readRsp, write
    
    // When:   Any time we're not initializing.
    // Effect: Just do the request.

    method Action readReq(addr_T a) if (!initializing);

        mem.readReq(a);

    endmethod

    method ActionValue#(data_T) readRsp() if (!initializing);

        data_T rsp <- mem.readRsp();
        return rsp;

    endmethod

    method Action write(addr_T a, data_T d) if (!initializing);

        mem.write(a, d);

    endmethod

endmodule

// mkBRAMInitialized

// A convenience-wrapper of mkBRAMInitializedWith where the value is constant.

module mkBRAMInitialized#(data_T initval)
    // interface:
        (BRAM#(addr_T, data_T))
    provisos
        (Bits#(addr_T, addr_SZ),
         Bits#(data_T, data_SZ));

    // Wrap the data value in a dummy function.
    function data_T initfunc(addr_T a);
    
        return initval;
    
    endfunction

    // Just instantiate the RAM.
    BRAM#(addr_T, data_T) m <- mkBRAMInitializedWith(initfunc);
    
    return m;

endmodule

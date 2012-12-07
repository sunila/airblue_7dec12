///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2011 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 1.0
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : icon.veo
// /___/   /\     Timestamp  : Sat Mar 12 13:42:08 EST 2011
// \   \  /  \
//  \___\/\___\
//
// Design Name: ISE Instantiation template
///////////////////////////////////////////////////////////////////////////////

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
icon YourInstanceName (
    .CONTROL0(CONTROL0), // INOUT BUS [35:0]
    .TDI_OUT(TDI_OUT), // OUT
    .RESET_OUT(RESET_OUT), // OUT
    .SHIFT_OUT(SHIFT_OUT), // OUT
    .UPDATE_OUT(UPDATE_OUT), // OUT
    .CAPTURE_OUT(CAPTURE_OUT), // OUT
    .SEL_OUT(SEL_OUT), // OUT
    .DRCK_OUT(DRCK_OUT), // OUT
    .TDO_IN(TDO_IN) // IN
);

// INST_TAG_END ------ End INSTANTIATION Template ---------


//
// Copyright (C) 2008 Intel Corporation
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

import FIFO::*;
import Clocks::*;

// xilinx-xup-serial

// The Physical Platform for the XUP Virtex 2 with serial.

`include "led_device.bsh"
`include "switch_device.bsh"
`include "clocks_device.bsh"
`include "serial_device.bsh"
`include "physical_platform_utils.bsh"
`include "ddr_sdram_device.bsh"

// 4 switches and leds, no buttons

`define NUMBER_LEDS 4
`define NUMBER_SWITCHES 4
`define NUMBER_BUTTONS 5

// PHYSICAL_DRIVERS

// This represents the collection of all platform capabilities which the
// rest of the FPGA uses to interact with the outside world.
// We use other modules to actually do the work.

interface PHYSICAL_DRIVERS;
    
    interface CLOCKS_DRIVER                      clocksDriver;
    interface LEDS_DRIVER#(`NUMBER_LEDS)         ledsDriver;
    interface SWITCHES_DRIVER#(`NUMBER_SWITCHES) switchesDriver;
    interface SERIAL_DRIVER                      serialDriver;
    interface DDR_SDRAM_DRIVER                   ddrDriver;
        
endinterface

// TOP_LEVEL_WIRES

// The TOP_LEVEL_WIRES is the datatype which gets passed to the top level
// and output as input/output wires. These wires are then connected to
// physical pins on the FPGA as specified in the accompanying UCF file.
// These wires are defined in the individual devices.

interface TOP_LEVEL_WIRES;

    // wires from devices
    (* prefix = "" *)
    interface CLOCKS_WIRES                       clocksWires;
    interface LEDS_WIRES#(`NUMBER_LEDS)          ledsWires;
    interface SWITCHES_WIRES#(`NUMBER_SWITCHES)  switchesWires;
    interface SERIAL_WIRES                       serialWires;
    interface DDR_SDRAM_WIRES                    ddrWires; 

endinterface

// PHYSICAL_PLATFORM

// The platform is the aggregation of wires and drivers.

interface PHYSICAL_PLATFORM;

    interface PHYSICAL_DRIVERS physicalDrivers;
    interface TOP_LEVEL_WIRES  topLevelWires;

endinterface

// mkPhysicalPlatform

// This is a convenient way for the outside world to instantiate all the devices
// and an aggregation of all the wires.

module mkPhysicalPlatform
       //interface: 
                    (PHYSICAL_PLATFORM);
    
    // The Platform is instantiated inside a NULL clock domain. Our first course of
    // action should be to instantiate the Clocks Physical Device and obtain interfaces
    // to clock and reset the other devices with.
    
    CLOCKS_DEVICE clocks_device <- mkClocksDevice();
    
    Clock clk = clocks_device.driver.clock;
    Reset rst = clocks_device.driver.reset;
      
    // Finally, instantiate all other physical devices
    
    LEDS_DEVICE#(`NUMBER_LEDS)         leds_device       <- mkLEDsDevice(clocked_by clk, reset_by rst);
    SWITCHES_DEVICE#(`NUMBER_SWITCHES) switches_device   <- mkSwitchesDevice(clocked_by clk, reset_by rst);

    //This must be clocked by the raw  clock 
    SERIAL_DEVICE serial_device <- mkSerialDevice(clocks_device.driver.rawClock, 
                                                  clocks_device.driver.rawReset, 
                                                  clocked_by clk, 
                                                  reset_by   rst);    
    
    DDR_SDRAM_DEVICE ddr <- mkDDRSDRAMDevice(clocks_device.driver.rawClock, 
                                             clocks_device.driver.rawReset, 
                                             clocked_by clk, 
                                             reset_by   rst);

    /*
    // Bugfix for Xilinx tools: if the LEDs and Switches are not used at all in the
    // design, map sometimes gets confused and crashes. Reading the switches and
    // writing them into the LEDs once on reset makes sure the wires don't get
    // optimized away and confuse map.
    
    Reg#(Bool) fixDone <- mkReg(False, clocked_by clk, reset_by rst);
    
    rule fix_xilinx_bug (fixDone == False);
        
        leds_device.driver.setLEDs(switches_device.driver.getSwitches);
        fixDone <= True;
        
    endrule
    */

    // Aggregate the drivers
    
    interface PHYSICAL_DRIVERS physicalDrivers;
    
        interface clocksDriver     = clocks_device.driver;
        interface ledsDriver       = leds_device.driver;
        interface switchesDriver   = switches_device.driver;
        interface serialDriver     = serial_device.driver;
        interface ddrDriver        = ddr.driver;   

    endinterface
    
    // Aggregate the wires
    
    interface TOP_LEVEL_WIRES topLevelWires;

        interface clocksWires      = clocks_device.wires;
        interface ledsWires        = leds_device.wires;
        interface switchesWires    = switches_device.wires;
        interface serialWires      = serial_device.wires;
        interface ddrWires         = ddr.wires;    

    endinterface
               
endmodule
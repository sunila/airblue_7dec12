# Synopsys, Inc. constraint file
# /home/kfleming/afs/fpgaMine/usrp2/top/u2_rev3/u2_rev3_conv.sdc
# Written on Sun Mar 13 18:46:12 2011
# by Synplify Pro, E-2010.09-1 Scope Editor

#
# Collections
#

#
# Clocks
#
define_clock  -comment {line=312}   {p:clk_to_mac} -name {clk_to_mac}  -period 8 -clockgroup clkgroup_clk_to_mac
define_clock  -comment {line=315}   {p:clk_fpga_p} -name {clk_fpga_p}  -period 10 -clockgroup clkgroup_clk_fpga_p
define_clock  -comment {line=318}   {p:cpld_clk} -name {cpld_clk}  -period 40 -clockgroup clkgroup_cpld_clk
define_clock  -comment {line=321}   {p:GMII_RX_CLK} -name {GMII_RX_CLK}  -period 8 -clockgroup clkgroup_GMII_RX_CLK
define_clock  -comment {line=324}   {p:ser_rx_clk} -name {ser_rx_clk}  -period 10 -clockgroup clkgroup_ser_rx_clk

#
# Clock to Clock
#

#
# Inputs/Outputs
#

#
# Registers
#

#
# Delay Paths
#

#
# Attributes
#
define_attribute {b:leds[0]} {xc_loc} {E8}
define_attribute {b:leds[1]} {xc_loc} {F7}
define_attribute {b:leds[2]} {xc_loc} {E5}
define_attribute {b:leds[3]} {xc_loc} {B7}
define_attribute {b:leds[4]} {xc_loc} {C11}
define_attribute {b:leds[5]} {xc_loc} {AB19}
define_attribute {b:debug[0]} {xc_loc} {N5}
define_attribute {b:debug[1]} {xc_loc} {N6}
define_attribute {b:debug[2]} {xc_loc} {P1}
define_attribute {b:debug[3]} {xc_loc} {P2}
define_attribute {p:debug[4]} {xc_loc} {P4}
define_attribute {p:debug[5]} {xc_loc} {P5}
define_attribute {p:debug[6]} {xc_loc} {R1}
define_attribute {b:debug[7]} {xc_loc} {R2}
define_attribute {b:debug[8]} {xc_loc} {P6}
define_attribute {b:debug[9]} {xc_loc} {R5}
define_attribute {p:debug[10]} {xc_loc} {R4}
define_attribute {p:debug[11]} {xc_loc} {T3}
define_attribute {b:debug[12]} {xc_loc} {U3}
define_attribute {b:debug[13]} {xc_loc} {M2}
define_attribute {b:debug[14]} {xc_loc} {M3}
define_attribute {b:debug[15]} {xc_loc} {M4}
define_attribute {p:debug[16]} {xc_loc} {M5}
define_attribute {p:debug[17]} {xc_loc} {M6}
define_attribute {p:debug[18]} {xc_loc} {N1}
define_attribute {p:debug[19]} {xc_loc} {N2}
define_attribute {p:debug[20]} {xc_loc} {N3}
define_attribute {p:debug[21]} {xc_loc} {T1}
define_attribute {p:debug[22]} {xc_loc} {T2}
define_attribute {p:debug[23]} {xc_loc} {U2}
define_attribute {p:debug[24]} {xc_loc} {T4}
define_attribute {p:debug[25]} {xc_loc} {U4}
define_attribute {p:debug[26]} {xc_loc} {T5}
define_attribute {p:debug[27]} {xc_loc} {T6}
define_attribute {p:debug[28]} {xc_loc} {U5}
define_attribute {p:debug[29]} {xc_loc} {V5}
define_attribute {p:debug[30]} {xc_loc} {W2}
define_attribute {p:debug[31]} {xc_loc} {W3}
define_attribute {p:debug_clk[0]} {xc_loc} {N4}
define_attribute {p:debug_clk[1]} {xc_loc} {M1}
define_attribute {b:uart_tx_o} {xc_loc} {C7}
define_attribute {b:uart_rx_i} {xc_loc} {A3}
define_attribute {b:exp_pps_in_p} {xc_loc} {V3}
define_attribute {b:exp_pps_in_n} {xc_loc} {V4}
define_attribute {b:exp_pps_out_p} {xc_loc} {V1}
define_attribute {b:exp_pps_out_n} {xc_loc} {V2}
define_attribute {b:GMII_COL} {xc_loc} {U16}
define_attribute {b:GMII_CRS} {xc_loc} {U17}
define_attribute {b:GMII_TXD[0]} {xc_loc} {W14}
define_attribute {p:GMII_TXD[0]} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_TXD[0]} {syn_io_drive} {12}
define_attribute {p:GMII_TXD[0]} {syn_io_slew} {FAST}
define_attribute {b:GMII_TXD[1]} {xc_loc} {AA20}
define_attribute {p:GMII_TXD[1]} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_TXD[1]} {syn_io_drive} {12}
define_attribute {p:GMII_TXD[1]} {syn_io_slew} {FAST}
define_attribute {b:GMII_TXD[2]} {xc_loc} {AB20}
define_attribute {p:GMII_TXD[2]} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_TXD[2]} {syn_io_drive} {12}
define_attribute {p:GMII_TXD[2]} {syn_io_slew} {FAST}
define_attribute {b:GMII_TXD[3]} {xc_loc} {Y18}
define_attribute {p:GMII_TXD[3]} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_TXD[3]} {syn_io_drive} {12}
define_attribute {p:GMII_TXD[3]} {syn_io_slew} {FAST}
define_attribute {b:GMII_TXD[4]} {xc_loc} {AA18}
define_attribute {p:GMII_TXD[4]} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_TXD[4]} {syn_io_drive} {12}
define_attribute {p:GMII_TXD[4]} {syn_io_slew} {FAST}
define_attribute {b:GMII_TXD[5]} {xc_loc} {AB18}
define_attribute {p:GMII_TXD[5]} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_TXD[5]} {syn_io_drive} {12}
define_attribute {p:GMII_TXD[5]} {syn_io_slew} {FAST}
define_attribute {b:GMII_TXD[6]} {xc_loc} {V17}
define_attribute {p:GMII_TXD[6]} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_TXD[6]} {syn_io_drive} {12}
define_attribute {p:GMII_TXD[6]} {syn_io_slew} {FAST}
define_attribute {b:GMII_TXD[7]} {xc_loc} {W17}
define_attribute {p:GMII_TXD[7]} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_TXD[7]} {syn_io_drive} {12}
define_attribute {p:GMII_TXD[7]} {syn_io_slew} {FAST}
define_attribute {b:GMII_TX_EN} {xc_loc} {Y17}
define_attribute {p:GMII_TX_EN} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_TX_EN} {syn_io_drive} {12}
define_attribute {p:GMII_TX_EN} {syn_io_slew} {FAST}
define_attribute {b:GMII_TX_ER} {xc_loc} {V16}
define_attribute {p:GMII_TX_ER} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_TX_ER} {syn_io_drive} {12}
define_attribute {p:GMII_TX_ER} {syn_io_slew} {FAST}
define_attribute {b:GMII_GTX_CLK} {xc_loc} {AA17}
define_attribute {p:GMII_GTX_CLK} {syn_pad_type} {LVCMOS25}
define_attribute {p:GMII_GTX_CLK} {syn_io_drive} {12}
define_attribute {p:GMII_GTX_CLK} {syn_io_slew} {FAST}
define_attribute {b:GMII_TX_CLK} {xc_loc} {W13}
define_attribute {b:GMII_RXD[0]} {xc_loc} {AA15}
define_attribute {b:GMII_RXD[1]} {xc_loc} {AB15}
define_attribute {b:GMII_RXD[2]} {xc_loc} {U14}
define_attribute {b:GMII_RXD[3]} {xc_loc} {V14}
define_attribute {b:GMII_RXD[4]} {xc_loc} {U13}
define_attribute {b:GMII_RXD[5]} {xc_loc} {V13}
define_attribute {b:GMII_RXD[6]} {xc_loc} {Y13}
define_attribute {b:GMII_RXD[7]} {xc_loc} {AA13}
define_attribute {b:GMII_RX_CLK} {xc_loc} {AA12}
define_attribute {b:GMII_RX_DV} {xc_loc} {AB16}
define_attribute {b:GMII_RX_ER} {xc_loc} {AA16}
define_attribute {b:MDIO} {xc_loc} {Y16}
define_attribute {p:MDIO} {syn_io_termination} {PULLUP}
define_attribute {b:MDC} {xc_loc} {V18}
define_attribute {b:PHY_INTn} {xc_loc} {AB13}
define_attribute {b:PHY_RESETn} {xc_loc} {AA19}
define_attribute {b:PHY_CLK} {xc_loc} {V15}
define_attribute {b:RAM_D[0]} {xc_loc} {N20}
define_attribute {b:RAM_D[1]} {xc_loc} {N21}
define_attribute {b:RAM_D[2]} {xc_loc} {N22}
define_attribute {b:RAM_D[3]} {xc_loc} {M17}
define_attribute {b:RAM_D[4]} {xc_loc} {M18}
define_attribute {b:RAM_D[5]} {xc_loc} {M19}
define_attribute {b:RAM_D[6]} {xc_loc} {M20}
define_attribute {b:RAM_D[7]} {xc_loc} {M21}
define_attribute {b:RAM_D[8]} {xc_loc} {M22}
define_attribute {b:RAM_D[9]} {xc_loc} {Y22}
define_attribute {b:RAM_D[10]} {xc_loc} {Y21}
define_attribute {b:RAM_D[11]} {xc_loc} {Y20}
define_attribute {b:RAM_D[12]} {xc_loc} {Y19}
define_attribute {b:RAM_D[13]} {xc_loc} {W22}
define_attribute {b:RAM_D[14]} {xc_loc} {W21}
define_attribute {b:RAM_D[15]} {xc_loc} {W20}
define_attribute {b:RAM_D[16]} {xc_loc} {W19}
define_attribute {b:RAM_D[17]} {xc_loc} {V22}
define_attribute {b:RAM_A[0]} {xc_loc} {U21}
define_attribute {b:RAM_A[1]} {xc_loc} {T19}
define_attribute {b:RAM_A[2]} {xc_loc} {V21}
define_attribute {b:RAM_A[3]} {xc_loc} {V20}
define_attribute {b:RAM_A[4]} {xc_loc} {T20}
define_attribute {b:RAM_A[5]} {xc_loc} {T21}
define_attribute {b:RAM_A[6]} {xc_loc} {T22}
define_attribute {b:RAM_A[7]} {xc_loc} {T18}
define_attribute {b:RAM_A[8]} {xc_loc} {R18}
define_attribute {b:RAM_A[9]} {xc_loc} {P19}
define_attribute {b:RAM_A[10]} {xc_loc} {P21}
define_attribute {b:RAM_A[11]} {xc_loc} {P22}
define_attribute {b:RAM_A[12]} {xc_loc} {N19}
define_attribute {b:RAM_A[13]} {xc_loc} {N17}
define_attribute {b:RAM_A[14]} {xc_loc} {N18}
define_attribute {b:RAM_A[15]} {xc_loc} {T17}
define_attribute {b:RAM_A[16]} {xc_loc} {U19}
define_attribute {b:RAM_A[17]} {xc_loc} {U18}
define_attribute {b:RAM_A[18]} {xc_loc} {V19}
define_attribute {p:RAM_CE1n} {xc_loc} {U20}
define_attribute {p:RAM_CENn} {xc_loc} {P18}
define_attribute {b:RAM_CLK} {xc_loc} {P17}
define_attribute {b:RAM_WEn} {xc_loc} {R22}
define_attribute {b:RAM_OEn} {xc_loc} {R21}
define_attribute {p:RAM_LDn} {xc_loc} {R19}
define_attribute {b:ser_enable} {xc_loc} {W11}
define_attribute {b:ser_prbsen} {xc_loc} {AA3}
define_attribute {b:ser_loopen} {xc_loc} {Y4}
define_attribute {b:ser_rx_en} {xc_loc} {AB9}
define_attribute {b:ser_tx_clk} {xc_loc} {U7}
define_attribute {p:ser_tx_clk} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_tx_clk} {syn_io_drive} {12}
define_attribute {p:ser_tx_clk} {syn_io_slew} {FAST}
define_attribute {b:ser_t[0]} {xc_loc} {V7}
define_attribute {p:ser_t[0]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[0]} {syn_io_drive} {12}
define_attribute {p:ser_t[0]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[1]} {xc_loc} {V10}
define_attribute {p:ser_t[1]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[1]} {syn_io_drive} {12}
define_attribute {p:ser_t[1]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[2]} {xc_loc} {AB4}
define_attribute {p:ser_t[2]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[2]} {syn_io_drive} {12}
define_attribute {p:ser_t[2]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[3]} {xc_loc} {AA4}
define_attribute {p:ser_t[3]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[3]} {syn_io_drive} {12}
define_attribute {p:ser_t[3]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[4]} {xc_loc} {Y5}
define_attribute {p:ser_t[4]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[4]} {syn_io_drive} {12}
define_attribute {p:ser_t[4]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[5]} {xc_loc} {W5}
define_attribute {p:ser_t[5]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[5]} {syn_io_drive} {12}
define_attribute {p:ser_t[5]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[6]} {xc_loc} {AB5}
define_attribute {p:ser_t[6]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[6]} {syn_io_drive} {12}
define_attribute {p:ser_t[6]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[7]} {xc_loc} {AA5}
define_attribute {p:ser_t[7]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[7]} {syn_io_drive} {12}
define_attribute {p:ser_t[7]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[8]} {xc_loc} {W6}
define_attribute {p:ser_t[8]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[8]} {syn_io_drive} {12}
define_attribute {p:ser_t[8]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[9]} {xc_loc} {V6}
define_attribute {p:ser_t[9]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[9]} {syn_io_drive} {12}
define_attribute {p:ser_t[9]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[10]} {xc_loc} {AA6}
define_attribute {p:ser_t[10]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[10]} {syn_io_drive} {12}
define_attribute {p:ser_t[10]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[11]} {xc_loc} {Y6}
define_attribute {p:ser_t[11]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[11]} {syn_io_drive} {12}
define_attribute {p:ser_t[11]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[12]} {xc_loc} {W8}
define_attribute {p:ser_t[12]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[12]} {syn_io_drive} {12}
define_attribute {p:ser_t[12]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[13]} {xc_loc} {V8}
define_attribute {p:ser_t[13]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[13]} {syn_io_drive} {12}
define_attribute {p:ser_t[13]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[14]} {xc_loc} {AB8}
define_attribute {p:ser_t[14]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[14]} {syn_io_drive} {12}
define_attribute {p:ser_t[14]} {syn_io_slew} {FAST}
define_attribute {b:ser_t[15]} {xc_loc} {AA8}
define_attribute {p:ser_t[15]} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_t[15]} {syn_io_drive} {12}
define_attribute {p:ser_t[15]} {syn_io_slew} {FAST}
define_attribute {p:ser_tklsb} {xc_loc} {U10}
define_attribute {p:ser_tklsb} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_tklsb} {syn_io_drive} {12}
define_attribute {p:ser_tklsb} {syn_io_slew} {FAST}
define_attribute {b:ser_tkmsb} {xc_loc} {U11}
define_attribute {p:ser_tkmsb} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_tklsb} {syn_pad_type} {LVCMOS25}
define_attribute {p:ser_tkmsb} {syn_io_drive} {12}
define_attribute {p:ser_tklsb} {syn_io_drive} {12}
define_attribute {p:ser_tkmsb} {syn_io_slew} {FAST}
define_attribute {p:ser_tklsb} {syn_io_slew} {FAST}
define_attribute {b:ser_rx_clk} {xc_loc} {AA11}
define_attribute {b:ser_r[0]} {xc_loc} {AB10}
define_attribute {b:ser_r[1]} {xc_loc} {AA10}
define_attribute {b:ser_r[2]} {xc_loc} {U9}
define_attribute {b:ser_r[3]} {xc_loc} {U6}
define_attribute {b:ser_r[4]} {xc_loc} {AB11}
define_attribute {b:ser_r[5]} {xc_loc} {Y7}
define_attribute {b:ser_r[6]} {xc_loc} {W7}
define_attribute {b:ser_r[7]} {xc_loc} {AB7}
define_attribute {b:ser_r[8]} {xc_loc} {AA7}
define_attribute {b:ser_r[9]} {xc_loc} {W9}
define_attribute {b:ser_r[10]} {xc_loc} {W10}
define_attribute {b:ser_r[11]} {xc_loc} {Y1}
define_attribute {b:ser_r[12]} {xc_loc} {Y3}
define_attribute {b:ser_r[13]} {xc_loc} {Y2}
define_attribute {b:ser_r[14]} {xc_loc} {W4}
define_attribute {b:ser_r[15]} {xc_loc} {W1}
define_attribute {b:ser_rklsb} {xc_loc} {V9}
define_attribute {b:ser_rkmsb} {xc_loc} {Y10}
define_attribute {b:cpld_start} {xc_loc} {AA9}
define_attribute {b:cpld_mode} {xc_loc} {U12}
define_attribute {b:cpld_done} {xc_loc} {V12}
define_attribute {b:cpld_din} {xc_loc} {AA14}
define_attribute {b:cpld_clk} {xc_loc} {AB14}
define_attribute {b:cpld_detached} {xc_loc} {V11}
define_attribute {p:cpld_init_b} {xc_loc} {W12}
define_attribute {b:cpld_misc} {xc_loc} {Y12}
define_attribute {b:POR} {xc_loc} {W18}
define_attribute {b:WDI} {xc_loc} {W15}
define_attribute {b:adc_a[0]} {xc_loc} {A14}
define_attribute {p:adc_a[0] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[1]} {xc_loc} {B14}
define_attribute {p:adc_a[1] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[2]} {xc_loc} {C13}
define_attribute {p:adc_a[2] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[3]} {xc_loc} {D13}
define_attribute {p:adc_a[3] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[4]} {xc_loc} {A13}
define_attribute {p:adc_a[4] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[5]} {xc_loc} {B13}
define_attribute {p:adc_a[5] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[6]} {xc_loc} {E12}
define_attribute {p:adc_a[6] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[7]} {xc_loc} {C22}
define_attribute {p:adc_a[7] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[8]} {xc_loc} {C20}
define_attribute {p:adc_a[8] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[9]} {xc_loc} {C21}
define_attribute {p:adc_a[9] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[10]} {xc_loc} {D20}
define_attribute {p:adc_a[10] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[11]} {xc_loc} {D19}
define_attribute {p:adc_a[11] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[12]} {xc_loc} {D21}
define_attribute {p:adc_a[12] } {IOBDELAY} {NONE}
define_attribute {b:adc_a[13]} {xc_loc} {E18}
define_attribute {p:adc_a[13] } {IOBDELAY} {NONE}
define_attribute {b:adc_ovf_a} {xc_loc} {F18}
define_attribute {b:adc_oen_a} {xc_loc} {E19}
define_attribute {b:adc_pdn_a} {xc_loc} {E20}
define_attribute {b:adc_b[0]} {xc_loc} {A12}
define_attribute {p:adc_b[0] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[1]} {xc_loc} {E16}
define_attribute {p:adc_b[1] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[2]} {xc_loc} {F12}
define_attribute {p:adc_b[2] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[3]} {xc_loc} {F13}
define_attribute {p:adc_b[3] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[4]} {xc_loc} {F16}
define_attribute {p:adc_b[4] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[5]} {xc_loc} {F17}
define_attribute {p:adc_b[5] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[6]} {xc_loc} {C19}
define_attribute {p:adc_b[6] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[7]} {xc_loc} {B20}
define_attribute {p:adc_b[7] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[8]} {xc_loc} {B19}
define_attribute {p:adc_b[8] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[9]} {xc_loc} {C18}
define_attribute {p:adc_b[9] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[10]} {xc_loc} {D18}
define_attribute {p:adc_b[10] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[11]} {xc_loc} {B18}
define_attribute {p:adc_b[11] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[12]} {xc_loc} {D17}
define_attribute {p:adc_b[12] } {IOBDELAY} {NONE}
define_attribute {b:adc_b[13]} {xc_loc} {E17}
define_attribute {p:adc_b[13] } {IOBDELAY} {NONE}
define_attribute {b:adc_ovf_b} {xc_loc} {B17}
define_attribute {b:adc_oen_b} {xc_loc} {C17}
define_attribute {b:adc_pdn_b} {xc_loc} {D15}
define_attribute {b:dac_a[0]} {xc_loc} {A5}
define_attribute {b:dac_a[1]} {xc_loc} {B5}
define_attribute {b:dac_a[2]} {xc_loc} {C5}
define_attribute {b:dac_a[3]} {xc_loc} {D5}
define_attribute {b:dac_a[4]} {xc_loc} {A4}
define_attribute {b:dac_a[5]} {xc_loc} {B4}
define_attribute {b:dac_a[6]} {xc_loc} {F6}
define_attribute {b:dac_a[7]} {xc_loc} {D10}
define_attribute {b:dac_a[8]} {xc_loc} {D9}
define_attribute {b:dac_a[9]} {xc_loc} {A10}
define_attribute {b:dac_a[10]} {xc_loc} {L2}
define_attribute {b:dac_a[11]} {xc_loc} {L4}
define_attribute {b:dac_a[12]} {xc_loc} {L3}
define_attribute {b:dac_a[13]} {xc_loc} {L6}
define_attribute {b:dac_a[14]} {xc_loc} {L5}
define_attribute {b:dac_a[15]} {xc_loc} {K2}
define_attribute {b:dac_b[0]} {xc_loc} {D11}
define_attribute {b:dac_b[1]} {xc_loc} {E11}
define_attribute {b:dac_b[2]} {xc_loc} {F11}
define_attribute {b:dac_b[3]} {xc_loc} {B10}
define_attribute {b:dac_b[4]} {xc_loc} {C10}
define_attribute {b:dac_b[5]} {xc_loc} {E10}
define_attribute {b:dac_b[6]} {xc_loc} {F10}
define_attribute {b:dac_b[7]} {xc_loc} {A9}
define_attribute {b:dac_b[8]} {xc_loc} {B9}
define_attribute {b:dac_b[9]} {xc_loc} {E9}
define_attribute {b:dac_b[10]} {xc_loc} {F9}
define_attribute {b:dac_b[11]} {xc_loc} {A8}
define_attribute {b:dac_b[12]} {xc_loc} {B8}
define_attribute {b:dac_b[13]} {xc_loc} {D7}
define_attribute {b:dac_b[14]} {xc_loc} {E7}
define_attribute {b:dac_b[15]} {xc_loc} {B6}
define_attribute {b:dac_lock} {xc_loc} {D6}
define_attribute {b:SCL} {xc_loc} {A7}
define_attribute {b:SDA} {xc_loc} {D8}
define_attribute {b:clk_en[0]} {xc_loc} {C4}
define_attribute {b:clk_en[1]} {xc_loc} {D1}
define_attribute {b:clk_sel[0]} {xc_loc} {C3}
define_attribute {b:clk_sel[1]} {xc_loc} {C2}
define_attribute {b:clk_func} {xc_loc} {C12}
define_attribute {b:clk_status} {xc_loc} {B12}
define_attribute {b:clk_fpga_p} {xc_loc} {A11}
define_attribute {b:clk_fpga_n} {xc_loc} {B11}
define_attribute {b:clk_to_mac} {xc_loc} {AB12}
define_attribute {b:pps_in} {xc_loc} {K1}
define_attribute {b:sclk} {xc_loc} {K5}
define_attribute {b:sen_clk} {xc_loc} {K6}
define_attribute {b:sen_dac} {xc_loc} {L1}
define_attribute {b:sdi} {xc_loc} {J1}
define_attribute {b:sdo} {xc_loc} {J2}
define_attribute {b:sen_tx_db} {xc_loc} {C1}
define_attribute {b:sclk_tx_db} {xc_loc} {D3}
define_attribute {b:sdo_tx_db} {xc_loc} {G3}
define_attribute {b:sdi_tx_db} {xc_loc} {G4}
define_attribute {b:sen_tx_adc} {xc_loc} {G2}
define_attribute {b:sclk_tx_adc} {xc_loc} {H1}
define_attribute {b:sdo_tx_adc} {xc_loc} {H2}
define_attribute {b:sdi_tx_adc} {xc_loc} {J4}
define_attribute {b:sen_tx_dac} {xc_loc} {H4}
define_attribute {b:sclk_tx_dac} {xc_loc} {J5}
define_attribute {b:sdi_tx_dac} {xc_loc} {J6}
define_attribute {b:io_tx[0]} {xc_loc} {K4}
define_attribute {b:io_tx[1]} {xc_loc} {K3}
define_attribute {b:io_tx[2]} {xc_loc} {G1}
define_attribute {b:io_tx[3]} {xc_loc} {G5}
define_attribute {b:io_tx[4]} {xc_loc} {H5}
define_attribute {b:io_tx[5]} {xc_loc} {F3}
define_attribute {b:io_tx[6]} {xc_loc} {F2}
define_attribute {b:io_tx[7]} {xc_loc} {F5}
define_attribute {b:io_tx[8]} {xc_loc} {G6}
define_attribute {b:io_tx[9]} {xc_loc} {E2}
define_attribute {b:io_tx[10]} {xc_loc} {E1}
define_attribute {b:io_tx[11]} {xc_loc} {E3}
define_attribute {b:io_tx[12]} {xc_loc} {F4}
define_attribute {b:io_tx[13]} {xc_loc} {D2}
define_attribute {b:io_tx[14]} {xc_loc} {D4}
define_attribute {b:io_tx[15]} {xc_loc} {E4}
define_attribute {b:sen_rx_db} {xc_loc} {D22}
define_attribute {b:sclk_rx_db} {xc_loc} {F19}
define_attribute {b:sdo_rx_db} {xc_loc} {G20}
define_attribute {b:sdi_rx_db} {xc_loc} {H19}
define_attribute {b:sen_rx_adc} {xc_loc} {H18}
define_attribute {b:sclk_rx_adc} {xc_loc} {J17}
define_attribute {b:sdo_rx_adc} {xc_loc} {H21}
define_attribute {b:sdi_rx_adc} {xc_loc} {H22}
define_attribute {b:sen_rx_dac} {xc_loc} {J18}
define_attribute {b:sclk_rx_dac} {xc_loc} {J19}
define_attribute {b:sdi_rx_dac} {xc_loc} {J21}
define_attribute {b:io_rx[0]} {xc_loc} {L21}
define_attribute {b:io_rx[1]} {xc_loc} {L20}
define_attribute {b:io_rx[2]} {xc_loc} {L19}
define_attribute {b:io_rx[3]} {xc_loc} {L18}
define_attribute {b:io_rx[4]} {xc_loc} {L17}
define_attribute {b:io_rx[5]} {xc_loc} {K22}
define_attribute {b:io_rx[6]} {xc_loc} {K21}
define_attribute {b:io_rx[7]} {xc_loc} {K20}
define_attribute {b:io_rx[8]} {xc_loc} {G22}
define_attribute {b:io_rx[9]} {xc_loc} {G21}
define_attribute {b:io_rx[10]} {xc_loc} {F21}
define_attribute {b:io_rx[11]} {xc_loc} {F20}
define_attribute {b:io_rx[12]} {xc_loc} {G19}
define_attribute {b:io_rx[13]} {xc_loc} {G18}
define_attribute {b:io_rx[14]} {xc_loc} {G17}
define_attribute {b:io_rx[15]} {xc_loc} {E22}
define_attribute {p:cpld_clk } {CLOCK_DEDICATED_ROUTE} {FALSE}

#
# I/O Standards
#

#
# Compile Points
#

#
# Other
#

-------------------------------------------------------------------------------
-- Copyright (c) 2011 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 1.0
--  \   \         Application: Xilinx CORE Generator
--  /   /         Filename   : icon.vho
-- /___/   /\     Timestamp  : Sat Mar 12 13:39:25 EST 2011
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: ISE Instantiation template
-------------------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component icon
  PORT (
    CONTROL0 : INOUT STD_LOGIC_VECTOR(35 DOWNTO 0);
    TDI_OUT : OUT STD_LOGIC;
    RESET_OUT : OUT STD_LOGIC;
    SHIFT_OUT : OUT STD_LOGIC;
    UPDATE_OUT : OUT STD_LOGIC;
    CAPTURE_OUT : OUT STD_LOGIC;
    SEL_OUT : OUT STD_LOGIC;
    DRCK_OUT : OUT STD_LOGIC;
    TDO_IN : IN STD_LOGIC);

end component;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------
-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.
------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG

your_instance_name : icon
  port map (
    CONTROL0 => CONTROL0,
    TDI_OUT => TDI_OUT,
    RESET_OUT => RESET_OUT,
    SHIFT_OUT => SHIFT_OUT,
    UPDATE_OUT => UPDATE_OUT,
    CAPTURE_OUT => CAPTURE_OUT,
    SEL_OUT => SEL_OUT,
    DRCK_OUT => DRCK_OUT,
    TDO_IN => TDO_IN);

-- INST_TAG_END ------ End INSTANTIATION Template ------------

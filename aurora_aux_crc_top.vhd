------------------------------------------------------------------------------
-- Project:  Aurora 8B/10B
-- Version:  version 11.0
-- Company:  Xilinx 
--
--
-- (c) Copyright 2012 - 2013 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.

--
--------------------------------------------------------------------------------
--
-- Module CRC_TOP
-- Generated by Xilinx Aurora 8B10B
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity aurora_aux_CRC_TOP is
generic
  (
    CRC_INIT     : bit_vector := X"FFFF"
  );   
port 
  (
    CRCOUT       : out std_logic_vector(15 downto 0);
 
    CRCCLK       : in std_ulogic;
    CRCDATAVALID : in std_ulogic;
    CRCDATAWIDTH : in std_logic;
    CRCIN        : in std_logic_vector(15 downto 0);
    CRCRESET     : in std_ulogic
  );
end aurora_aux_CRC_TOP;
 
  architecture RTL of aurora_aux_CRC_TOP is

    -- Most significant bit first (big-endian)
    -- x^16+x^12+x^5+1 = (1) 0001 0000 0010 0001 = 0x1021
    constant POLYNOMIAL   : bit_vector := X"1021";
    constant DLY          : time := 1 ns;
   
    signal   data_width   : std_logic;
    signal   data_valid   : std_logic;
    signal   crcreset_int : std_logic;
    signal   crcreg       : std_logic_vector(15 downto 0);
    signal   crc_gen_out  : std_logic_vector(15 downto 0);
    signal   crc_data_i   : std_logic_vector(15 downto 0);
    signal   crc_initial  : std_logic_vector(15 downto 0);
    signal   poly_val     : std_logic_vector(15 downto 0);
    signal   CRCTKEEP     : std_logic_vector(1  downto 0);


  begin

  crcreset_int <= CRCRESET;

  crc_initial  <= To_StdLogicVector(CRC_INIT);
  poly_val     <= To_StdLogicVector(POLYNOMIAL);

  CRCOUT <= (not(crcreg(8)) & not(crcreg(9)) & not(crcreg(10)) & not(crcreg(11)) & not(crcreg(12)) & not(crcreg(13)) & not(crcreg(14)) & not(crcreg(15)) & not(crcreg(0)) & not(crcreg(1)) & not(crcreg(2)) & not(crcreg(3)) & not(crcreg(4)) & not(crcreg(5)) & not(crcreg(6)) & not(crcreg(7)));

  CRCTKEEP_CONV : process (CRCDATAWIDTH)
  begin
    case CRCDATAWIDTH is
      when '0'    => CRCTKEEP <= "01";
      when '1'    => CRCTKEEP <= "11";
      when others => CRCTKEEP <= "00";
    end case;
  end process CRCTKEEP_CONV;

  -- Register input data 
  CRCDATAIN_REG : process (CRCCLK)
  begin
    if (rising_edge(CRCCLK)) then
      if (CRCTKEEP(0) = '0') then 
         crc_data_i(15 downto 8) <= (others => '0') after DLY;
      else
         crc_data_i(15 downto 8) <= (CRCIN(8) & CRCIN(9) & CRCIN(10) & CRCIN(11) & CRCIN(12) & CRCIN(13) & CRCIN(14) & CRCIN(15)) after DLY;
      end if;

      if (CRCTKEEP(1) = '0') then
         crc_data_i(7 downto 0)  <= (others => '0') after DLY;
      else
         crc_data_i(7 downto 0)  <= (CRCIN(0) & CRCIN(1) & CRCIN(2) & CRCIN(3) & CRCIN(4) & CRCIN(5) & CRCIN(6) & CRCIN(7)) after DLY;
      end if;
    end if;
  end process CRCDATAIN_REG;

  LOCK_DATA_IN: process(CRCCLK)
    begin
      if (rising_edge(CRCCLK)) then
        data_valid <= CRCDATAVALID after DLY;
        data_width <= CRCDATAWIDTH after DLY;
      end if;
  end process;

   -- 16-bit CRC internal register
   INT_REG: process(CRCCLK)
    begin
      if (rising_edge(CRCCLK)) then
        if (crcreset_int = '1') then
          crcreg <= crc_initial after DLY;
        elsif (data_valid = '1') then
          crcreg <= crc_gen_out after DLY;
        end if;
      end if;
   end process;  

   --CRC Generator Logic
  CRC_GEN: process(crcreg, crc_data_i, data_width,poly_val)
    variable   msg     :  std_logic_vector(16 downto 0);
    begin
      msg(15 downto 0) := crcreg xor crc_data_i;

      --CRC-8
      if (data_width = '0') then
        for i in 0 to 7 loop
          msg := To_StdLogicVector((To_bitvector(msg)) sll 1);
          if (msg(16) = '1') then
            msg(15 downto 0) := msg(15 downto 0) xor poly_val;
          end if;
        end loop;
      
      --CRC-16
      else
        for i in 0 to 15 loop
          msg := To_StdLogicVector((To_bitvector(msg)) sll 1);
          if (msg(16) = '1') then
            msg(15 downto 0) := msg(15 downto 0) xor poly_val;
          end if;
        end loop;
      end if;
      crc_gen_out <= msg(15 downto 0);
    end process;
        
end RTL;

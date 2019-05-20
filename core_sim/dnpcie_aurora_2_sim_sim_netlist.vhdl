-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Mon May 20 10:20:10 2019
-- Host        : PHY-NC188089 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               V:/helix-mmerger-test/hdl/dnpcie_aurora_v2/core_sim/dnpcie_aurora_2_sim_sim_netlist.vhdl
-- Design      : dnpcie_aurora_2_sim
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku035-ffva1156-1-c
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_AXI_TO_LL is
  port (
    \tx_pe_data_v_r_reg[1]\ : out STD_LOGIC;
    new_pkt_r : in STD_LOGIC;
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_AXI_TO_LL : entity is "dnpcie_aurora_2_sim_AXI_TO_LL";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_AXI_TO_LL;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_AXI_TO_LL is
begin
new_pkt_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => new_pkt_r,
      Q => \tx_pe_data_v_r_reg[1]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_CHANNEL_ERR_DETECT is
  port (
    soft_err : out STD_LOGIC;
    hard_err : out STD_LOGIC;
    reset_channel_i : out STD_LOGIC;
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC;
    hard_err_i : in STD_LOGIC;
    lane_up : in STD_LOGIC;
    SYSTEM_RESET_reg : in STD_LOGIC;
    power_down : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_CHANNEL_ERR_DETECT : entity is "dnpcie_aurora_2_sim_CHANNEL_ERR_DETECT";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_CHANNEL_ERR_DETECT;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_CHANNEL_ERR_DETECT is
  signal RESET_CHANNEL0 : STD_LOGIC;
  signal channel_soft_err_c : STD_LOGIC;
  signal hard_err_r : STD_LOGIC;
  signal lane_up_r : STD_LOGIC;
  signal \^reset_channel_i\ : STD_LOGIC;
  signal soft_err_r : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  reset_channel_i <= \^reset_channel_i\;
CHANNEL_HARD_ERR_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => hard_err_r,
      Q => hard_err,
      R => '0'
    );
CHANNEL_SOFT_ERR_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => soft_err_r(1),
      I1 => soft_err_r(0),
      O => channel_soft_err_c
    );
CHANNEL_SOFT_ERR_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => channel_soft_err_c,
      Q => soft_err,
      R => '0'
    );
RESET_CHANNEL_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => power_down,
      I1 => lane_up_r,
      O => RESET_CHANNEL0
    );
RESET_CHANNEL_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => RESET_CHANNEL0,
      Q => \^reset_channel_i\,
      R => '0'
    );
hard_err_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => hard_err_i,
      Q => hard_err_r,
      R => '0'
    );
lane_up_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => lane_up,
      Q => lane_up_r,
      R => '0'
    );
\soft_err_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(1),
      Q => soft_err_r(1),
      R => '0'
    );
\soft_err_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(0),
      Q => soft_err_r(0),
      R => '0'
    );
verify_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^reset_channel_i\,
      I1 => SYSTEM_RESET_reg,
      O => SS(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_CHANNEL_INIT_SM is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    gen_ver_i : out STD_LOGIC;
    channel_up : out STD_LOGIC;
    start_rx_i : out STD_LOGIC;
    gtrxreset_i : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    \STORAGE_CE_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC;
    got_v_i : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    SYSTEM_RESET_reg : in STD_LOGIC;
    txver_count_r0 : in STD_LOGIC;
    reset_channel_i : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_CHANNEL_INIT_SM : entity is "dnpcie_aurora_2_sim_CHANNEL_INIT_SM";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_CHANNEL_INIT_SM;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_CHANNEL_INIT_SM is
  signal GTRXRESET_OUT_i_1_n_0 : STD_LOGIC;
  signal GTRXRESET_OUT_i_2_n_0 : STD_LOGIC;
  signal START_RX0 : STD_LOGIC;
  signal all_lanes_v_r : STD_LOGIC;
  signal bad_v_r : STD_LOGIC;
  signal bad_v_r0 : STD_LOGIC;
  signal \^channel_up\ : STD_LOGIC;
  signal free_count_r0 : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \free_count_r0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \free_count_r0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \free_count_r0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \free_count_r0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \free_count_r0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \free_count_r0_carry__0_n_5\ : STD_LOGIC;
  signal \free_count_r0_carry__0_n_6\ : STD_LOGIC;
  signal \free_count_r0_carry__0_n_7\ : STD_LOGIC;
  signal free_count_r0_carry_i_1_n_0 : STD_LOGIC;
  signal free_count_r0_carry_i_2_n_0 : STD_LOGIC;
  signal free_count_r0_carry_i_3_n_0 : STD_LOGIC;
  signal free_count_r0_carry_i_4_n_0 : STD_LOGIC;
  signal free_count_r0_carry_i_5_n_0 : STD_LOGIC;
  signal free_count_r0_carry_i_6_n_0 : STD_LOGIC;
  signal free_count_r0_carry_i_7_n_0 : STD_LOGIC;
  signal free_count_r0_carry_i_8_n_0 : STD_LOGIC;
  signal free_count_r0_carry_n_0 : STD_LOGIC;
  signal free_count_r0_carry_n_1 : STD_LOGIC;
  signal free_count_r0_carry_n_2 : STD_LOGIC;
  signal free_count_r0_carry_n_3 : STD_LOGIC;
  signal free_count_r0_carry_n_5 : STD_LOGIC;
  signal free_count_r0_carry_n_6 : STD_LOGIC;
  signal free_count_r0_carry_n_7 : STD_LOGIC;
  signal \free_count_r_reg__0\ : STD_LOGIC_VECTOR ( 0 to 13 );
  signal \^gen_ver_i\ : STD_LOGIC;
  signal got_first_v_r : STD_LOGIC;
  signal got_first_v_r_i_1_n_0 : STD_LOGIC;
  signal gtreset_c : STD_LOGIC;
  signal gtrxreset_extend_r : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gtrxreset_nxt : STD_LOGIC;
  signal next_ready_c : STD_LOGIC;
  signal next_verify_c : STD_LOGIC;
  signal p_2_out : STD_LOGIC_VECTOR ( 15 to 15 );
  signal ready_r : STD_LOGIC;
  signal ready_r2 : STD_LOGIC;
  signal reset_lanes_c : STD_LOGIC;
  signal \rxver_count_r_reg[1]_srl2_i_1_n_0\ : STD_LOGIC;
  signal \rxver_count_r_reg[1]_srl2_n_0\ : STD_LOGIC;
  signal \rxver_count_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \^start_rx_i\ : STD_LOGIC;
  signal \txver_count_r_reg[6]_srl7_n_0\ : STD_LOGIC;
  signal \txver_count_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \v_count_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal \v_count_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_1_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_2_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_3_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_i_4_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal \verify_watchdog_r_reg_n_0_[15]\ : STD_LOGIC;
  signal wait_for_lane_up_r : STD_LOGIC;
  signal NLW_free_count_r0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_free_count_r0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_free_count_r0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \free_count_r[13]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of got_first_v_r_i_1 : label is "soft_lutpair45";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gtreset_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of gtreset_flop_0_i : label is "FD";
  attribute SOFT_HLUTNM of \ready_r_i_1__0\ : label is "soft_lutpair47";
  attribute BOX_TYPE of reset_lanes_flop_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of reset_lanes_flop_i : label is "FD";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \rxver_count_r_reg[1]_srl2\ : label is "inst/\dnpcie_aurora_2_sim_global_logic_i/channel_init_sm_i/rxver_count_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \rxver_count_r_reg[1]_srl2\ : label is "inst/\dnpcie_aurora_2_sim_global_logic_i/channel_init_sm_i/rxver_count_r_reg[1]_srl2 ";
  attribute srl_bus_name of \txver_count_r_reg[6]_srl7\ : label is "inst/\dnpcie_aurora_2_sim_global_logic_i/channel_init_sm_i/txver_count_r_reg ";
  attribute srl_name of \txver_count_r_reg[6]_srl7\ : label is "inst/\dnpcie_aurora_2_sim_global_logic_i/channel_init_sm_i/txver_count_r_reg[6]_srl7 ";
  attribute srl_bus_name of \v_count_r_reg[14]_srl15\ : label is "inst/\dnpcie_aurora_2_sim_global_logic_i/channel_init_sm_i/v_count_r_reg ";
  attribute srl_name of \v_count_r_reg[14]_srl15\ : label is "inst/\dnpcie_aurora_2_sim_global_logic_i/channel_init_sm_i/v_count_r_reg[14]_srl15 ";
  attribute SOFT_HLUTNM of \v_count_r_reg[14]_srl15_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of verify_r_i_2 : label is "soft_lutpair47";
  attribute srl_bus_name of \verify_watchdog_r_reg[14]_srl15\ : label is "inst/\dnpcie_aurora_2_sim_global_logic_i/channel_init_sm_i/verify_watchdog_r_reg ";
  attribute srl_name of \verify_watchdog_r_reg[14]_srl15\ : label is "inst/\dnpcie_aurora_2_sim_global_logic_i/channel_init_sm_i/verify_watchdog_r_reg[14]_srl15 ";
  attribute SOFT_HLUTNM of \verify_watchdog_r_reg[14]_srl15_i_2\ : label is "soft_lutpair46";
begin
  channel_up <= \^channel_up\;
  gen_ver_i <= \^gen_ver_i\;
  start_rx_i <= \^start_rx_i\;
CHANNEL_UP_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => ready_r2,
      Q => \^channel_up\,
      R => '0'
    );
FRAME_ERR_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^start_rx_i\,
      O => \STORAGE_CE_reg[0]\(0)
    );
GTRXRESET_OUT_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => gtrxreset_extend_r(2),
      I1 => gtrxreset_extend_r(3),
      I2 => gtrxreset_extend_r(0),
      I3 => gtrxreset_extend_r(1),
      I4 => GTRXRESET_OUT_i_2_n_0,
      O => GTRXRESET_OUT_i_1_n_0
    );
GTRXRESET_OUT_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => gtrxreset_extend_r(5),
      I1 => gtrxreset_extend_r(4),
      I2 => gtrxreset_extend_r(7),
      I3 => gtrxreset_extend_r(6),
      O => GTRXRESET_OUT_i_2_n_0
    );
GTRXRESET_OUT_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => GTRXRESET_OUT_i_1_n_0,
      Q => gtrxreset_i,
      R => '0'
    );
START_RX_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => wait_for_lane_up_r,
      O => START_RX0
    );
START_RX_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => START_RX0,
      Q => \^start_rx_i\,
      R => SYSTEM_RESET_reg
    );
all_lanes_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => got_v_i,
      Q => all_lanes_v_r,
      R => '0'
    );
bad_v_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => got_first_v_r,
      I1 => all_lanes_v_r,
      I2 => \v_count_r_reg_n_0_[15]\,
      O => bad_v_r0
    );
bad_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => bad_v_r0,
      Q => bad_v_r,
      R => '0'
    );
do_nfc_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^channel_up\,
      O => p_0_in
    );
free_count_r0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => \free_count_r_reg__0\(13),
      CI_TOP => '0',
      CO(7) => free_count_r0_carry_n_0,
      CO(6) => free_count_r0_carry_n_1,
      CO(5) => free_count_r0_carry_n_2,
      CO(4) => free_count_r0_carry_n_3,
      CO(3) => NLW_free_count_r0_carry_CO_UNCONNECTED(3),
      CO(2) => free_count_r0_carry_n_5,
      CO(1) => free_count_r0_carry_n_6,
      CO(0) => free_count_r0_carry_n_7,
      DI(7) => \free_count_r_reg__0\(5),
      DI(6) => \free_count_r_reg__0\(6),
      DI(5) => \free_count_r_reg__0\(7),
      DI(4) => \free_count_r_reg__0\(8),
      DI(3) => \free_count_r_reg__0\(9),
      DI(2) => \free_count_r_reg__0\(10),
      DI(1) => \free_count_r_reg__0\(11),
      DI(0) => \free_count_r_reg__0\(12),
      O(7 downto 0) => free_count_r0(8 downto 1),
      S(7) => free_count_r0_carry_i_1_n_0,
      S(6) => free_count_r0_carry_i_2_n_0,
      S(5) => free_count_r0_carry_i_3_n_0,
      S(4) => free_count_r0_carry_i_4_n_0,
      S(3) => free_count_r0_carry_i_5_n_0,
      S(2) => free_count_r0_carry_i_6_n_0,
      S(1) => free_count_r0_carry_i_7_n_0,
      S(0) => free_count_r0_carry_i_8_n_0
    );
\free_count_r0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => free_count_r0_carry_n_0,
      CI_TOP => '0',
      CO(7 downto 3) => \NLW_free_count_r0_carry__0_CO_UNCONNECTED\(7 downto 3),
      CO(2) => \free_count_r0_carry__0_n_5\,
      CO(1) => \free_count_r0_carry__0_n_6\,
      CO(0) => \free_count_r0_carry__0_n_7\,
      DI(7 downto 4) => B"0000",
      DI(3) => \free_count_r_reg__0\(1),
      DI(2) => \free_count_r_reg__0\(2),
      DI(1) => \free_count_r_reg__0\(3),
      DI(0) => \free_count_r_reg__0\(4),
      O(7 downto 5) => \NLW_free_count_r0_carry__0_O_UNCONNECTED\(7 downto 5),
      O(4 downto 0) => free_count_r0(13 downto 9),
      S(7 downto 5) => B"000",
      S(4) => \free_count_r0_carry__0_i_1_n_0\,
      S(3) => \free_count_r0_carry__0_i_2_n_0\,
      S(2) => \free_count_r0_carry__0_i_3_n_0\,
      S(1) => \free_count_r0_carry__0_i_4_n_0\,
      S(0) => \free_count_r0_carry__0_i_5_n_0\
    );
\free_count_r0_carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(0),
      O => \free_count_r0_carry__0_i_1_n_0\
    );
\free_count_r0_carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(1),
      O => \free_count_r0_carry__0_i_2_n_0\
    );
\free_count_r0_carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(2),
      O => \free_count_r0_carry__0_i_3_n_0\
    );
\free_count_r0_carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(3),
      O => \free_count_r0_carry__0_i_4_n_0\
    );
\free_count_r0_carry__0_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(4),
      O => \free_count_r0_carry__0_i_5_n_0\
    );
free_count_r0_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(5),
      O => free_count_r0_carry_i_1_n_0
    );
free_count_r0_carry_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(6),
      O => free_count_r0_carry_i_2_n_0
    );
free_count_r0_carry_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(7),
      O => free_count_r0_carry_i_3_n_0
    );
free_count_r0_carry_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(8),
      O => free_count_r0_carry_i_4_n_0
    );
free_count_r0_carry_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(9),
      O => free_count_r0_carry_i_5_n_0
    );
free_count_r0_carry_i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(10),
      O => free_count_r0_carry_i_6_n_0
    );
free_count_r0_carry_i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(11),
      O => free_count_r0_carry_i_7_n_0
    );
free_count_r0_carry_i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(12),
      O => free_count_r0_carry_i_8_n_0
    );
\free_count_r[13]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \free_count_r_reg__0\(13),
      O => free_count_r0(0)
    );
\free_count_r_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(13),
      Q => \free_count_r_reg__0\(0),
      S => SS(0)
    );
\free_count_r_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(3),
      Q => \free_count_r_reg__0\(10),
      S => SS(0)
    );
\free_count_r_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(2),
      Q => \free_count_r_reg__0\(11),
      S => SS(0)
    );
\free_count_r_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(1),
      Q => \free_count_r_reg__0\(12),
      S => SS(0)
    );
\free_count_r_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(0),
      Q => \free_count_r_reg__0\(13),
      S => SS(0)
    );
\free_count_r_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(12),
      Q => \free_count_r_reg__0\(1),
      S => SS(0)
    );
\free_count_r_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(11),
      Q => \free_count_r_reg__0\(2),
      S => SS(0)
    );
\free_count_r_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(10),
      Q => \free_count_r_reg__0\(3),
      S => SS(0)
    );
\free_count_r_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(9),
      Q => \free_count_r_reg__0\(4),
      S => SS(0)
    );
\free_count_r_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(8),
      Q => \free_count_r_reg__0\(5),
      S => SS(0)
    );
\free_count_r_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(7),
      Q => \free_count_r_reg__0\(6),
      S => SS(0)
    );
\free_count_r_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(6),
      Q => \free_count_r_reg__0\(7),
      S => SS(0)
    );
\free_count_r_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(5),
      Q => \free_count_r_reg__0\(8),
      S => SS(0)
    );
\free_count_r_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => free_count_r0(4),
      Q => \free_count_r_reg__0\(9),
      S => SS(0)
    );
got_first_v_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \^gen_ver_i\,
      I1 => got_first_v_r,
      I2 => all_lanes_v_r,
      O => got_first_v_r_i_1_n_0
    );
got_first_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => got_first_v_r_i_1_n_0,
      Q => got_first_v_r,
      R => '0'
    );
gtreset_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gtreset_c,
      Q => gtrxreset_nxt,
      R => '0'
    );
gtreset_flop_0_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => \^gen_ver_i\,
      I1 => \verify_watchdog_r_reg_n_0_[15]\,
      I2 => \rxver_count_r_reg_n_0_[2]\,
      I3 => bad_v_r,
      O => gtreset_c
    );
\gtrxreset_extend_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gtrxreset_extend_r(1),
      Q => gtrxreset_extend_r(0),
      R => SYSTEM_RESET_reg
    );
\gtrxreset_extend_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gtrxreset_extend_r(2),
      Q => gtrxreset_extend_r(1),
      R => SYSTEM_RESET_reg
    );
\gtrxreset_extend_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gtrxreset_extend_r(3),
      Q => gtrxreset_extend_r(2),
      R => SYSTEM_RESET_reg
    );
\gtrxreset_extend_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gtrxreset_extend_r(4),
      Q => gtrxreset_extend_r(3),
      R => SYSTEM_RESET_reg
    );
\gtrxreset_extend_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gtrxreset_extend_r(5),
      Q => gtrxreset_extend_r(4),
      R => SYSTEM_RESET_reg
    );
\gtrxreset_extend_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gtrxreset_extend_r(6),
      Q => gtrxreset_extend_r(5),
      R => SYSTEM_RESET_reg
    );
\gtrxreset_extend_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gtrxreset_extend_r(7),
      Q => gtrxreset_extend_r(6),
      R => SYSTEM_RESET_reg
    );
\gtrxreset_extend_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gtrxreset_nxt,
      Q => gtrxreset_extend_r(7),
      R => SYSTEM_RESET_reg
    );
ready_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => ready_r,
      Q => ready_r2,
      R => '0'
    );
\ready_r_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EAAA"
    )
        port map (
      I0 => ready_r,
      I1 => \^gen_ver_i\,
      I2 => \rxver_count_r_reg_n_0_[2]\,
      I3 => \txver_count_r_reg_n_0_[7]\,
      O => next_ready_c
    );
ready_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => next_ready_c,
      Q => ready_r,
      R => SS(0)
    );
reset_lanes_flop_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => reset_lanes_c,
      Q => SR(0),
      R => '0'
    );
reset_lanes_flop_i_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => gtreset_c,
      I1 => reset_channel_i,
      I2 => wait_for_lane_up_r,
      I3 => SYSTEM_RESET_reg,
      O => reset_lanes_c
    );
\rxver_count_r_reg[1]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => \rxver_count_r_reg[1]_srl2_i_1_n_0\,
      CLK => user_clk,
      D => \^gen_ver_i\,
      Q => \rxver_count_r_reg[1]_srl2_n_0\
    );
\rxver_count_r_reg[1]_srl2_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => all_lanes_v_r,
      I1 => \v_count_r_reg_n_0_[15]\,
      I2 => \^gen_ver_i\,
      O => \rxver_count_r_reg[1]_srl2_i_1_n_0\
    );
\rxver_count_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \rxver_count_r_reg[1]_srl2_i_1_n_0\,
      D => \rxver_count_r_reg[1]_srl2_n_0\,
      Q => \rxver_count_r_reg_n_0_[2]\,
      R => '0'
    );
\txver_count_r_reg[6]_srl7\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => txver_count_r0,
      CLK => user_clk,
      D => \^gen_ver_i\,
      Q => \txver_count_r_reg[6]_srl7_n_0\
    );
\txver_count_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => txver_count_r0,
      D => \txver_count_r_reg[6]_srl7_n_0\,
      Q => \txver_count_r_reg_n_0_[7]\,
      R => '0'
    );
\v_count_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => user_clk,
      D => p_2_out(15),
      Q => \v_count_r_reg[14]_srl15_n_0\
    );
\v_count_r_reg[14]_srl15_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \v_count_r_reg_n_0_[15]\,
      I1 => \^gen_ver_i\,
      I2 => got_first_v_r,
      I3 => all_lanes_v_r,
      O => p_2_out(15)
    );
\v_count_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \v_count_r_reg[14]_srl15_n_0\,
      Q => \v_count_r_reg_n_0_[15]\,
      R => '0'
    );
verify_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFAA"
    )
        port map (
      I0 => wait_for_lane_up_r,
      I1 => \rxver_count_r_reg_n_0_[2]\,
      I2 => \txver_count_r_reg_n_0_[7]\,
      I3 => \^gen_ver_i\,
      O => next_verify_c
    );
verify_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => next_verify_c,
      Q => \^gen_ver_i\,
      R => SS(0)
    );
\verify_watchdog_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => \verify_watchdog_r_reg[14]_srl15_i_1_n_0\,
      CLK => user_clk,
      D => \^gen_ver_i\,
      Q => \verify_watchdog_r_reg[14]_srl15_n_0\
    );
\verify_watchdog_r_reg[14]_srl15_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10FF"
    )
        port map (
      I0 => \verify_watchdog_r_reg[14]_srl15_i_2_n_0\,
      I1 => \verify_watchdog_r_reg[14]_srl15_i_3_n_0\,
      I2 => \verify_watchdog_r_reg[14]_srl15_i_4_n_0\,
      I3 => \^gen_ver_i\,
      O => \verify_watchdog_r_reg[14]_srl15_i_1_n_0\
    );
\verify_watchdog_r_reg[14]_srl15_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \free_count_r_reg__0\(10),
      I1 => \free_count_r_reg__0\(11),
      I2 => \free_count_r_reg__0\(13),
      I3 => \free_count_r_reg__0\(12),
      O => \verify_watchdog_r_reg[14]_srl15_i_2_n_0\
    );
\verify_watchdog_r_reg[14]_srl15_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \free_count_r_reg__0\(8),
      I1 => \free_count_r_reg__0\(9),
      I2 => \free_count_r_reg__0\(6),
      I3 => \free_count_r_reg__0\(7),
      O => \verify_watchdog_r_reg[14]_srl15_i_3_n_0\
    );
\verify_watchdog_r_reg[14]_srl15_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \free_count_r_reg__0\(3),
      I1 => \free_count_r_reg__0\(4),
      I2 => \free_count_r_reg__0\(5),
      I3 => \free_count_r_reg__0\(2),
      I4 => \free_count_r_reg__0\(0),
      I5 => \free_count_r_reg__0\(1),
      O => \verify_watchdog_r_reg[14]_srl15_i_4_n_0\
    );
\verify_watchdog_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \verify_watchdog_r_reg[14]_srl15_i_1_n_0\,
      D => \verify_watchdog_r_reg[14]_srl15_n_0\,
      Q => \verify_watchdog_r_reg_n_0_[15]\,
      R => '0'
    );
wait_for_lane_up_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => SS(0),
      Q => wait_for_lane_up_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_ERR_DETECT_4BYTE is
  port (
    ready_r_reg0 : out STD_LOGIC;
    hard_err_i : out STD_LOGIC;
    \soft_err_r_reg[0]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC;
    hard_err_gt0 : in STD_LOGIC;
    reset_lanes_flop_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    enable_err_detect_i : in STD_LOGIC;
    ENABLE_ERR_DETECT_reg : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_ERR_DETECT_4BYTE : entity is "dnpcie_aurora_2_sim_ERR_DETECT_4BYTE";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_ERR_DETECT_4BYTE;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_ERR_DETECT_4BYTE is
  signal SOFT_ERR0 : STD_LOGIC;
  signal \SOFT_ERR[1]_i_1_n_0\ : STD_LOGIC;
  signal cnt_good_code_r : STD_LOGIC;
  signal cnt_good_code_r_i_3_n_0 : STD_LOGIC;
  signal cnt_good_code_r_i_4_n_0 : STD_LOGIC;
  signal cnt_soft_err_r : STD_LOGIC;
  signal err_cnt_r : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \err_cnt_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \err_cnt_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \err_cnt_r[2]_i_2_n_0\ : STD_LOGIC;
  signal \err_cnt_r[2]_i_3_n_0\ : STD_LOGIC;
  signal err_cnt_r_0 : STD_LOGIC;
  signal \good_cnt_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \good_cnt_r_reg__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hard_err_frm_soft_err : STD_LOGIC;
  signal hard_err_gt : STD_LOGIC;
  signal next_good_code_c : STD_LOGIC;
  signal next_soft_err_c : STD_LOGIC;
  signal next_start_c : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \soft_err_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \soft_err_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \soft_err_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \soft_err_r_reg_n_0_[3]\ : STD_LOGIC;
  signal start_r : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \SOFT_ERR[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of align_r_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of cnt_good_code_r_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of cnt_good_code_r_i_3 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of cnt_good_code_r_i_4 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of cnt_soft_err_r_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \err_cnt_r[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \err_cnt_r[2]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \err_cnt_r[2]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \good_cnt_r[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \good_cnt_r[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \good_cnt_r[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \good_cnt_r[3]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of hard_err_r_i_1 : label is "soft_lutpair3";
begin
\SOFT_ERR[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \soft_err_r_reg_n_0_[0]\,
      I1 => \soft_err_r_reg_n_0_[1]\,
      O => SOFT_ERR0
    );
\SOFT_ERR[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \soft_err_r_reg_n_0_[2]\,
      I1 => \soft_err_r_reg_n_0_[3]\,
      O => \SOFT_ERR[1]_i_1_n_0\
    );
\SOFT_ERR_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => SOFT_ERR0,
      Q => \soft_err_r_reg[0]_0\(1),
      R => '0'
    );
\SOFT_ERR_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \SOFT_ERR[1]_i_1_n_0\,
      Q => \soft_err_r_reg[0]_0\(0),
      R => '0'
    );
align_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFAE"
    )
        port map (
      I0 => reset_lanes_flop_i(0),
      I1 => p_0_in,
      I2 => hard_err_frm_soft_err,
      I3 => hard_err_gt,
      O => ready_r_reg0
    );
cnt_good_code_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA80"
    )
        port map (
      I0 => cnt_good_code_r_i_3_n_0,
      I1 => cnt_good_code_r_i_4_n_0,
      I2 => cnt_good_code_r,
      I3 => cnt_soft_err_r,
      O => next_good_code_c
    );
cnt_good_code_r_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \soft_err_r_reg_n_0_[1]\,
      I1 => \soft_err_r_reg_n_0_[0]\,
      I2 => \soft_err_r_reg_n_0_[3]\,
      I3 => \soft_err_r_reg_n_0_[2]\,
      O => cnt_good_code_r_i_3_n_0
    );
cnt_good_code_r_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \good_cnt_r_reg__0\(2),
      I1 => \good_cnt_r_reg__0\(0),
      I2 => \good_cnt_r_reg__0\(1),
      I3 => \good_cnt_r_reg__0\(3),
      O => cnt_good_code_r_i_4_n_0
    );
cnt_good_code_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => next_good_code_c,
      Q => cnt_good_code_r,
      R => SR(0)
    );
cnt_soft_err_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
        port map (
      I0 => cnt_soft_err_r,
      I1 => start_r,
      I2 => cnt_good_code_r,
      I3 => cnt_good_code_r_i_3_n_0,
      O => next_soft_err_c
    );
cnt_soft_err_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => next_soft_err_c,
      Q => cnt_soft_err_r,
      R => SR(0)
    );
\err_cnt_r[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => err_cnt_r(0),
      O => \err_cnt_r[0]_i_1_n_0\
    );
\err_cnt_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"68"
    )
        port map (
      I0 => \err_cnt_r[2]_i_3_n_0\,
      I1 => err_cnt_r(0),
      I2 => err_cnt_r(1),
      O => \err_cnt_r[1]_i_1_n_0\
    );
\err_cnt_r[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F00E"
    )
        port map (
      I0 => err_cnt_r(0),
      I1 => err_cnt_r(1),
      I2 => cnt_soft_err_r,
      I3 => \err_cnt_r[2]_i_3_n_0\,
      I4 => p_0_in,
      O => err_cnt_r_0
    );
\err_cnt_r[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => err_cnt_r(1),
      I1 => err_cnt_r(0),
      I2 => \err_cnt_r[2]_i_3_n_0\,
      O => \err_cnt_r[2]_i_2_n_0\
    );
\err_cnt_r[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EEEF"
    )
        port map (
      I0 => \good_cnt_r_reg__0\(1),
      I1 => \good_cnt_r_reg__0\(0),
      I2 => \good_cnt_r_reg__0\(3),
      I3 => \good_cnt_r_reg__0\(2),
      O => \err_cnt_r[2]_i_3_n_0\
    );
\err_cnt_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => err_cnt_r_0,
      D => \err_cnt_r[0]_i_1_n_0\,
      Q => err_cnt_r(0),
      R => SR(0)
    );
\err_cnt_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => err_cnt_r_0,
      D => \err_cnt_r[1]_i_1_n_0\,
      Q => err_cnt_r(1),
      R => SR(0)
    );
\err_cnt_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => err_cnt_r_0,
      D => \err_cnt_r[2]_i_2_n_0\,
      Q => p_0_in,
      R => SR(0)
    );
\good_cnt_r[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \good_cnt_r_reg__0\(0),
      O => \p_0_in__0\(0)
    );
\good_cnt_r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \good_cnt_r_reg__0\(0),
      I1 => \good_cnt_r_reg__0\(1),
      O => \p_0_in__0\(1)
    );
\good_cnt_r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \good_cnt_r_reg__0\(2),
      I1 => \good_cnt_r_reg__0\(0),
      I2 => \good_cnt_r_reg__0\(1),
      O => \p_0_in__0\(2)
    );
\good_cnt_r[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => start_r,
      I1 => cnt_soft_err_r,
      I2 => enable_err_detect_i,
      I3 => cnt_good_code_r,
      O => \good_cnt_r[3]_i_1_n_0\
    );
\good_cnt_r[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \good_cnt_r_reg__0\(3),
      I1 => \good_cnt_r_reg__0\(1),
      I2 => \good_cnt_r_reg__0\(0),
      I3 => \good_cnt_r_reg__0\(2),
      O => \p_0_in__0\(3)
    );
\good_cnt_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \p_0_in__0\(0),
      Q => \good_cnt_r_reg__0\(0),
      R => \good_cnt_r[3]_i_1_n_0\
    );
\good_cnt_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \p_0_in__0\(1),
      Q => \good_cnt_r_reg__0\(1),
      R => \good_cnt_r[3]_i_1_n_0\
    );
\good_cnt_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \p_0_in__0\(2),
      Q => \good_cnt_r_reg__0\(2),
      R => \good_cnt_r[3]_i_1_n_0\
    );
\good_cnt_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \p_0_in__0\(3),
      Q => \good_cnt_r_reg__0\(3),
      R => \good_cnt_r[3]_i_1_n_0\
    );
hard_err_frm_soft_err_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_0_in,
      Q => hard_err_frm_soft_err,
      R => SR(0)
    );
hard_err_gt_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => hard_err_gt0,
      Q => hard_err_gt,
      R => SR(0)
    );
hard_err_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => hard_err_gt,
      I1 => hard_err_frm_soft_err,
      I2 => p_0_in,
      O => hard_err_i
    );
\soft_err_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => ENABLE_ERR_DETECT_reg(3),
      Q => \soft_err_r_reg_n_0_[0]\,
      R => '0'
    );
\soft_err_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => ENABLE_ERR_DETECT_reg(2),
      Q => \soft_err_r_reg_n_0_[1]\,
      R => '0'
    );
\soft_err_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => ENABLE_ERR_DETECT_reg(1),
      Q => \soft_err_r_reg_n_0_[2]\,
      R => '0'
    );
\soft_err_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => ENABLE_ERR_DETECT_reg(0),
      Q => \soft_err_r_reg_n_0_[3]\,
      R => '0'
    );
start_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8A88"
    )
        port map (
      I0 => cnt_good_code_r_i_3_n_0,
      I1 => start_r,
      I2 => cnt_good_code_r_i_4_n_0,
      I3 => cnt_good_code_r,
      O => next_start_c
    );
start_r_reg: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => next_start_c,
      Q => start_r,
      S => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_IDLE_AND_VER_GEN is
  port (
    \gen_v_r_reg[1]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gen_a_i : out STD_LOGIC;
    \gen_k_r_reg[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \gen_r_r_reg[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    txver_count_r0 : out STD_LOGIC;
    user_clk : in STD_LOGIC;
    gen_ver_i : in STD_LOGIC;
    SYSTEM_RESET_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_IDLE_AND_VER_GEN : entity is "dnpcie_aurora_2_sim_IDLE_AND_VER_GEN";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_IDLE_AND_VER_GEN;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_IDLE_AND_VER_GEN is
  signal did_ver_i : STD_LOGIC;
  signal down_count_r : STD_LOGIC_VECTOR ( 0 to 2 );
  signal \down_count_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \down_count_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \downcounter_r_reg_n_0_[2]\ : STD_LOGIC;
  signal gen_a_flop_c : STD_LOGIC;
  signal gen_k_flop_c_0 : STD_LOGIC;
  signal gen_k_flop_c_1 : STD_LOGIC;
  signal gen_k_flop_c_2 : STD_LOGIC;
  signal gen_k_flop_c_3 : STD_LOGIC;
  signal gen_r_flop_c_0 : STD_LOGIC;
  signal gen_r_flop_c_2 : STD_LOGIC;
  signal gen_r_flop_c_3 : STD_LOGIC;
  signal insert_ver_c : STD_LOGIC;
  signal \lfsr_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal prev_cycle_gen_ver_r : STD_LOGIC;
  signal recycle_gen_ver_c : STD_LOGIC;
  signal ver_counter_c : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \down_count_r[0]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \down_count_r[1]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \downcounter_r[0]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \downcounter_r[1]_i_1\ : label is "soft_lutpair50";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gen_a_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of gen_a_flop_0_i : label is "FD";
  attribute SOFT_HLUTNM of gen_a_flop_0_i_i_1 : label is "soft_lutpair48";
  attribute BOX_TYPE of gen_k_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_k_flop_0_i : label is "FD";
  attribute BOX_TYPE of gen_k_flop_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_k_flop_1_i : label is "FD";
  attribute BOX_TYPE of gen_k_flop_2_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_k_flop_2_i : label is "FD";
  attribute BOX_TYPE of gen_k_flop_3_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_k_flop_3_i : label is "FD";
  attribute SOFT_HLUTNM of gen_k_flop_3_i_i_1 : label is "soft_lutpair52";
  attribute BOX_TYPE of gen_r_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_r_flop_0_i : label is "FD";
  attribute BOX_TYPE of gen_r_flop_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_r_flop_1_i : label is "FD";
  attribute BOX_TYPE of gen_r_flop_2_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_r_flop_2_i : label is "FD";
  attribute BOX_TYPE of gen_r_flop_3_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_r_flop_3_i : label is "FD";
  attribute BOX_TYPE of gen_v_flop_1_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_v_flop_1_i : label is "FD";
  attribute SOFT_HLUTNM of gen_v_flop_1_i_i_1 : label is "soft_lutpair51";
  attribute BOX_TYPE of gen_v_flop_2_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_v_flop_2_i : label is "FD";
  attribute BOX_TYPE of gen_v_flop_3_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of gen_v_flop_3_i : label is "FD";
  attribute SOFT_HLUTNM of \lfsr_reg[3]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \txver_count_r_reg[6]_srl7_i_1\ : label is "soft_lutpair48";
  attribute BOX_TYPE of ver_counter_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of ver_counter_i : label is "SRL16";
  attribute srl_name : string;
  attribute srl_name of ver_counter_i : label is "inst/\dnpcie_aurora_2_sim_global_logic_i/idle_and_ver_gen_i/ver_counter_i ";
  attribute SOFT_HLUTNM of ver_counter_i_i_1 : label is "soft_lutpair51";
begin
DID_VER_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => ver_counter_c,
      Q => did_ver_i,
      R => '0'
    );
\down_count_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => gen_r_flop_c_0,
      I1 => p_2_in,
      O => \down_count_r[0]_i_1_n_0\
    );
\down_count_r[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => gen_r_flop_c_0,
      I1 => p_2_in,
      O => \down_count_r[1]_i_1_n_0\
    );
\down_count_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => \down_count_r[0]_i_1_n_0\,
      Q => down_count_r(0),
      R => '0'
    );
\down_count_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => \down_count_r[1]_i_1_n_0\,
      Q => down_count_r(1),
      R => '0'
    );
\down_count_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_k_flop_c_0,
      Q => down_count_r(2),
      R => '0'
    );
\downcounter_r[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FC02"
    )
        port map (
      I0 => down_count_r(0),
      I1 => \downcounter_r_reg_n_0_[1]\,
      I2 => \downcounter_r_reg_n_0_[2]\,
      I3 => \downcounter_r_reg_n_0_[0]\,
      O => \downcounter_r[0]_i_1_n_0\
    );
\downcounter_r[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C3C2"
    )
        port map (
      I0 => down_count_r(1),
      I1 => \downcounter_r_reg_n_0_[1]\,
      I2 => \downcounter_r_reg_n_0_[2]\,
      I3 => \downcounter_r_reg_n_0_[0]\,
      O => \downcounter_r[1]_i_1_n_0\
    );
\downcounter_r[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F0E"
    )
        port map (
      I0 => down_count_r(2),
      I1 => \downcounter_r_reg_n_0_[1]\,
      I2 => \downcounter_r_reg_n_0_[2]\,
      I3 => \downcounter_r_reg_n_0_[0]\,
      O => \downcounter_r[2]_i_1_n_0\
    );
\downcounter_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => \downcounter_r[0]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[0]\,
      R => SYSTEM_RESET_reg
    );
\downcounter_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => \downcounter_r[1]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[1]\,
      R => SYSTEM_RESET_reg
    );
\downcounter_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => \downcounter_r[2]_i_1_n_0\,
      Q => \downcounter_r_reg_n_0_[2]\,
      R => SYSTEM_RESET_reg
    );
gen_a_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_a_flop_c,
      Q => gen_a_i,
      R => '0'
    );
gen_a_flop_0_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010101"
    )
        port map (
      I0 => \downcounter_r_reg_n_0_[0]\,
      I1 => \downcounter_r_reg_n_0_[2]\,
      I2 => \downcounter_r_reg_n_0_[1]\,
      I3 => gen_ver_i,
      I4 => did_ver_i,
      O => gen_a_flop_c
    );
gen_k_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_k_flop_c_3,
      Q => \gen_k_r_reg[0]\(3),
      R => '0'
    );
gen_k_flop_0_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D5D5D5D5D5D5D5C0"
    )
        port map (
      I0 => p_1_in,
      I1 => did_ver_i,
      I2 => gen_ver_i,
      I3 => \downcounter_r_reg_n_0_[1]\,
      I4 => \downcounter_r_reg_n_0_[2]\,
      I5 => \downcounter_r_reg_n_0_[0]\,
      O => gen_k_flop_c_3
    );
gen_k_flop_1_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_k_flop_c_2,
      Q => \gen_k_r_reg[0]\(2),
      R => '0'
    );
gen_k_flop_1_i_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => gen_r_flop_c_2,
      O => gen_k_flop_c_2
    );
gen_k_flop_2_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_k_flop_c_1,
      Q => \gen_k_r_reg[0]\(1),
      R => '0'
    );
gen_k_flop_2_i_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_2_in,
      O => gen_k_flop_c_1
    );
gen_k_flop_3_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_k_flop_c_0,
      Q => \gen_k_r_reg[0]\(0),
      R => '0'
    );
gen_k_flop_3_i_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => gen_r_flop_c_0,
      O => gen_k_flop_c_0
    );
gen_r_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_r_flop_c_3,
      Q => \gen_r_r_reg[0]\(3),
      R => '0'
    );
gen_r_flop_0_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FE00FE00FE00"
    )
        port map (
      I0 => \downcounter_r_reg_n_0_[0]\,
      I1 => \downcounter_r_reg_n_0_[2]\,
      I2 => \downcounter_r_reg_n_0_[1]\,
      I3 => p_1_in,
      I4 => did_ver_i,
      I5 => gen_ver_i,
      O => gen_r_flop_c_3
    );
gen_r_flop_1_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_r_flop_c_2,
      Q => \gen_r_r_reg[0]\(2),
      R => '0'
    );
gen_r_flop_2_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => p_2_in,
      Q => \gen_r_r_reg[0]\(1),
      R => '0'
    );
gen_r_flop_3_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_r_flop_c_0,
      Q => \gen_r_r_reg[0]\(0),
      R => '0'
    );
gen_v_flop_1_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => recycle_gen_ver_c,
      Q => \gen_v_r_reg[1]\(2),
      R => '0'
    );
gen_v_flop_1_i_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => did_ver_i,
      I1 => gen_ver_i,
      O => recycle_gen_ver_c
    );
gen_v_flop_2_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => recycle_gen_ver_c,
      Q => \gen_v_r_reg[1]\(1),
      R => '0'
    );
gen_v_flop_3_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => recycle_gen_ver_c,
      Q => \gen_v_r_reg[1]\(0),
      R => '0'
    );
\lfsr_reg[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55A9"
    )
        port map (
      I0 => p_1_in,
      I1 => p_2_in,
      I2 => gen_r_flop_c_2,
      I3 => gen_r_flop_c_0,
      O => \lfsr_reg[3]_i_1_n_0\
    );
\lfsr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_r_flop_c_2,
      Q => p_1_in,
      R => '0'
    );
\lfsr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => p_2_in,
      Q => gen_r_flop_c_2,
      R => '0'
    );
\lfsr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gen_r_flop_c_0,
      Q => p_2_in,
      R => '0'
    );
\lfsr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => \lfsr_reg[3]_i_1_n_0\,
      Q => gen_r_flop_c_0,
      R => '0'
    );
prev_cycle_gen_ver_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_ver_i,
      Q => prev_cycle_gen_ver_r,
      R => '0'
    );
\txver_count_r_reg[6]_srl7_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => did_ver_i,
      I1 => gen_ver_i,
      O => txver_count_r0
    );
ver_counter_i: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => user_clk,
      D => insert_ver_c,
      Q => ver_counter_c
    );
ver_counter_i_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => gen_ver_i,
      I1 => did_ver_i,
      I2 => prev_cycle_gen_ver_r,
      O => insert_ver_c
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LANE_INIT_SM_4BYTE is
  port (
    lane_up : out STD_LOGIC;
    ready_r : out STD_LOGIC;
    align_r_reg_0 : out STD_LOGIC;
    gen_spa_i : out STD_LOGIC;
    consecutive_commas_r : out STD_LOGIC;
    begin_r : out STD_LOGIC;
    enable_err_detect_i : out STD_LOGIC;
    rxpolarity_in : out STD_LOGIC_VECTOR ( 0 to 0 );
    GEN_SP : out STD_LOGIC;
    hard_err_frm_soft_err_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    \left_align_select_r_reg[1]\ : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC;
    ready_r_reg0 : in STD_LOGIC;
    counter4_r0 : in STD_LOGIC;
    counter3_r0 : in STD_LOGIC;
    gen_spa_r : in STD_LOGIC;
    rxbyterealign_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    RX_NEG : in STD_LOGIC;
    gtrxreset_out_reg : in STD_LOGIC;
    consecutive_commas_r_reg_0 : in STD_LOGIC;
    rxctrl0_out : in STD_LOGIC_VECTOR ( 1 downto 0 );
    first_v_received_r : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LANE_INIT_SM_4BYTE : entity is "dnpcie_aurora_2_sim_LANE_INIT_SM_4BYTE";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LANE_INIT_SM_4BYTE;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LANE_INIT_SM_4BYTE is
  signal ENABLE_ERR_DETECT0 : STD_LOGIC;
  signal \RX_CHAR_IS_COMMA_R_reg_n_0_[0]\ : STD_LOGIC;
  signal \RX_CHAR_IS_COMMA_R_reg_n_0_[3]\ : STD_LOGIC;
  signal \^align_r_reg_0\ : STD_LOGIC;
  signal \^begin_r\ : STD_LOGIC;
  signal begin_r_i_2_n_0 : STD_LOGIC;
  signal consecutive_commas_r0 : STD_LOGIC;
  signal count_128d_done_r : STD_LOGIC;
  signal count_32d_done_r : STD_LOGIC;
  signal count_8d_done_r : STD_LOGIC;
  signal counter1_r0 : STD_LOGIC;
  signal \counter1_r[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter1_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \counter1_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \counter2_r_reg[14]_srl14_n_0\ : STD_LOGIC;
  signal \counter2_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \counter3_r_reg[2]_srl3_n_0\ : STD_LOGIC;
  signal \counter3_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter4_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal \counter4_r_reg_n_0_[15]\ : STD_LOGIC;
  signal counter5_r0 : STD_LOGIC;
  signal \counter5_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal \counter5_r_reg_n_0_[15]\ : STD_LOGIC;
  signal do_watchdog_count_r : STD_LOGIC;
  signal do_watchdog_count_r0 : STD_LOGIC;
  signal \^enable_err_detect_i\ : STD_LOGIC;
  signal \^gen_spa_i\ : STD_LOGIC;
  signal next_ack_c : STD_LOGIC;
  signal next_align_c : STD_LOGIC;
  signal next_begin_c : STD_LOGIC;
  signal next_polarity_c : STD_LOGIC;
  signal next_ready_c : STD_LOGIC;
  signal next_realign_c : STD_LOGIC;
  signal next_rst_c : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_0_in2_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal polarity_r : STD_LOGIC;
  signal prev_count_128d_done_r : STD_LOGIC;
  signal \^ready_r\ : STD_LOGIC;
  signal realign_r : STD_LOGIC;
  signal reset_count_r : STD_LOGIC;
  signal reset_count_r0 : STD_LOGIC;
  signal rx_polarity_r_i_1_n_0 : STD_LOGIC;
  signal \^rxpolarity_in\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal tx_reset_i : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ENABLE_ERR_DETECT_i_1 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of align_r_i_2 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of begin_r_i_2 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \counter1_r[0]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \counter1_r[0]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter1_r[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \counter1_r[3]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter1_r[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \counter1_r[5]_i_1\ : label is "soft_lutpair12";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \counter2_r_reg[14]_srl14\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_lane_init_sm_4byte_i/counter2_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \counter2_r_reg[14]_srl14\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_lane_init_sm_4byte_i/counter2_r_reg[14]_srl14 ";
  attribute srl_bus_name of \counter3_r_reg[2]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_lane_init_sm_4byte_i/counter3_r_reg ";
  attribute srl_name of \counter3_r_reg[2]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_lane_init_sm_4byte_i/counter3_r_reg[2]_srl3 ";
  attribute srl_bus_name of \counter4_r_reg[14]_srl15\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_lane_init_sm_4byte_i/counter4_r_reg ";
  attribute srl_name of \counter4_r_reg[14]_srl15\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_lane_init_sm_4byte_i/counter4_r_reg[14]_srl15 ";
  attribute srl_bus_name of \counter5_r_reg[14]_srl15\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_lane_init_sm_4byte_i/counter5_r_reg ";
  attribute srl_name of \counter5_r_reg[14]_srl15\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_lane_init_sm_4byte_i/counter5_r_reg[14]_srl15 ";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of lane_up_flop_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of lane_up_flop_i : label is "FDR";
  attribute SOFT_HLUTNM of polarity_r_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of realign_r_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of rst_r_i_1 : label is "soft_lutpair13";
begin
  align_r_reg_0 <= \^align_r_reg_0\;
  begin_r <= \^begin_r\;
  enable_err_detect_i <= \^enable_err_detect_i\;
  gen_spa_i <= \^gen_spa_i\;
  ready_r <= \^ready_r\;
  rxpolarity_in(0) <= \^rxpolarity_in\(0);
ENABLE_ERR_DETECT_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^gen_spa_i\,
      I1 => \^ready_r\,
      O => ENABLE_ERR_DETECT0
    );
ENABLE_ERR_DETECT_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => ENABLE_ERR_DETECT0,
      Q => \^enable_err_detect_i\,
      R => '0'
    );
\RX_CHAR_IS_COMMA_R_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(0),
      Q => \RX_CHAR_IS_COMMA_R_reg_n_0_[0]\,
      R => '0'
    );
\RX_CHAR_IS_COMMA_R_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(1),
      Q => p_1_in,
      R => '0'
    );
\RX_CHAR_IS_COMMA_R_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(2),
      Q => p_0_in2_in,
      R => '0'
    );
\RX_CHAR_IS_COMMA_R_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(3),
      Q => \RX_CHAR_IS_COMMA_R_reg_n_0_[3]\,
      R => '0'
    );
ack_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0444FFFF04440444"
    )
        port map (
      I0 => \counter5_r_reg_n_0_[15]\,
      I1 => \^gen_spa_i\,
      I2 => \counter2_r_reg_n_0_[15]\,
      I3 => \counter3_r_reg_n_0_[3]\,
      I4 => RX_NEG,
      I5 => polarity_r,
      O => next_ack_c
    );
ack_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => next_ack_c,
      Q => \^gen_spa_i\,
      R => ready_r_reg0
    );
align_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F444"
    )
        port map (
      I0 => count_128d_done_r,
      I1 => \^align_r_reg_0\,
      I2 => tx_reset_i,
      I3 => count_8d_done_r,
      O => next_align_c
    );
align_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => next_align_c,
      Q => \^align_r_reg_0\,
      R => ready_r_reg0
    );
begin_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => rxbyterealign_out(0),
      I1 => realign_r,
      I2 => polarity_r,
      I3 => RX_NEG,
      I4 => begin_r_i_2_n_0,
      O => next_begin_c
    );
begin_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^gen_spa_i\,
      I1 => \counter5_r_reg_n_0_[15]\,
      I2 => \counter4_r_reg_n_0_[15]\,
      I3 => \^ready_r\,
      O => begin_r_i_2_n_0
    );
begin_r_reg: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => next_begin_c,
      Q => \^begin_r\,
      S => ready_r_reg0
    );
cnt_good_code_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^enable_err_detect_i\,
      O => hard_err_frm_soft_err_reg(0)
    );
consecutive_commas_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
        port map (
      I0 => \^align_r_reg_0\,
      I1 => p_0_in2_in,
      I2 => \RX_CHAR_IS_COMMA_R_reg_n_0_[0]\,
      I3 => \RX_CHAR_IS_COMMA_R_reg_n_0_[3]\,
      I4 => p_1_in,
      O => consecutive_commas_r0
    );
consecutive_commas_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => consecutive_commas_r0,
      Q => consecutive_commas_r,
      R => '0'
    );
\counter1_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^ready_r\,
      I1 => reset_count_r,
      O => counter1_r0
    );
\counter1_r[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A6AA"
    )
        port map (
      I0 => count_128d_done_r,
      I1 => count_32d_done_r,
      I2 => \counter1_r[0]_i_3_n_0\,
      I3 => \counter1_r_reg_n_0_[1]\,
      O => p_0_in(7)
    );
\counter1_r[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => count_8d_done_r,
      I1 => \counter1_r_reg_n_0_[6]\,
      I2 => \counter1_r_reg_n_0_[7]\,
      I3 => \counter1_r_reg_n_0_[5]\,
      I4 => \counter1_r_reg_n_0_[3]\,
      O => \counter1_r[0]_i_3_n_0\
    );
\counter1_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[1]\,
      I1 => \counter1_r[0]_i_3_n_0\,
      I2 => count_32d_done_r,
      O => p_0_in(6)
    );
\counter1_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => count_32d_done_r,
      I1 => \counter1_r_reg_n_0_[3]\,
      I2 => \counter1_r_reg_n_0_[5]\,
      I3 => \counter1_r_reg_n_0_[7]\,
      I4 => \counter1_r_reg_n_0_[6]\,
      I5 => count_8d_done_r,
      O => \counter1_r[2]_i_1_n_0\
    );
\counter1_r[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[3]\,
      I1 => \counter1_r_reg_n_0_[5]\,
      I2 => \counter1_r_reg_n_0_[7]\,
      I3 => \counter1_r_reg_n_0_[6]\,
      I4 => count_8d_done_r,
      O => p_0_in(4)
    );
\counter1_r[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => count_8d_done_r,
      I1 => \counter1_r_reg_n_0_[6]\,
      I2 => \counter1_r_reg_n_0_[7]\,
      I3 => \counter1_r_reg_n_0_[5]\,
      O => p_0_in(3)
    );
\counter1_r[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[5]\,
      I1 => \counter1_r_reg_n_0_[7]\,
      I2 => \counter1_r_reg_n_0_[6]\,
      O => p_0_in(2)
    );
\counter1_r[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[7]\,
      I1 => \counter1_r_reg_n_0_[6]\,
      O => p_0_in(1)
    );
\counter1_r[7]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter1_r_reg_n_0_[7]\,
      O => p_0_in(0)
    );
\counter1_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => consecutive_commas_r0,
      D => p_0_in(7),
      Q => count_128d_done_r,
      R => counter1_r0
    );
\counter1_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => consecutive_commas_r0,
      D => p_0_in(6),
      Q => \counter1_r_reg_n_0_[1]\,
      R => counter1_r0
    );
\counter1_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => consecutive_commas_r0,
      D => \counter1_r[2]_i_1_n_0\,
      Q => count_32d_done_r,
      R => counter1_r0
    );
\counter1_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => consecutive_commas_r0,
      D => p_0_in(4),
      Q => \counter1_r_reg_n_0_[3]\,
      R => counter1_r0
    );
\counter1_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => consecutive_commas_r0,
      D => p_0_in(3),
      Q => count_8d_done_r,
      R => counter1_r0
    );
\counter1_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => consecutive_commas_r0,
      D => p_0_in(2),
      Q => \counter1_r_reg_n_0_[5]\,
      R => counter1_r0
    );
\counter1_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => consecutive_commas_r0,
      D => p_0_in(1),
      Q => \counter1_r_reg_n_0_[6]\,
      R => counter1_r0
    );
\counter1_r_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => user_clk,
      CE => consecutive_commas_r0,
      D => p_0_in(0),
      Q => \counter1_r_reg_n_0_[7]\,
      S => counter1_r0
    );
\counter2_r_reg[14]_srl14\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => user_clk,
      D => gen_spa_r,
      Q => \counter2_r_reg[14]_srl14_n_0\
    );
\counter2_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \counter2_r_reg[14]_srl14_n_0\,
      Q => \counter2_r_reg_n_0_[15]\,
      R => '0'
    );
\counter3_r_reg[2]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => counter3_r0,
      CLK => user_clk,
      D => \^gen_spa_i\,
      Q => \counter3_r_reg[2]_srl3_n_0\
    );
\counter3_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => counter3_r0,
      D => \counter3_r_reg[2]_srl3_n_0\,
      Q => \counter3_r_reg_n_0_[3]\,
      R => '0'
    );
\counter4_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => counter4_r0,
      CLK => user_clk,
      D => \^ready_r\,
      Q => \counter4_r_reg[14]_srl15_n_0\
    );
\counter4_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => counter4_r0,
      D => \counter4_r_reg[14]_srl15_n_0\,
      Q => \counter4_r_reg_n_0_[15]\,
      R => '0'
    );
\counter5_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => counter5_r0,
      CLK => user_clk,
      D => \^gen_spa_i\,
      Q => \counter5_r_reg[14]_srl15_n_0\
    );
\counter5_r_reg[14]_srl15_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => do_watchdog_count_r,
      I1 => \^gen_spa_i\,
      O => counter5_r0
    );
\counter5_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => counter5_r0,
      D => \counter5_r_reg[14]_srl15_n_0\,
      Q => \counter5_r_reg_n_0_[15]\,
      R => '0'
    );
do_watchdog_count_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count_128d_done_r,
      I1 => prev_count_128d_done_r,
      O => do_watchdog_count_r0
    );
do_watchdog_count_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => do_watchdog_count_r0,
      Q => do_watchdog_count_r,
      R => '0'
    );
gen_sp_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^ready_r\,
      I1 => \^gen_spa_i\,
      O => GEN_SP
    );
lane_up_flop_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => \^ready_r\,
      Q => lane_up,
      R => SR(0)
    );
\left_align_select_r[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF888F"
    )
        port map (
      I0 => rxctrl0_out(1),
      I1 => rxctrl0_out(0),
      I2 => \^ready_r\,
      I3 => \^align_r_reg_0\,
      I4 => first_v_received_r,
      O => \left_align_select_r_reg[1]\
    );
polarity_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => count_32d_done_r,
      I1 => realign_r,
      I2 => rxbyterealign_out(0),
      O => next_polarity_c
    );
polarity_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => next_polarity_c,
      Q => polarity_r,
      R => ready_r_reg0
    );
prev_count_128d_done_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_128d_done_r,
      Q => prev_count_128d_done_r,
      R => '0'
    );
ready_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F44444444444444"
    )
        port map (
      I0 => \counter4_r_reg_n_0_[15]\,
      I1 => \^ready_r\,
      I2 => \counter5_r_reg_n_0_[15]\,
      I3 => \^gen_spa_i\,
      I4 => \counter2_r_reg_n_0_[15]\,
      I5 => \counter3_r_reg_n_0_[3]\,
      O => next_ready_c
    );
ready_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => next_ready_c,
      Q => \^ready_r\,
      R => ready_r_reg0
    );
realign_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF040404"
    )
        port map (
      I0 => rxbyterealign_out(0),
      I1 => realign_r,
      I2 => count_32d_done_r,
      I3 => \^align_r_reg_0\,
      I4 => count_128d_done_r,
      O => next_realign_c
    );
realign_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => next_realign_c,
      Q => realign_r,
      R => ready_r_reg0
    );
reset_count_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0B0BFB0B"
    )
        port map (
      I0 => gtrxreset_out_reg,
      I1 => consecutive_commas_r_reg_0,
      I2 => tx_reset_i,
      I3 => count_8d_done_r,
      I4 => \^begin_r\,
      I5 => SR(0),
      O => reset_count_r0
    );
reset_count_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => reset_count_r0,
      Q => reset_count_r,
      R => '0'
    );
rst_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^begin_r\,
      I1 => count_8d_done_r,
      I2 => tx_reset_i,
      O => next_rst_c
    );
rst_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => next_rst_c,
      Q => tx_reset_i,
      R => ready_r_reg0
    );
rx_polarity_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => RX_NEG,
      I1 => polarity_r,
      I2 => \^rxpolarity_in\(0),
      O => rx_polarity_r_i_1_n_0
    );
rx_polarity_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => rx_polarity_r_i_1_n_0,
      Q => \^rxpolarity_in\(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LEFT_ALIGN_CONTROL is
  port (
    MUX_SELECT : out STD_LOGIC_VECTOR ( 0 to 0 );
    mux_select_c : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LEFT_ALIGN_CONTROL : entity is "dnpcie_aurora_2_sim_LEFT_ALIGN_CONTROL";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LEFT_ALIGN_CONTROL;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LEFT_ALIGN_CONTROL is
begin
\MUX_SELECT_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => mux_select_c(0),
      Q => MUX_SELECT(0),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LEFT_ALIGN_MUX is
  port (
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    stage_2_data_r : in STD_LOGIC_VECTOR ( 0 to 31 );
    MUX_SELECT : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LEFT_ALIGN_MUX : entity is "dnpcie_aurora_2_sim_LEFT_ALIGN_MUX";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LEFT_ALIGN_MUX;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LEFT_ALIGN_MUX is
  signal muxed_data_c : STD_LOGIC_VECTOR ( 0 to 15 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \MUXED_DATA[0]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \MUXED_DATA[10]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \MUXED_DATA[11]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \MUXED_DATA[12]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \MUXED_DATA[13]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \MUXED_DATA[14]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \MUXED_DATA[15]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \MUXED_DATA[1]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \MUXED_DATA[2]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \MUXED_DATA[3]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \MUXED_DATA[4]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \MUXED_DATA[5]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \MUXED_DATA[6]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \MUXED_DATA[7]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \MUXED_DATA[8]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \MUXED_DATA[9]_i_1\ : label is "soft_lutpair74";
begin
\MUXED_DATA[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(16),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(0),
      O => muxed_data_c(0)
    );
\MUXED_DATA[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(26),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(10),
      O => muxed_data_c(10)
    );
\MUXED_DATA[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(27),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(11),
      O => muxed_data_c(11)
    );
\MUXED_DATA[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(28),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(12),
      O => muxed_data_c(12)
    );
\MUXED_DATA[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(29),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(13),
      O => muxed_data_c(13)
    );
\MUXED_DATA[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(30),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(14),
      O => muxed_data_c(14)
    );
\MUXED_DATA[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(31),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(15),
      O => muxed_data_c(15)
    );
\MUXED_DATA[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(17),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(1),
      O => muxed_data_c(1)
    );
\MUXED_DATA[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(18),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(2),
      O => muxed_data_c(2)
    );
\MUXED_DATA[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(19),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(3),
      O => muxed_data_c(3)
    );
\MUXED_DATA[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(20),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(4),
      O => muxed_data_c(4)
    );
\MUXED_DATA[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(21),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(5),
      O => muxed_data_c(5)
    );
\MUXED_DATA[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(22),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(6),
      O => muxed_data_c(6)
    );
\MUXED_DATA[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(23),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(7),
      O => muxed_data_c(7)
    );
\MUXED_DATA[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(24),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(8),
      O => muxed_data_c(8)
    );
\MUXED_DATA[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => stage_2_data_r(25),
      I1 => MUX_SELECT(0),
      I2 => stage_2_data_r(9),
      O => muxed_data_c(9)
    );
\MUXED_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(0),
      Q => Q(31),
      R => '0'
    );
\MUXED_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(10),
      Q => Q(21),
      R => '0'
    );
\MUXED_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(11),
      Q => Q(20),
      R => '0'
    );
\MUXED_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(12),
      Q => Q(19),
      R => '0'
    );
\MUXED_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(13),
      Q => Q(18),
      R => '0'
    );
\MUXED_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(14),
      Q => Q(17),
      R => '0'
    );
\MUXED_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(15),
      Q => Q(16),
      R => '0'
    );
\MUXED_DATA_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(16),
      Q => Q(15),
      R => '0'
    );
\MUXED_DATA_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(17),
      Q => Q(14),
      R => '0'
    );
\MUXED_DATA_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(18),
      Q => Q(13),
      R => '0'
    );
\MUXED_DATA_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(19),
      Q => Q(12),
      R => '0'
    );
\MUXED_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(1),
      Q => Q(30),
      R => '0'
    );
\MUXED_DATA_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(20),
      Q => Q(11),
      R => '0'
    );
\MUXED_DATA_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(21),
      Q => Q(10),
      R => '0'
    );
\MUXED_DATA_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(22),
      Q => Q(9),
      R => '0'
    );
\MUXED_DATA_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(23),
      Q => Q(8),
      R => '0'
    );
\MUXED_DATA_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(24),
      Q => Q(7),
      R => '0'
    );
\MUXED_DATA_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(25),
      Q => Q(6),
      R => '0'
    );
\MUXED_DATA_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(26),
      Q => Q(5),
      R => '0'
    );
\MUXED_DATA_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(27),
      Q => Q(4),
      R => '0'
    );
\MUXED_DATA_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(28),
      Q => Q(3),
      R => '0'
    );
\MUXED_DATA_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(29),
      Q => Q(2),
      R => '0'
    );
\MUXED_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(2),
      Q => Q(29),
      R => '0'
    );
\MUXED_DATA_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(30),
      Q => Q(1),
      R => '0'
    );
\MUXED_DATA_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_data_r(31),
      Q => Q(0),
      R => '0'
    );
\MUXED_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(3),
      Q => Q(28),
      R => '0'
    );
\MUXED_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(4),
      Q => Q(27),
      R => '0'
    );
\MUXED_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(5),
      Q => Q(26),
      R => '0'
    );
\MUXED_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(6),
      Q => Q(25),
      R => '0'
    );
\MUXED_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(7),
      Q => Q(24),
      R => '0'
    );
\MUXED_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(8),
      Q => Q(23),
      R => '0'
    );
\MUXED_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => muxed_data_c(9),
      Q => Q(22),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LL_TO_AXI is
  port (
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rx_eof : in STD_LOGIC;
    \RX_REM_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LL_TO_AXI : entity is "dnpcie_aurora_2_sim_LL_TO_AXI";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LL_TO_AXI;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LL_TO_AXI is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \m_axi_rx_tkeep[1]_INST_0\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \m_axi_rx_tkeep[3]_INST_0\ : label is "soft_lutpair123";
begin
\m_axi_rx_tkeep[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => rx_eof,
      I1 => \RX_REM_reg[0]\(0),
      I2 => \RX_REM_reg[0]\(1),
      O => m_axi_rx_tkeep(2)
    );
\m_axi_rx_tkeep[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rx_eof,
      I1 => \RX_REM_reg[0]\(1),
      O => m_axi_rx_tkeep(1)
    );
\m_axi_rx_tkeep[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => rx_eof,
      I1 => \RX_REM_reg[0]\(1),
      I2 => \RX_REM_reg[0]\(0),
      O => m_axi_rx_tkeep(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_OUTPUT_MUX is
  port (
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 31 );
    Q : in STD_LOGIC_VECTOR ( 31 downto 0 );
    user_clk : in STD_LOGIC;
    \MUXED_DATA_reg[0]\ : in STD_LOGIC_VECTOR ( 15 downto 0 );
    OUTPUT_SELECT : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_OUTPUT_MUX : entity is "dnpcie_aurora_2_sim_OUTPUT_MUX";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_OUTPUT_MUX;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_OUTPUT_MUX is
  signal output_data_c : STD_LOGIC_VECTOR ( 16 to 31 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \OUTPUT_DATA[16]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[17]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[18]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[19]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[20]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[21]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[22]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[23]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[24]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[25]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[26]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[27]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[28]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[29]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[30]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \OUTPUT_DATA[31]_i_1\ : label is "soft_lutpair59";
begin
\OUTPUT_DATA[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(15),
      I1 => OUTPUT_SELECT,
      I2 => Q(15),
      O => output_data_c(16)
    );
\OUTPUT_DATA[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(14),
      I1 => OUTPUT_SELECT,
      I2 => Q(14),
      O => output_data_c(17)
    );
\OUTPUT_DATA[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(13),
      I1 => OUTPUT_SELECT,
      I2 => Q(13),
      O => output_data_c(18)
    );
\OUTPUT_DATA[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(12),
      I1 => OUTPUT_SELECT,
      I2 => Q(12),
      O => output_data_c(19)
    );
\OUTPUT_DATA[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(11),
      I1 => OUTPUT_SELECT,
      I2 => Q(11),
      O => output_data_c(20)
    );
\OUTPUT_DATA[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(10),
      I1 => OUTPUT_SELECT,
      I2 => Q(10),
      O => output_data_c(21)
    );
\OUTPUT_DATA[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(9),
      I1 => OUTPUT_SELECT,
      I2 => Q(9),
      O => output_data_c(22)
    );
\OUTPUT_DATA[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(8),
      I1 => OUTPUT_SELECT,
      I2 => Q(8),
      O => output_data_c(23)
    );
\OUTPUT_DATA[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(7),
      I1 => OUTPUT_SELECT,
      I2 => Q(7),
      O => output_data_c(24)
    );
\OUTPUT_DATA[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(6),
      I1 => OUTPUT_SELECT,
      I2 => Q(6),
      O => output_data_c(25)
    );
\OUTPUT_DATA[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(5),
      I1 => OUTPUT_SELECT,
      I2 => Q(5),
      O => output_data_c(26)
    );
\OUTPUT_DATA[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(4),
      I1 => OUTPUT_SELECT,
      I2 => Q(4),
      O => output_data_c(27)
    );
\OUTPUT_DATA[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(3),
      I1 => OUTPUT_SELECT,
      I2 => Q(3),
      O => output_data_c(28)
    );
\OUTPUT_DATA[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(2),
      I1 => OUTPUT_SELECT,
      I2 => Q(2),
      O => output_data_c(29)
    );
\OUTPUT_DATA[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(1),
      I1 => OUTPUT_SELECT,
      I2 => Q(1),
      O => output_data_c(30)
    );
\OUTPUT_DATA[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \MUXED_DATA_reg[0]\(0),
      I1 => OUTPUT_SELECT,
      I2 => Q(0),
      O => output_data_c(31)
    );
\OUTPUT_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(31),
      Q => m_axi_rx_tdata(0),
      R => '0'
    );
\OUTPUT_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(21),
      Q => m_axi_rx_tdata(10),
      R => '0'
    );
\OUTPUT_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(20),
      Q => m_axi_rx_tdata(11),
      R => '0'
    );
\OUTPUT_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(19),
      Q => m_axi_rx_tdata(12),
      R => '0'
    );
\OUTPUT_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(18),
      Q => m_axi_rx_tdata(13),
      R => '0'
    );
\OUTPUT_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(17),
      Q => m_axi_rx_tdata(14),
      R => '0'
    );
\OUTPUT_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(16),
      Q => m_axi_rx_tdata(15),
      R => '0'
    );
\OUTPUT_DATA_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(16),
      Q => m_axi_rx_tdata(16),
      R => '0'
    );
\OUTPUT_DATA_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(17),
      Q => m_axi_rx_tdata(17),
      R => '0'
    );
\OUTPUT_DATA_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(18),
      Q => m_axi_rx_tdata(18),
      R => '0'
    );
\OUTPUT_DATA_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(19),
      Q => m_axi_rx_tdata(19),
      R => '0'
    );
\OUTPUT_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(30),
      Q => m_axi_rx_tdata(1),
      R => '0'
    );
\OUTPUT_DATA_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(20),
      Q => m_axi_rx_tdata(20),
      R => '0'
    );
\OUTPUT_DATA_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(21),
      Q => m_axi_rx_tdata(21),
      R => '0'
    );
\OUTPUT_DATA_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(22),
      Q => m_axi_rx_tdata(22),
      R => '0'
    );
\OUTPUT_DATA_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(23),
      Q => m_axi_rx_tdata(23),
      R => '0'
    );
\OUTPUT_DATA_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(24),
      Q => m_axi_rx_tdata(24),
      R => '0'
    );
\OUTPUT_DATA_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(25),
      Q => m_axi_rx_tdata(25),
      R => '0'
    );
\OUTPUT_DATA_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(26),
      Q => m_axi_rx_tdata(26),
      R => '0'
    );
\OUTPUT_DATA_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(27),
      Q => m_axi_rx_tdata(27),
      R => '0'
    );
\OUTPUT_DATA_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(28),
      Q => m_axi_rx_tdata(28),
      R => '0'
    );
\OUTPUT_DATA_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(29),
      Q => m_axi_rx_tdata(29),
      R => '0'
    );
\OUTPUT_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(29),
      Q => m_axi_rx_tdata(2),
      R => '0'
    );
\OUTPUT_DATA_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(30),
      Q => m_axi_rx_tdata(30),
      R => '0'
    );
\OUTPUT_DATA_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_data_c(31),
      Q => m_axi_rx_tdata(31),
      R => '0'
    );
\OUTPUT_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(28),
      Q => m_axi_rx_tdata(3),
      R => '0'
    );
\OUTPUT_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(27),
      Q => m_axi_rx_tdata(4),
      R => '0'
    );
\OUTPUT_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(26),
      Q => m_axi_rx_tdata(5),
      R => '0'
    );
\OUTPUT_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(25),
      Q => m_axi_rx_tdata(6),
      R => '0'
    );
\OUTPUT_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(24),
      Q => m_axi_rx_tdata(7),
      R => '0'
    );
\OUTPUT_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(23),
      Q => m_axi_rx_tdata(8),
      R => '0'
    );
\OUTPUT_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q(22),
      Q => m_axi_rx_tdata(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_OUTPUT_SWITCH_CONTROL is
  port (
    OUTPUT_SELECT : out STD_LOGIC;
    output_select_c : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_OUTPUT_SWITCH_CONTROL : entity is "dnpcie_aurora_2_sim_OUTPUT_SWITCH_CONTROL";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_OUTPUT_SWITCH_CONTROL;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_OUTPUT_SWITCH_CONTROL is
begin
\OUTPUT_SELECT_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => output_select_c(0),
      Q => OUTPUT_SELECT,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_DEFRAMER is
  port (
    mux_select_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    stage_2_start_with_data_r_reg : out STD_LOGIC;
    stage_2_end_before_start_r_reg : out STD_LOGIC;
    stage_2_end_after_start_r_reg : out STD_LOGIC;
    \COUNT_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stage_2_frame_err_r_reg : out STD_LOGIC;
    \RX_ECP_reg[0]\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \RX_ECP_reg[1]\ : in STD_LOGIC;
    after_scp_select_c_1 : in STD_LOGIC;
    after_scp_select_c_0 : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \stage_1_scp_r_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \RX_PE_DATA_V_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_DEFRAMER : entity is "dnpcie_aurora_2_sim_RX_LL_DEFRAMER";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_DEFRAMER;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_DEFRAMER is
  signal \DEFRAMED_DATA_V[0]_i_1_n_0\ : STD_LOGIC;
  signal \DEFRAMED_DATA_V[1]_i_1_n_0\ : STD_LOGIC;
  signal after_scp_c_1 : STD_LOGIC;
  signal data_after_start_muxcy_1_n_0 : STD_LOGIC;
  signal in_frame_c_0 : STD_LOGIC;
  signal in_frame_c_1 : STD_LOGIC;
  signal in_frame_r : STD_LOGIC;
  signal stage_1_after_scp_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal stage_1_data_v_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal stage_1_in_frame_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal NLW_data_after_start_muxcy_0_CARRY4_CARRY8_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_data_after_start_muxcy_0_CARRY4_CARRY8_DI_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_data_after_start_muxcy_0_CARRY4_CARRY8_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_data_after_start_muxcy_0_CARRY4_CARRY8_S_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_in_frame_muxcy_0_CARRY4_CARRY8_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_in_frame_muxcy_0_CARRY4_CARRY8_DI_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_in_frame_muxcy_0_CARRY4_CARRY8_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_in_frame_muxcy_0_CARRY4_CARRY8_S_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \COUNT[0]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \COUNT[1]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \MUX_SELECT[2]_i_1\ : label is "soft_lutpair68";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of data_after_start_muxcy_0_CARRY4_CARRY8 : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_after_start_muxcy_0_CARRY4_CARRY8 : label is "(CARRY4)";
  attribute BOX_TYPE of in_frame_muxcy_0_CARRY4_CARRY8 : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of in_frame_muxcy_0_CARRY4_CARRY8 : label is "(CARRY4)";
  attribute SOFT_HLUTNM of stage_2_end_after_start_r_i_1 : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of stage_2_end_before_start_r_i_1 : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of stage_2_start_with_data_r_i_1 : label is "soft_lutpair68";
begin
\AFTER_SCP_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => after_scp_c_1,
      Q => stage_1_after_scp_r(0),
      R => SS(0)
    );
\AFTER_SCP_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => data_after_start_muxcy_1_n_0,
      Q => stage_1_after_scp_r(1),
      R => SS(0)
    );
\COUNT[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => stage_1_data_v_r(0),
      I1 => stage_1_data_v_r(1),
      O => \COUNT_reg[0]\(1)
    );
\COUNT[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => stage_1_data_v_r(0),
      I1 => stage_1_data_v_r(1),
      O => \COUNT_reg[0]\(0)
    );
\DEFRAMED_DATA_V[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => in_frame_c_1,
      I1 => \RX_PE_DATA_V_reg[0]\(1),
      O => \DEFRAMED_DATA_V[0]_i_1_n_0\
    );
\DEFRAMED_DATA_V[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => in_frame_c_0,
      I1 => \RX_PE_DATA_V_reg[0]\(0),
      O => \DEFRAMED_DATA_V[1]_i_1_n_0\
    );
\DEFRAMED_DATA_V_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \DEFRAMED_DATA_V[0]_i_1_n_0\,
      Q => stage_1_data_v_r(0),
      R => SS(0)
    );
\DEFRAMED_DATA_V_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \DEFRAMED_DATA_V[1]_i_1_n_0\,
      Q => stage_1_data_v_r(1),
      R => SS(0)
    );
\IN_FRAME_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => in_frame_r,
      Q => stage_1_in_frame_r(0),
      R => SS(0)
    );
\IN_FRAME_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => in_frame_c_1,
      Q => stage_1_in_frame_r(1),
      R => SS(0)
    );
\MUX_SELECT[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => stage_1_data_v_r(1),
      I1 => stage_1_data_v_r(0),
      O => mux_select_c(0)
    );
data_after_start_muxcy_0_CARRY4_CARRY8: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7 downto 2) => NLW_data_after_start_muxcy_0_CARRY4_CARRY8_CO_UNCONNECTED(7 downto 2),
      CO(1) => data_after_start_muxcy_1_n_0,
      CO(0) => after_scp_c_1,
      DI(7 downto 2) => NLW_data_after_start_muxcy_0_CARRY4_CARRY8_DI_UNCONNECTED(7 downto 2),
      DI(1 downto 0) => B"11",
      O(7 downto 0) => NLW_data_after_start_muxcy_0_CARRY4_CARRY8_O_UNCONNECTED(7 downto 0),
      S(7 downto 2) => NLW_data_after_start_muxcy_0_CARRY4_CARRY8_S_UNCONNECTED(7 downto 2),
      S(1) => after_scp_select_c_0,
      S(0) => after_scp_select_c_1
    );
in_frame_muxcy_0_CARRY4_CARRY8: unisim.vcomponents.CARRY8
     port map (
      CI => in_frame_r,
      CI_TOP => '0',
      CO(7 downto 2) => NLW_in_frame_muxcy_0_CARRY4_CARRY8_CO_UNCONNECTED(7 downto 2),
      CO(1) => in_frame_c_0,
      CO(0) => in_frame_c_1,
      DI(7 downto 2) => NLW_in_frame_muxcy_0_CARRY4_CARRY8_DI_UNCONNECTED(7 downto 2),
      DI(1) => D(0),
      DI(0) => D(1),
      O(7 downto 0) => NLW_in_frame_muxcy_0_CARRY4_CARRY8_O_UNCONNECTED(7 downto 0),
      S(7 downto 2) => NLW_in_frame_muxcy_0_CARRY4_CARRY8_S_UNCONNECTED(7 downto 2),
      S(1) => \RX_ECP_reg[1]\,
      S(0) => \RX_ECP_reg[0]\
    );
in_frame_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => in_frame_c_0,
      Q => in_frame_r,
      R => SS(0)
    );
stage_2_end_after_start_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => Q(1),
      I1 => stage_1_after_scp_r(0),
      I2 => Q(0),
      I3 => stage_1_after_scp_r(1),
      O => stage_2_end_after_start_r_reg
    );
stage_2_end_before_start_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => stage_1_after_scp_r(0),
      I1 => Q(1),
      I2 => stage_1_after_scp_r(1),
      I3 => Q(0),
      O => stage_2_end_before_start_r_reg
    );
stage_2_frame_err_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFE2E2E2FFE2"
    )
        port map (
      I0 => Q(1),
      I1 => stage_1_in_frame_r(0),
      I2 => \stage_1_scp_r_reg[0]\(1),
      I3 => Q(0),
      I4 => stage_1_in_frame_r(1),
      I5 => \stage_1_scp_r_reg[0]\(0),
      O => stage_2_frame_err_r_reg
    );
stage_2_start_with_data_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => stage_1_after_scp_r(0),
      I1 => stage_1_data_v_r(0),
      I2 => stage_1_after_scp_r(1),
      I3 => stage_1_data_v_r(1),
      O => stage_2_start_with_data_r_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_NFC is
  port (
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \RX_SNF_reg[0]\ : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RX_SNF_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rx_fc_nb : in STD_LOGIC_VECTOR ( 0 to 3 );
    \word_aligned_data_r_reg[27]\ : in STD_LOGIC;
    \word_aligned_data_r_reg[26]\ : in STD_LOGIC;
    \word_aligned_data_r_reg[25]\ : in STD_LOGIC;
    \word_aligned_data_r_reg[24]\ : in STD_LOGIC;
    tx_dst_rdy : in STD_LOGIC;
    do_cc_r : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_NFC : entity is "dnpcie_aurora_2_sim_RX_LL_NFC";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_NFC;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_NFC is
  signal \^d\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal fcnb_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \fcnb_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \fcnb_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \fcnb_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \fcnb_r[3]_i_1_n_0\ : STD_LOGIC;
  signal load_nfc_r : STD_LOGIC;
  signal \nfc_counter_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[0]_i_3_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[1]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[1]_i_3_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[2]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[3]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[4]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[4]_i_3_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[5]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[6]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r[7]_i_2_n_0\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \nfc_counter_r_reg_n_0_[8]\ : STD_LOGIC;
  signal nfc_lane_index_r : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal stage_1_load_nfc_r : STD_LOGIC;
  signal xoff_r : STD_LOGIC;
  signal xoff_r_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \fcnb_r[0]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \fcnb_r[1]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \fcnb_r[2]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \fcnb_r[3]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \nfc_counter_r[1]_i_2\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \nfc_counter_r[2]_i_2\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \nfc_counter_r[4]_i_3\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \nfc_counter_r[5]_i_2\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \nfc_counter_r[6]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \nfc_counter_r[6]_i_2\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \nfc_counter_r[7]_i_2\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \nfc_counter_r[8]_i_1\ : label is "soft_lutpair55";
begin
  D(7 downto 0) <= \^d\(7 downto 0);
  Q(0) <= \^q\(0);
\channel_fcnb_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => m_axi_rx_fc_nb(0),
      Q => \^d\(7),
      R => '0'
    );
\channel_fcnb_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => m_axi_rx_fc_nb(1),
      Q => \^d\(6),
      R => '0'
    );
\channel_fcnb_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => m_axi_rx_fc_nb(2),
      Q => \^d\(5),
      R => '0'
    );
\channel_fcnb_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => m_axi_rx_fc_nb(3),
      Q => \^d\(4),
      R => '0'
    );
\channel_fcnb_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r_reg[24]\,
      Q => \^d\(3),
      R => '0'
    );
\channel_fcnb_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r_reg[25]\,
      Q => \^d\(2),
      R => '0'
    );
\channel_fcnb_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r_reg[26]\,
      Q => \^d\(1),
      R => '0'
    );
\channel_fcnb_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r_reg[27]\,
      Q => \^d\(0),
      R => '0'
    );
\fcnb_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^d\(3),
      I1 => nfc_lane_index_r,
      I2 => \^d\(7),
      O => \fcnb_r[0]_i_1_n_0\
    );
\fcnb_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^d\(2),
      I1 => nfc_lane_index_r,
      I2 => \^d\(6),
      O => \fcnb_r[1]_i_1_n_0\
    );
\fcnb_r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^d\(1),
      I1 => nfc_lane_index_r,
      I2 => \^d\(5),
      O => \fcnb_r[2]_i_1_n_0\
    );
\fcnb_r[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^d\(0),
      I1 => nfc_lane_index_r,
      I2 => \^d\(4),
      O => \fcnb_r[3]_i_1_n_0\
    );
\fcnb_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \fcnb_r[0]_i_1_n_0\,
      Q => fcnb_r(0),
      R => SS(0)
    );
\fcnb_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \fcnb_r[1]_i_1_n_0\,
      Q => fcnb_r(1),
      R => SS(0)
    );
\fcnb_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \fcnb_r[2]_i_1_n_0\,
      Q => fcnb_r(2),
      R => SS(0)
    );
\fcnb_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \fcnb_r[3]_i_1_n_0\,
      Q => fcnb_r(3),
      R => SS(0)
    );
load_nfc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_1_load_nfc_r,
      Q => load_nfc_r,
      R => SS(0)
    );
\nfc_counter_r[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAABA"
    )
        port map (
      I0 => load_nfc_r,
      I1 => xoff_r,
      I2 => tx_dst_rdy,
      I3 => do_cc_r,
      I4 => \^q\(0),
      O => \nfc_counter_r[0]_i_1_n_0\
    );
\nfc_counter_r[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AA9FFFF2AA90000"
    )
        port map (
      I0 => fcnb_r(0),
      I1 => fcnb_r(1),
      I2 => fcnb_r(2),
      I3 => fcnb_r(3),
      I4 => load_nfc_r,
      I5 => \nfc_counter_r[0]_i_3_n_0\,
      O => p_0_in(8)
    );
\nfc_counter_r[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(0),
      I1 => \nfc_counter_r_reg_n_0_[2]\,
      I2 => \nfc_counter_r_reg_n_0_[4]\,
      I3 => \nfc_counter_r[4]_i_3_n_0\,
      I4 => \nfc_counter_r_reg_n_0_[3]\,
      I5 => \nfc_counter_r_reg_n_0_[1]\,
      O => \nfc_counter_r[0]_i_3_n_0\
    );
\nfc_counter_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"101F1F101F101F10"
    )
        port map (
      I0 => fcnb_r(0),
      I1 => \nfc_counter_r[1]_i_2_n_0\,
      I2 => load_nfc_r,
      I3 => \nfc_counter_r_reg_n_0_[1]\,
      I4 => \nfc_counter_r[1]_i_3_n_0\,
      I5 => \nfc_counter_r_reg_n_0_[2]\,
      O => p_0_in(7)
    );
\nfc_counter_r[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => fcnb_r(1),
      I1 => fcnb_r(2),
      I2 => fcnb_r(3),
      O => \nfc_counter_r[1]_i_2_n_0\
    );
\nfc_counter_r[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[3]\,
      I1 => \nfc_counter_r_reg_n_0_[5]\,
      I2 => \nfc_counter_r_reg_n_0_[6]\,
      I3 => \nfc_counter_r_reg_n_0_[8]\,
      I4 => \nfc_counter_r_reg_n_0_[7]\,
      I5 => \nfc_counter_r_reg_n_0_[4]\,
      O => \nfc_counter_r[1]_i_3_n_0\
    );
\nfc_counter_r[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"202F2F20"
    )
        port map (
      I0 => \nfc_counter_r[2]_i_2_n_0\,
      I1 => fcnb_r(0),
      I2 => load_nfc_r,
      I3 => \nfc_counter_r_reg_n_0_[2]\,
      I4 => \nfc_counter_r[1]_i_3_n_0\,
      O => p_0_in(6)
    );
\nfc_counter_r[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7E"
    )
        port map (
      I0 => fcnb_r(3),
      I1 => fcnb_r(2),
      I2 => fcnb_r(1),
      O => \nfc_counter_r[2]_i_2_n_0\
    );
\nfc_counter_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1514FFFF15140000"
    )
        port map (
      I0 => fcnb_r(0),
      I1 => fcnb_r(1),
      I2 => fcnb_r(2),
      I3 => fcnb_r(3),
      I4 => load_nfc_r,
      I5 => \nfc_counter_r[3]_i_2_n_0\,
      O => p_0_in(5)
    );
\nfc_counter_r[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[3]\,
      I1 => \nfc_counter_r_reg_n_0_[5]\,
      I2 => \nfc_counter_r_reg_n_0_[6]\,
      I3 => \nfc_counter_r_reg_n_0_[8]\,
      I4 => \nfc_counter_r_reg_n_0_[7]\,
      I5 => \nfc_counter_r_reg_n_0_[4]\,
      O => \nfc_counter_r[3]_i_2_n_0\
    );
\nfc_counter_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"140014FF14FF1400"
    )
        port map (
      I0 => fcnb_r(0),
      I1 => \nfc_counter_r[4]_i_2_n_0\,
      I2 => fcnb_r(1),
      I3 => load_nfc_r,
      I4 => \nfc_counter_r_reg_n_0_[4]\,
      I5 => \nfc_counter_r[4]_i_3_n_0\,
      O => p_0_in(4)
    );
\nfc_counter_r[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => fcnb_r(3),
      I1 => fcnb_r(2),
      O => \nfc_counter_r[4]_i_2_n_0\
    );
\nfc_counter_r[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[5]\,
      I1 => \nfc_counter_r_reg_n_0_[6]\,
      I2 => \nfc_counter_r_reg_n_0_[8]\,
      I3 => \nfc_counter_r_reg_n_0_[7]\,
      O => \nfc_counter_r[4]_i_3_n_0\
    );
\nfc_counter_r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"04FF0400040004FF"
    )
        port map (
      I0 => fcnb_r(0),
      I1 => \nfc_counter_r[4]_i_2_n_0\,
      I2 => fcnb_r(1),
      I3 => load_nfc_r,
      I4 => \nfc_counter_r[5]_i_2_n_0\,
      I5 => \nfc_counter_r_reg_n_0_[5]\,
      O => p_0_in(3)
    );
\nfc_counter_r[5]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \nfc_counter_r_reg_n_0_[7]\,
      I1 => \nfc_counter_r_reg_n_0_[8]\,
      I2 => \nfc_counter_r_reg_n_0_[6]\,
      O => \nfc_counter_r[5]_i_2_n_0\
    );
\nfc_counter_r[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8BB8B8B8"
    )
        port map (
      I0 => \nfc_counter_r[6]_i_2_n_0\,
      I1 => load_nfc_r,
      I2 => \nfc_counter_r_reg_n_0_[6]\,
      I3 => \nfc_counter_r_reg_n_0_[8]\,
      I4 => \nfc_counter_r_reg_n_0_[7]\,
      O => p_0_in(2)
    );
\nfc_counter_r[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0014"
    )
        port map (
      I0 => fcnb_r(0),
      I1 => fcnb_r(3),
      I2 => fcnb_r(2),
      I3 => fcnb_r(1),
      O => \nfc_counter_r[6]_i_2_n_0\
    );
\nfc_counter_r[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8BB8"
    )
        port map (
      I0 => \nfc_counter_r[7]_i_2_n_0\,
      I1 => load_nfc_r,
      I2 => \nfc_counter_r_reg_n_0_[8]\,
      I3 => \nfc_counter_r_reg_n_0_[7]\,
      O => p_0_in(1)
    );
\nfc_counter_r[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => fcnb_r(0),
      I1 => fcnb_r(2),
      I2 => fcnb_r(3),
      I3 => fcnb_r(1),
      O => \nfc_counter_r[7]_i_2_n_0\
    );
\nfc_counter_r[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => load_nfc_r,
      I1 => \nfc_counter_r_reg_n_0_[8]\,
      O => p_0_in(0)
    );
\nfc_counter_r_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => p_0_in(8),
      Q => \^q\(0),
      S => SS(0)
    );
\nfc_counter_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => p_0_in(7),
      Q => \nfc_counter_r_reg_n_0_[1]\,
      R => SS(0)
    );
\nfc_counter_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => p_0_in(6),
      Q => \nfc_counter_r_reg_n_0_[2]\,
      R => SS(0)
    );
\nfc_counter_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => p_0_in(5),
      Q => \nfc_counter_r_reg_n_0_[3]\,
      R => SS(0)
    );
\nfc_counter_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => p_0_in(4),
      Q => \nfc_counter_r_reg_n_0_[4]\,
      R => SS(0)
    );
\nfc_counter_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => p_0_in(3),
      Q => \nfc_counter_r_reg_n_0_[5]\,
      R => SS(0)
    );
\nfc_counter_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => p_0_in(2),
      Q => \nfc_counter_r_reg_n_0_[6]\,
      R => SS(0)
    );
\nfc_counter_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => p_0_in(1),
      Q => \nfc_counter_r_reg_n_0_[7]\,
      R => SS(0)
    );
\nfc_counter_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \nfc_counter_r[0]_i_1_n_0\,
      D => p_0_in(0),
      Q => \nfc_counter_r_reg_n_0_[8]\,
      R => SS(0)
    );
\nfc_lane_index_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \RX_SNF_reg[1]\(0),
      Q => nfc_lane_index_r,
      R => '0'
    );
stage_1_load_nfc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \RX_SNF_reg[0]\,
      Q => stage_1_load_nfc_r,
      R => '0'
    );
xoff_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000FFFF80000000"
    )
        port map (
      I0 => fcnb_r(3),
      I1 => fcnb_r(2),
      I2 => fcnb_r(1),
      I3 => fcnb_r(0),
      I4 => load_nfc_r,
      I5 => xoff_r,
      O => xoff_r_i_1_n_0
    );
xoff_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => xoff_r_i_1_n_0,
      Q => xoff_r,
      R => SS(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SIDEBAND_OUTPUT is
  port (
    stage_3_end_storage_r : out STD_LOGIC;
    SRC_RDY_N_reg_0 : out STD_LOGIC;
    SRC_RDY_N : out STD_LOGIC;
    EOF_N : out STD_LOGIC;
    FRAME_ERR_RESULT : out STD_LOGIC;
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    \RX_REM_reg[0]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    end_storage_r0 : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    stage_2_start_with_data_r_reg : in STD_LOGIC;
    FRAME_ERR_RESULT0 : in STD_LOGIC;
    stage_2_start_with_data_r : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \COUNT_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    stage_2_pad_r : in STD_LOGIC;
    stage_2_frame_err_r : in STD_LOGIC;
    start_rx_i : in STD_LOGIC;
    stage_2_end_before_start_r : in STD_LOGIC;
    \storage_count_r_reg[1]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SIDEBAND_OUTPUT : entity is "dnpcie_aurora_2_sim_SIDEBAND_OUTPUT";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SIDEBAND_OUTPUT;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SIDEBAND_OUTPUT is
  signal SRC_RDY_N_i_1_n_0 : STD_LOGIC;
  signal \^src_rdy_n_reg_0\ : STD_LOGIC;
  signal pad_storage_r : STD_LOGIC;
  signal pad_storage_r_i_1_n_0 : STD_LOGIC;
  signal rx_rem_c : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^stage_3_end_storage_r\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of SRC_RDY_N_i_1 : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \STORAGE_SELECT[4]_i_1\ : label is "soft_lutpair67";
begin
  SRC_RDY_N_reg_0 <= \^src_rdy_n_reg_0\;
  stage_3_end_storage_r <= \^stage_3_end_storage_r\;
EOF_N_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_2_start_with_data_r_reg,
      Q => EOF_N,
      R => '0'
    );
FRAME_ERR_RESULT_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => FRAME_ERR_RESULT0,
      Q => FRAME_ERR_RESULT,
      R => '0'
    );
\RX_REM[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1E0F"
    )
        port map (
      I0 => stage_2_start_with_data_r,
      I1 => \^stage_3_end_storage_r\,
      I2 => Q(0),
      I3 => \COUNT_reg[1]\(0),
      O => rx_rem_c(1)
    );
\RX_REM[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FD"
    )
        port map (
      I0 => stage_2_pad_r,
      I1 => stage_2_start_with_data_r,
      I2 => \^stage_3_end_storage_r\,
      I3 => pad_storage_r,
      O => rx_rem_c(0)
    );
\RX_REM_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_rem_c(1),
      Q => \RX_REM_reg[0]_0\(1),
      R => '0'
    );
\RX_REM_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_rem_c(0),
      Q => \RX_REM_reg[0]_0\(0),
      R => '0'
    );
SRC_RDY_N_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1015"
    )
        port map (
      I0 => \^stage_3_end_storage_r\,
      I1 => stage_2_end_before_start_r,
      I2 => stage_2_start_with_data_r,
      I3 => \storage_count_r_reg[1]\,
      O => SRC_RDY_N_i_1_n_0
    );
SRC_RDY_N_reg: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => SRC_RDY_N_i_1_n_0,
      Q => SRC_RDY_N,
      S => \^src_rdy_n_reg_0\
    );
\STORAGE_SELECT[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => stage_2_start_with_data_r,
      I1 => \^stage_3_end_storage_r\,
      O => SS(0)
    );
end_storage_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => end_storage_r0,
      Q => \^stage_3_end_storage_r\,
      R => \^src_rdy_n_reg_0\
    );
pad_storage_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABAAABBBAAAAAAAA"
    )
        port map (
      I0 => stage_2_pad_r,
      I1 => \^stage_3_end_storage_r\,
      I2 => stage_2_end_before_start_r,
      I3 => stage_2_start_with_data_r,
      I4 => \storage_count_r_reg[1]\,
      I5 => pad_storage_r,
      O => pad_storage_r_i_1_n_0
    );
pad_storage_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => pad_storage_r_i_1_n_0,
      Q => pad_storage_r,
      R => \^src_rdy_n_reg_0\
    );
\storage_count_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => stage_2_frame_err_r,
      I1 => start_rx_i,
      O => \^src_rdy_n_reg_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STANDARD_CC_MODULE is
  port (
    TX_DST_RDY_N_reg : out STD_LOGIC;
    do_cc_r_reg : out STD_LOGIC;
    do_nfc_r : out STD_LOGIC;
    SYSTEM_RESET_reg : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    s_axi_nfc_ack : in STD_LOGIC;
    s_axi_nfc_req : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STANDARD_CC_MODULE : entity is "dnpcie_aurora_2_sim_STANDARD_CC_MODULE";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STANDARD_CC_MODULE;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STANDARD_CC_MODULE is
  signal DO_CC_i_1_n_0 : STD_LOGIC;
  signal WARN_CC_i_1_n_0 : STD_LOGIC;
  signal \cc_count_r_reg_n_0_[5]\ : STD_LOGIC;
  signal cc_idle_count_done_c : STD_LOGIC;
  signal count_13d_flop_r_reg_r_n_0 : STD_LOGIC;
  signal \count_13d_srl_r_reg[10]_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0\ : STD_LOGIC;
  signal \count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0\ : STD_LOGIC;
  signal \count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0\ : STD_LOGIC;
  signal count_13d_srl_r_reg_gate_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_0_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_1_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_2_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_3_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_4_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_5_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_6_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_7_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_8_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_9_n_0 : STD_LOGIC;
  signal count_13d_srl_r_reg_r_n_0 : STD_LOGIC;
  signal count_16d_flop_r : STD_LOGIC;
  signal count_16d_flop_r_i_1_n_0 : STD_LOGIC;
  signal count_16d_srl_r0 : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \count_16d_srl_r_reg_n_0_[9]\ : STD_LOGIC;
  signal count_24d_flop_r : STD_LOGIC;
  signal count_24d_flop_r_i_1_n_0 : STD_LOGIC;
  signal count_24d_srl_r0 : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \count_24d_srl_r_reg_n_0_[9]\ : STD_LOGIC;
  signal \^do_cc_r_reg\ : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_3_out : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \prepare_count_r_reg[7]_srl4___standard_cc_module_i_count_13d_srl_r_reg_r_1_n_0\ : STD_LOGIC;
  signal \prepare_count_r_reg[8]_standard_cc_module_i_count_13d_srl_r_reg_r_2_n_0\ : STD_LOGIC;
  signal prepare_count_r_reg_gate_n_0 : STD_LOGIC;
  signal reset_r : STD_LOGIC;
  signal warn_cc : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of TX_DST_RDY_N_i_3 : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of WARN_CC_i_1 : label is "soft_lutpair124";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8\ : label is "inst/\standard_cc_module_i/count_13d_srl_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8\ : label is "inst/\standard_cc_module_i/count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8 ";
  attribute SOFT_HLUTNM of \count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1\ : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of count_24d_flop_r_i_1 : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of do_nfc_r_i_2 : label is "soft_lutpair125";
  attribute srl_bus_name of \prepare_count_r_reg[7]_srl4___standard_cc_module_i_count_13d_srl_r_reg_r_1\ : label is "inst/\standard_cc_module_i/prepare_count_r_reg ";
  attribute srl_name of \prepare_count_r_reg[7]_srl4___standard_cc_module_i_count_13d_srl_r_reg_r_1\ : label is "inst/\standard_cc_module_i/prepare_count_r_reg[7]_srl4___standard_cc_module_i_count_13d_srl_r_reg_r_1 ";
  attribute SOFT_HLUTNM of \prepare_count_r_reg[7]_srl4___standard_cc_module_i_count_13d_srl_r_reg_r_1_i_1\ : label is "soft_lutpair124";
begin
  do_cc_r_reg <= \^do_cc_r_reg\;
DO_CC_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => p_2_in(1),
      I1 => \cc_count_r_reg_n_0_[5]\,
      I2 => p_2_in(0),
      I3 => reset_r,
      I4 => p_3_out(2),
      O => DO_CC_i_1_n_0
    );
DO_CC_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => DO_CC_i_1_n_0,
      Q => \^do_cc_r_reg\,
      R => SYSTEM_RESET_reg
    );
TX_DST_RDY_N_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF04FF"
    )
        port map (
      I0 => s_axi_nfc_ack,
      I1 => s_axi_nfc_req,
      I2 => warn_cc,
      I3 => Q(0),
      I4 => \^do_cc_r_reg\,
      O => TX_DST_RDY_N_reg
    );
WARN_CC_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D555C000"
    )
        port map (
      I0 => p_3_out(2),
      I1 => count_16d_srl_r0,
      I2 => \count_16d_srl_r_reg_n_0_[14]\,
      I3 => \count_24d_srl_r_reg_n_0_[10]\,
      I4 => warn_cc,
      O => WARN_CC_i_1_n_0
    );
WARN_CC_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => WARN_CC_i_1_n_0,
      Q => warn_cc,
      R => SYSTEM_RESET_reg
    );
\cc_count_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => p_3_out(2),
      Q => p_2_in(1),
      R => SYSTEM_RESET_reg
    );
\cc_count_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => p_2_in(1),
      Q => p_2_in(0),
      R => SYSTEM_RESET_reg
    );
\cc_count_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => p_2_in(0),
      Q => \cc_count_r_reg_n_0_[5]\,
      R => SYSTEM_RESET_reg
    );
count_13d_flop_r_reg_r: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => '1',
      Q => count_13d_flop_r_reg_r_n_0,
      R => SYSTEM_RESET_reg
    );
\count_13d_srl_r_reg[10]_standard_cc_module_i_count_13d_srl_r_reg_r_9\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0\,
      Q => \count_13d_srl_r_reg[10]_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0\,
      R => '0'
    );
\count_13d_srl_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_gate_n_0,
      Q => count_16d_srl_r0,
      R => SYSTEM_RESET_reg
    );
\count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => user_clk,
      D => \count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0\,
      Q => \count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8_n_0\
    );
\count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => count_16d_srl_r0,
      I1 => reset_r,
      O => \count_13d_srl_r_reg[9]_srl11___standard_cc_module_i_count_13d_srl_r_reg_r_8_i_1_n_0\
    );
count_13d_srl_r_reg_gate: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count_13d_srl_r_reg[10]_standard_cc_module_i_count_13d_srl_r_reg_r_9_n_0\,
      I1 => count_13d_srl_r_reg_r_9_n_0,
      O => count_13d_srl_r_reg_gate_n_0
    );
count_13d_srl_r_reg_r: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_flop_r_reg_r_n_0,
      Q => count_13d_srl_r_reg_r_n_0,
      R => SYSTEM_RESET_reg
    );
count_13d_srl_r_reg_r_0: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_r_n_0,
      Q => count_13d_srl_r_reg_r_0_n_0,
      R => SYSTEM_RESET_reg
    );
count_13d_srl_r_reg_r_1: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_r_0_n_0,
      Q => count_13d_srl_r_reg_r_1_n_0,
      R => SYSTEM_RESET_reg
    );
count_13d_srl_r_reg_r_2: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_r_1_n_0,
      Q => count_13d_srl_r_reg_r_2_n_0,
      R => SYSTEM_RESET_reg
    );
count_13d_srl_r_reg_r_3: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_r_2_n_0,
      Q => count_13d_srl_r_reg_r_3_n_0,
      R => SYSTEM_RESET_reg
    );
count_13d_srl_r_reg_r_4: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_r_3_n_0,
      Q => count_13d_srl_r_reg_r_4_n_0,
      R => SYSTEM_RESET_reg
    );
count_13d_srl_r_reg_r_5: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_r_4_n_0,
      Q => count_13d_srl_r_reg_r_5_n_0,
      R => SYSTEM_RESET_reg
    );
count_13d_srl_r_reg_r_6: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_r_5_n_0,
      Q => count_13d_srl_r_reg_r_6_n_0,
      R => SYSTEM_RESET_reg
    );
count_13d_srl_r_reg_r_7: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_r_6_n_0,
      Q => count_13d_srl_r_reg_r_7_n_0,
      R => SYSTEM_RESET_reg
    );
count_13d_srl_r_reg_r_8: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_r_7_n_0,
      Q => count_13d_srl_r_reg_r_8_n_0,
      R => SYSTEM_RESET_reg
    );
count_13d_srl_r_reg_r_9: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_13d_srl_r_reg_r_8_n_0,
      Q => count_13d_srl_r_reg_r_9_n_0,
      R => SYSTEM_RESET_reg
    );
count_16d_flop_r_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FBF8"
    )
        port map (
      I0 => \count_16d_srl_r_reg_n_0_[14]\,
      I1 => count_16d_srl_r0,
      I2 => reset_r,
      I3 => count_16d_flop_r,
      O => count_16d_flop_r_i_1_n_0
    );
count_16d_flop_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_16d_flop_r_i_1_n_0,
      Q => count_16d_flop_r,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => count_16d_flop_r,
      Q => \count_16d_srl_r_reg_n_0_[0]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[9]\,
      Q => \count_16d_srl_r_reg_n_0_[10]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[10]\,
      Q => \count_16d_srl_r_reg_n_0_[11]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[11]\,
      Q => \count_16d_srl_r_reg_n_0_[12]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[12]\,
      Q => \count_16d_srl_r_reg_n_0_[13]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[13]\,
      Q => \count_16d_srl_r_reg_n_0_[14]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[0]\,
      Q => \count_16d_srl_r_reg_n_0_[1]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[1]\,
      Q => \count_16d_srl_r_reg_n_0_[2]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[2]\,
      Q => \count_16d_srl_r_reg_n_0_[3]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[3]\,
      Q => \count_16d_srl_r_reg_n_0_[4]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[4]\,
      Q => \count_16d_srl_r_reg_n_0_[5]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[5]\,
      Q => \count_16d_srl_r_reg_n_0_[6]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[6]\,
      Q => \count_16d_srl_r_reg_n_0_[7]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[7]\,
      Q => \count_16d_srl_r_reg_n_0_[8]\,
      R => SYSTEM_RESET_reg
    );
\count_16d_srl_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_16d_srl_r0,
      D => \count_16d_srl_r_reg_n_0_[8]\,
      Q => \count_16d_srl_r_reg_n_0_[9]\,
      R => SYSTEM_RESET_reg
    );
count_24d_flop_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBFFF80"
    )
        port map (
      I0 => \count_24d_srl_r_reg_n_0_[10]\,
      I1 => \count_16d_srl_r_reg_n_0_[14]\,
      I2 => count_16d_srl_r0,
      I3 => reset_r,
      I4 => count_24d_flop_r,
      O => count_24d_flop_r_i_1_n_0
    );
count_24d_flop_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => count_24d_flop_r_i_1_n_0,
      Q => count_24d_flop_r,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \count_16d_srl_r_reg_n_0_[14]\,
      I1 => count_16d_srl_r0,
      O => count_24d_srl_r0
    );
\count_24d_srl_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => count_24d_flop_r,
      Q => \count_24d_srl_r_reg_n_0_[0]\,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[9]\,
      Q => \count_24d_srl_r_reg_n_0_[10]\,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[0]\,
      Q => \count_24d_srl_r_reg_n_0_[1]\,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[1]\,
      Q => \count_24d_srl_r_reg_n_0_[2]\,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[2]\,
      Q => \count_24d_srl_r_reg_n_0_[3]\,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[3]\,
      Q => \count_24d_srl_r_reg_n_0_[4]\,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[4]\,
      Q => \count_24d_srl_r_reg_n_0_[5]\,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[5]\,
      Q => \count_24d_srl_r_reg_n_0_[6]\,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[6]\,
      Q => \count_24d_srl_r_reg_n_0_[7]\,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[7]\,
      Q => \count_24d_srl_r_reg_n_0_[8]\,
      R => SYSTEM_RESET_reg
    );
\count_24d_srl_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => count_24d_srl_r0,
      D => \count_24d_srl_r_reg_n_0_[8]\,
      Q => \count_24d_srl_r_reg_n_0_[9]\,
      R => SYSTEM_RESET_reg
    );
do_nfc_r_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => warn_cc,
      I1 => s_axi_nfc_req,
      I2 => s_axi_nfc_ack,
      I3 => \^do_cc_r_reg\,
      O => do_nfc_r
    );
\prepare_count_r_reg[7]_srl4___standard_cc_module_i_count_13d_srl_r_reg_r_1\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => cc_idle_count_done_c,
      Q => \prepare_count_r_reg[7]_srl4___standard_cc_module_i_count_13d_srl_r_reg_r_1_n_0\
    );
\prepare_count_r_reg[7]_srl4___standard_cc_module_i_count_13d_srl_r_reg_r_1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \count_24d_srl_r_reg_n_0_[10]\,
      I1 => \count_16d_srl_r_reg_n_0_[14]\,
      I2 => count_16d_srl_r0,
      O => cc_idle_count_done_c
    );
\prepare_count_r_reg[8]_standard_cc_module_i_count_13d_srl_r_reg_r_2\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \prepare_count_r_reg[7]_srl4___standard_cc_module_i_count_13d_srl_r_reg_r_1_n_0\,
      Q => \prepare_count_r_reg[8]_standard_cc_module_i_count_13d_srl_r_reg_r_2_n_0\,
      R => '0'
    );
\prepare_count_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => prepare_count_r_reg_gate_n_0,
      Q => p_3_out(2),
      R => SYSTEM_RESET_reg
    );
prepare_count_r_reg_gate: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \prepare_count_r_reg[8]_standard_cc_module_i_count_13d_srl_r_reg_r_2_n_0\,
      I1 => count_13d_srl_r_reg_r_2_n_0,
      O => prepare_count_r_reg_gate_n_0
    );
reset_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => SYSTEM_RESET_reg,
      Q => reset_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_CE_CONTROL is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_CE_CONTROL : entity is "dnpcie_aurora_2_sim_STORAGE_CE_CONTROL";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_CE_CONTROL;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_CE_CONTROL is
begin
\STORAGE_CE_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(1),
      Q => Q(1),
      R => SS(0)
    );
\STORAGE_CE_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(0),
      Q => Q(0),
      R => SS(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_COUNT_CONTROL is
  port (
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \STORAGE_CE_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_select_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    FRAME_ERR_RESULT0 : out STD_LOGIC;
    FRAME_ERR_RESULT_reg : out STD_LOGIC;
    EOF_N_reg : out STD_LOGIC;
    pad_storage_r_reg : out STD_LOGIC;
    \STORAGE_SELECT_reg[4]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    \COUNT_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    stage_2_start_with_data_r : in STD_LOGIC;
    stage_3_end_storage_r : in STD_LOGIC;
    stage_2_frame_err_r : in STD_LOGIC;
    stage_2_end_after_start_r : in STD_LOGIC;
    stage_2_end_before_start_r : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_COUNT_CONTROL : entity is "dnpcie_aurora_2_sim_STORAGE_COUNT_CONTROL";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_COUNT_CONTROL;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_COUNT_CONTROL is
  signal FRAME_ERR_RESULT_i_2_n_0 : STD_LOGIC;
  signal \^frame_err_result_reg\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal storage_count_c : STD_LOGIC_VECTOR ( 1 to 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of EOF_N_i_1 : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of FRAME_ERR_RESULT_i_2 : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of SRC_RDY_N_i_2 : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of end_storage_r_i_2 : label is "soft_lutpair79";
begin
  FRAME_ERR_RESULT_reg <= \^frame_err_result_reg\;
  Q(1 downto 0) <= \^q\(1 downto 0);
EOF_N_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000777F"
    )
        port map (
      I0 => stage_2_start_with_data_r,
      I1 => stage_2_end_before_start_r,
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => stage_3_end_storage_r,
      O => EOF_N_reg
    );
FRAME_ERR_RESULT_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFECFCCCFCECFCC"
    )
        port map (
      I0 => FRAME_ERR_RESULT_i_2_n_0,
      I1 => stage_2_frame_err_r,
      I2 => stage_2_start_with_data_r,
      I3 => stage_2_end_after_start_r,
      I4 => stage_2_end_before_start_r,
      I5 => \^frame_err_result_reg\,
      O => FRAME_ERR_RESULT0
    );
FRAME_ERR_RESULT_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \COUNT_reg[0]\(1),
      I3 => \COUNT_reg[0]\(0),
      O => FRAME_ERR_RESULT_i_2_n_0
    );
\OUTPUT_SELECT[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000444"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \COUNT_reg[0]\(0),
      I3 => \COUNT_reg[0]\(1),
      I4 => stage_2_start_with_data_r,
      I5 => stage_3_end_storage_r,
      O => output_select_c(0)
    );
SRC_RDY_N_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEE0"
    )
        port map (
      I0 => \^q\(0),
      I1 => \COUNT_reg[0]\(0),
      I2 => \^q\(1),
      I3 => \COUNT_reg[0]\(1),
      O => pad_storage_r_reg
    );
\STORAGE_CE[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => \^q\(0),
      I1 => \COUNT_reg[0]\(0),
      I2 => \COUNT_reg[0]\(1),
      I3 => stage_2_start_with_data_r,
      I4 => stage_3_end_storage_r,
      I5 => \^q\(1),
      O => \STORAGE_CE_reg[1]\(0)
    );
\STORAGE_SELECT[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \COUNT_reg[0]\(1),
      I3 => \COUNT_reg[0]\(0),
      O => \STORAGE_SELECT_reg[4]\(0)
    );
end_storage_r_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \^frame_err_result_reg\
    );
\storage_count_r[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCC6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \COUNT_reg[0]\(0),
      I2 => stage_2_start_with_data_r,
      I3 => stage_3_end_storage_r,
      O => storage_count_c(1)
    );
\storage_count_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(0),
      Q => \^q\(1),
      R => SR(0)
    );
\storage_count_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => storage_count_c(1),
      Q => \^q\(0),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_MUX is
  port (
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    E : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \MUXED_DATA_reg[16]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_MUX : entity is "dnpcie_aurora_2_sim_STORAGE_MUX";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_MUX;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_MUX is
begin
\STORAGE_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(31),
      Q => Q(31),
      R => '0'
    );
\STORAGE_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(21),
      Q => Q(21),
      R => '0'
    );
\STORAGE_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(20),
      Q => Q(20),
      R => '0'
    );
\STORAGE_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(19),
      Q => Q(19),
      R => '0'
    );
\STORAGE_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(18),
      Q => Q(18),
      R => '0'
    );
\STORAGE_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(17),
      Q => Q(17),
      R => '0'
    );
\STORAGE_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(16),
      Q => Q(16),
      R => '0'
    );
\STORAGE_DATA_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(15),
      Q => Q(15),
      R => '0'
    );
\STORAGE_DATA_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(14),
      Q => Q(14),
      R => '0'
    );
\STORAGE_DATA_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(13),
      Q => Q(13),
      R => '0'
    );
\STORAGE_DATA_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(12),
      Q => Q(12),
      R => '0'
    );
\STORAGE_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(30),
      Q => Q(30),
      R => '0'
    );
\STORAGE_DATA_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(11),
      Q => Q(11),
      R => '0'
    );
\STORAGE_DATA_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(10),
      Q => Q(10),
      R => '0'
    );
\STORAGE_DATA_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(9),
      Q => Q(9),
      R => '0'
    );
\STORAGE_DATA_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(8),
      Q => Q(8),
      R => '0'
    );
\STORAGE_DATA_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(7),
      Q => Q(7),
      R => '0'
    );
\STORAGE_DATA_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(6),
      Q => Q(6),
      R => '0'
    );
\STORAGE_DATA_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(5),
      Q => Q(5),
      R => '0'
    );
\STORAGE_DATA_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(4),
      Q => Q(4),
      R => '0'
    );
\STORAGE_DATA_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(3),
      Q => Q(3),
      R => '0'
    );
\STORAGE_DATA_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(2),
      Q => Q(2),
      R => '0'
    );
\STORAGE_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(29),
      Q => Q(29),
      R => '0'
    );
\STORAGE_DATA_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(1),
      Q => Q(1),
      R => '0'
    );
\STORAGE_DATA_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => \MUXED_DATA_reg[16]\(0),
      Q => Q(0),
      R => '0'
    );
\STORAGE_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(28),
      Q => Q(28),
      R => '0'
    );
\STORAGE_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(27),
      Q => Q(27),
      R => '0'
    );
\STORAGE_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(26),
      Q => Q(26),
      R => '0'
    );
\STORAGE_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(25),
      Q => Q(25),
      R => '0'
    );
\STORAGE_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(24),
      Q => Q(24),
      R => '0'
    );
\STORAGE_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(23),
      Q => Q(23),
      R => '0'
    );
\STORAGE_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(1),
      D => \MUXED_DATA_reg[16]\(22),
      Q => Q(22),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_SWITCH_CONTROL is
  port (
    \STORAGE_DATA_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_SWITCH_CONTROL : entity is "dnpcie_aurora_2_sim_STORAGE_SWITCH_CONTROL";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_SWITCH_CONTROL;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_SWITCH_CONTROL is
begin
\STORAGE_SELECT_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(1),
      Q => \STORAGE_DATA_reg[0]\(1),
      R => SS(0)
    );
\STORAGE_SELECT_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => D(0),
      Q => \STORAGE_DATA_reg[0]\(0),
      S => SS(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SYM_DEC_4BYTE is
  port (
    RX_NEG : out STD_LOGIC;
    got_v_i : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rx_fc_nb : out STD_LOGIC_VECTOR ( 0 to 3 );
    first_v_received_r : out STD_LOGIC;
    \channel_fcnb_r_reg[7]\ : out STD_LOGIC;
    \channel_fcnb_r_reg[6]\ : out STD_LOGIC;
    \channel_fcnb_r_reg[5]\ : out STD_LOGIC;
    \channel_fcnb_r_reg[4]\ : out STD_LOGIC;
    counter4_r0 : out STD_LOGIC;
    counter3_r0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \word_aligned_data_r_reg[9]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \word_aligned_control_bits_r_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    stage_1_load_nfc_r_reg : out STD_LOGIC;
    m_axi_nfc_rx_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stage_1_pad_r_reg : out STD_LOGIC;
    \rx_spa_r_reg[4]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    in_frame_r_reg : out STD_LOGIC;
    \stage_1_ecp_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \stage_1_scp_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \IN_FRAME_reg[1]\ : out STD_LOGIC;
    \rx_ecp_d_r_reg[7]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \rx_sp_neg_d_r_reg[1]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \rx_snf_d_r_reg[0]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \DEFRAMED_DATA_V_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    after_scp_select_c_0 : out STD_LOGIC;
    after_scp_select_c_1 : out STD_LOGIC;
    user_clk : in STD_LOGIC;
    \left_align_select_r_reg[1]_0\ : in STD_LOGIC;
    \previous_cycle_control_r_reg[0]_0\ : in STD_LOGIC;
    ready_r : in STD_LOGIC;
    gen_spa_i : in STD_LOGIC;
    gtwiz_userdata_rx_out : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rxctrl0_out : in STD_LOGIC_VECTOR ( 3 downto 0 );
    lane_up : in STD_LOGIC;
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrxreset_out_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \left_align_select_r_reg[1]_1\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \previous_cycle_data_r_reg[6]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SYM_DEC_4BYTE : entity is "dnpcie_aurora_2_sim_SYM_DEC_4BYTE";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SYM_DEC_4BYTE;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SYM_DEC_4BYTE is
  signal GOT_V_i_2_n_0 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal RX_CC0 : STD_LOGIC;
  signal RX_CC_i_2_n_0 : STD_LOGIC;
  signal RX_CC_i_3_n_0 : STD_LOGIC;
  signal RX_ECP0 : STD_LOGIC;
  signal \RX_ECP[1]_i_1_n_0\ : STD_LOGIC;
  signal RX_NEG0 : STD_LOGIC;
  signal RX_SCP0 : STD_LOGIC;
  signal \RX_SCP[1]_i_1_n_0\ : STD_LOGIC;
  signal RX_SNF0 : STD_LOGIC;
  signal \RX_SNF[1]_i_1_n_0\ : STD_LOGIC;
  signal RX_SP0 : STD_LOGIC;
  signal RX_SPA0 : STD_LOGIC;
  signal RX_SPA_i_2_n_0 : STD_LOGIC;
  signal RX_SP_i_2_n_0 : STD_LOGIC;
  signal RX_SP_i_3_n_0 : STD_LOGIC;
  signal \^first_v_received_r\ : STD_LOGIC;
  signal first_v_received_r_i_1_n_0 : STD_LOGIC;
  signal got_v_c : STD_LOGIC;
  signal \^m_axi_nfc_rx_tvalid\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal p_2_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_3_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_8_out : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal previous_cycle_control_r : STD_LOGIC_VECTOR ( 2 downto 1 );
  signal \previous_cycle_data_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[16]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[17]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[18]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[19]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[20]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[21]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[22]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[23]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \previous_cycle_data_r_reg_n_0_[7]\ : STD_LOGIC;
  signal rx_cc_r : STD_LOGIC_VECTOR ( 1 to 7 );
  signal \rx_cc_r0__0\ : STD_LOGIC;
  signal \rx_cc_r0_inferred__0/i__n_0\ : STD_LOGIC;
  signal \rx_cc_r0_inferred__1/i__n_0\ : STD_LOGIC;
  signal rx_cc_r0_n_0 : STD_LOGIC;
  signal rx_ecp_d_r : STD_LOGIC_VECTOR ( 0 to 7 );
  signal \rx_ecp_d_r0__0\ : STD_LOGIC;
  signal \rx_ecp_d_r0_inferred__0/i__n_0\ : STD_LOGIC;
  signal \rx_ecp_d_r0_inferred__1/i__n_0\ : STD_LOGIC;
  signal \rx_ecp_d_r0_inferred__2/i__n_0\ : STD_LOGIC;
  signal \rx_ecp_d_r0_inferred__3/i__n_0\ : STD_LOGIC;
  signal rx_ecp_d_r0_n_0 : STD_LOGIC;
  signal \^rx_ecp_d_r_reg[7]_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rx_pad_d_r : STD_LOGIC_VECTOR ( 0 to 2 );
  signal \rx_pad_d_r0__0\ : STD_LOGIC;
  signal \rx_pad_d_r0_inferred__0/i__n_0\ : STD_LOGIC;
  signal \rx_pad_d_r0_inferred__1/i__n_0\ : STD_LOGIC;
  signal rx_pad_d_r0_n_0 : STD_LOGIC;
  signal rx_pad_striped_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal \rx_pe_control_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \rx_pe_control_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \rx_pe_control_r_reg_n_0_[3]\ : STD_LOGIC;
  signal rx_pe_data_r : STD_LOGIC_VECTOR ( 8 to 11 );
  signal rx_scp_d_r : STD_LOGIC_VECTOR ( 0 to 7 );
  signal \rx_scp_d_r0_inferred__0/i__n_0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__1/i__n_0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__2/i__n_0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__3/i__n_0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__4/i__n_0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__5/i__n_0\ : STD_LOGIC;
  signal \rx_scp_d_r0_inferred__6/i__n_0\ : STD_LOGIC;
  signal rx_scp_d_r0_n_0 : STD_LOGIC;
  signal rx_snf_d_r : STD_LOGIC_VECTOR ( 0 to 2 );
  signal rx_snf_d_r0 : STD_LOGIC;
  signal \rx_snf_d_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \^rx_snf_d_r_reg[0]_0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_sp_i : STD_LOGIC;
  signal rx_sp_neg_d_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal \^rx_sp_neg_d_r_reg[1]_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rx_sp_r : STD_LOGIC_VECTOR ( 0 to 7 );
  signal rx_sp_r0_n_0 : STD_LOGIC;
  signal rx_sp_r111_in : STD_LOGIC;
  signal rx_sp_r114_in : STD_LOGIC;
  signal rx_spa_i : STD_LOGIC;
  signal rx_spa_neg_d_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal \rx_spa_neg_d_r0__0\ : STD_LOGIC;
  signal rx_spa_neg_d_r0_n_0 : STD_LOGIC;
  signal rx_spa_r : STD_LOGIC_VECTOR ( 2 to 7 );
  signal \rx_spa_r0__0\ : STD_LOGIC;
  signal \rx_spa_r0_inferred__0/i__n_0\ : STD_LOGIC;
  signal rx_spa_r0_n_0 : STD_LOGIC;
  signal \^rx_spa_r_reg[4]_0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_v_d_r : STD_LOGIC_VECTOR ( 2 to 7 );
  signal \rx_v_d_r0__0\ : STD_LOGIC;
  signal \rx_v_d_r0_inferred__0/i__n_0\ : STD_LOGIC;
  signal \rx_v_d_r0_inferred__1/i__n_0\ : STD_LOGIC;
  signal \rx_v_d_r0_inferred__2/i__n_0\ : STD_LOGIC;
  signal \rx_v_d_r0_inferred__3/i__n_0\ : STD_LOGIC;
  signal rx_v_d_r0_n_0 : STD_LOGIC;
  signal \^stage_1_ecp_r_reg[0]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^stage_1_scp_r_reg[0]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal word_aligned_control_bits_r : STD_LOGIC_VECTOR ( 0 to 2 );
  signal \word_aligned_control_bits_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_control_bits_r[1]_i_1_n_0\ : STD_LOGIC;
  signal word_aligned_control_bits_r_reg : STD_LOGIC;
  signal \^word_aligned_control_bits_r_reg[1]_0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \word_aligned_data_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[10]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[11]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[12]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[13]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[14]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[15]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[16]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[18]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[19]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[23]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[4]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[5]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[6]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[7]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[8]_i_1_n_0\ : STD_LOGIC;
  signal \word_aligned_data_r[9]_i_1_n_0\ : STD_LOGIC;
  signal \^word_aligned_data_r_reg[9]_0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \word_aligned_data_r_reg_n_0_[24]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[25]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[26]\ : STD_LOGIC;
  signal \word_aligned_data_r_reg_n_0_[27]\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \RX_FC_NB_reg[4]_srl2\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_sym_dec_4byte_i/RX_FC_NB_reg ";
  attribute srl_name : string;
  attribute srl_name of \RX_FC_NB_reg[4]_srl2\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_sym_dec_4byte_i/RX_FC_NB_reg[4]_srl2 ";
  attribute srl_bus_name of \RX_FC_NB_reg[5]_srl2\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_sym_dec_4byte_i/RX_FC_NB_reg ";
  attribute srl_name of \RX_FC_NB_reg[5]_srl2\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_sym_dec_4byte_i/RX_FC_NB_reg[5]_srl2 ";
  attribute srl_bus_name of \RX_FC_NB_reg[6]_srl2\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_sym_dec_4byte_i/RX_FC_NB_reg ";
  attribute srl_name of \RX_FC_NB_reg[6]_srl2\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_sym_dec_4byte_i/RX_FC_NB_reg[6]_srl2 ";
  attribute srl_bus_name of \RX_FC_NB_reg[7]_srl2\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_sym_dec_4byte_i/RX_FC_NB_reg ";
  attribute srl_name of \RX_FC_NB_reg[7]_srl2\ : label is "inst/\dnpcie_aurora_2_sim_aurora_lane_4byte_0_i/dnpcie_aurora_2_sim_sym_dec_4byte_i/RX_FC_NB_reg[7]_srl2 ";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \RX_PAD[1]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \RX_PE_DATA_V[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \RX_PE_DATA_V[1]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of RX_SP_i_2 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of rx_cc_r0 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \rx_cc_r0_inferred__1/i_\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of rx_ecp_d_r0 : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \rx_ecp_d_r0_inferred__0/i_\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \rx_ecp_d_r0_inferred__1/i_\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \rx_ecp_d_r0_inferred__2/i_\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \rx_ecp_d_r0_inferred__3/i_\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \rx_ecp_d_r0_inferred__4/i_\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of rx_pad_d_r0 : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \rx_pad_d_r0_inferred__0/i_\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \rx_pad_d_r0_inferred__1/i_\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \rx_pad_d_r0_inferred__2/i_\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of rx_scp_d_r0 : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__0/i_\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__1/i_\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__2/i_\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__3/i_\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__4/i_\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__5/i_\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \rx_scp_d_r0_inferred__6/i_\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \rx_snf_d_r0_inferred__0/i_\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \rx_snf_d_r[2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of rx_sp_r0 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of rx_sp_r1 : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \rx_sp_r1_inferred__0/i_\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \rx_sp_r[2]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \rx_sp_r[3]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \rx_sp_r[4]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \rx_sp_r[5]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \rx_sp_r[6]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \rx_sp_r[7]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of rx_spa_neg_d_r0 : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \rx_spa_r0_inferred__0/i_\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \rx_spa_r0_inferred__1/i_\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of rx_v_d_r0 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \rx_v_d_r0_inferred__0/i_\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \rx_v_d_r0_inferred__1/i_\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \rx_v_d_r0_inferred__2/i_\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \rx_v_d_r0_inferred__3/i_\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \rx_v_d_r0_inferred__4/i_\ : label is "soft_lutpair17";
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
  first_v_received_r <= \^first_v_received_r\;
  m_axi_nfc_rx_tvalid(1 downto 0) <= \^m_axi_nfc_rx_tvalid\(1 downto 0);
  \rx_ecp_d_r_reg[7]_0\(3 downto 0) <= \^rx_ecp_d_r_reg[7]_0\(3 downto 0);
  \rx_snf_d_r_reg[0]_0\(7 downto 0) <= \^rx_snf_d_r_reg[0]_0\(7 downto 0);
  \rx_sp_neg_d_r_reg[1]_0\(3 downto 0) <= \^rx_sp_neg_d_r_reg[1]_0\(3 downto 0);
  \rx_spa_r_reg[4]_0\(7 downto 0) <= \^rx_spa_r_reg[4]_0\(7 downto 0);
  \stage_1_ecp_r_reg[0]\(1 downto 0) <= \^stage_1_ecp_r_reg[0]\(1 downto 0);
  \stage_1_scp_r_reg[0]\(1 downto 0) <= \^stage_1_scp_r_reg[0]\(1 downto 0);
  \word_aligned_control_bits_r_reg[1]_0\(0) <= \^word_aligned_control_bits_r_reg[1]_0\(0);
  \word_aligned_data_r_reg[9]_0\(3 downto 0) <= \^word_aligned_data_r_reg[9]_0\(3 downto 0);
GOT_V_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => RX_SP_i_2_n_0,
      I1 => GOT_V_i_2_n_0,
      I2 => rx_sp_r(0),
      I3 => rx_snf_d_r(1),
      I4 => rx_v_d_r(3),
      I5 => rx_v_d_r(2),
      O => got_v_c
    );
GOT_V_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => rx_v_d_r(5),
      I1 => rx_v_d_r(4),
      I2 => rx_v_d_r(7),
      I3 => rx_v_d_r(6),
      O => GOT_V_i_2_n_0
    );
GOT_V_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => got_v_c,
      Q => got_v_i,
      R => '0'
    );
RX_CC_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => \rx_pe_control_r_reg_n_0_[2]\,
      I1 => \rx_pe_control_r_reg_n_0_[3]\,
      I2 => \rx_pe_control_r_reg_n_0_[1]\,
      I3 => p_1_in,
      I4 => RX_CC_i_2_n_0,
      I5 => RX_CC_i_3_n_0,
      O => RX_CC0
    );
RX_CC_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => rx_cc_r(5),
      I1 => rx_ecp_d_r(4),
      I2 => rx_cc_r(7),
      I3 => rx_ecp_d_r(6),
      O => RX_CC_i_2_n_0
    );
RX_CC_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => rx_ecp_d_r(0),
      I1 => rx_cc_r(1),
      I2 => rx_cc_r(3),
      I3 => rx_ecp_d_r(2),
      O => RX_CC_i_3_n_0
    );
RX_CC_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => RX_CC0,
      Q => D(0),
      R => '0'
    );
\RX_ECP[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rx_ecp_d_r(2),
      I1 => rx_ecp_d_r(3),
      I2 => \rx_pe_control_r_reg_n_0_[1]\,
      I3 => p_1_in,
      I4 => rx_ecp_d_r(1),
      I5 => rx_ecp_d_r(0),
      O => RX_ECP0
    );
\RX_ECP[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rx_ecp_d_r(6),
      I1 => rx_ecp_d_r(7),
      I2 => \rx_pe_control_r_reg_n_0_[3]\,
      I3 => \rx_pe_control_r_reg_n_0_[2]\,
      I4 => rx_ecp_d_r(5),
      I5 => rx_ecp_d_r(4),
      O => \RX_ECP[1]_i_1_n_0\
    );
\RX_ECP_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => RX_ECP0,
      Q => \^stage_1_ecp_r_reg[0]\(1),
      R => '0'
    );
\RX_ECP_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \RX_ECP[1]_i_1_n_0\,
      Q => \^stage_1_ecp_r_reg[0]\(0),
      R => '0'
    );
\RX_FC_NB_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_pe_data_r(8),
      Q => m_axi_rx_fc_nb(0),
      R => '0'
    );
\RX_FC_NB_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_pe_data_r(9),
      Q => m_axi_rx_fc_nb(1),
      R => '0'
    );
\RX_FC_NB_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_pe_data_r(10),
      Q => m_axi_rx_fc_nb(2),
      R => '0'
    );
\RX_FC_NB_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_pe_data_r(11),
      Q => m_axi_rx_fc_nb(3),
      R => '0'
    );
\RX_FC_NB_reg[4]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg_n_0_[24]\,
      Q => \channel_fcnb_r_reg[4]\
    );
\RX_FC_NB_reg[5]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg_n_0_[25]\,
      Q => \channel_fcnb_r_reg[5]\
    );
\RX_FC_NB_reg[6]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg_n_0_[26]\,
      Q => \channel_fcnb_r_reg[6]\
    );
\RX_FC_NB_reg[7]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg_n_0_[27]\,
      Q => \channel_fcnb_r_reg[7]\
    );
RX_NEG_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F888"
    )
        port map (
      I0 => rx_spa_neg_d_r(1),
      I1 => rx_spa_neg_d_r(0),
      I2 => rx_sp_neg_d_r(1),
      I3 => rx_sp_neg_d_r(0),
      I4 => \rx_pe_control_r_reg_n_0_[1]\,
      O => RX_NEG0
    );
RX_NEG_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => RX_NEG0,
      Q => RX_NEG,
      R => '0'
    );
\RX_PAD[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => rx_pad_d_r(0),
      I1 => rx_spa_r(3),
      I2 => p_1_in,
      I3 => \rx_pe_control_r_reg_n_0_[1]\,
      O => p_3_out(1)
    );
\RX_PAD[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => rx_pad_d_r(2),
      I1 => rx_spa_r(7),
      I2 => \rx_pe_control_r_reg_n_0_[2]\,
      I3 => \rx_pe_control_r_reg_n_0_[3]\,
      O => p_3_out(0)
    );
\RX_PAD_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_3_out(1),
      Q => rx_pad_striped_i(0),
      R => '0'
    );
\RX_PAD_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_3_out(0),
      Q => rx_pad_striped_i(1),
      R => '0'
    );
\RX_PE_DATA_V[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => p_1_in,
      O => p_2_out(1)
    );
\RX_PE_DATA_V[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \rx_pe_control_r_reg_n_0_[2]\,
      O => p_2_out(0)
    );
\RX_PE_DATA_V_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_2_out(1),
      Q => \DEFRAMED_DATA_V_reg[0]\(1),
      R => '0'
    );
\RX_PE_DATA_V_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_2_out(0),
      Q => \DEFRAMED_DATA_V_reg[0]\(0),
      R => '0'
    );
\RX_SCP[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rx_ecp_d_r(2),
      I1 => rx_scp_d_r(3),
      I2 => \rx_pe_control_r_reg_n_0_[1]\,
      I3 => p_1_in,
      I4 => rx_snf_d_r(1),
      I5 => rx_scp_d_r(0),
      O => RX_SCP0
    );
\RX_SCP[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => rx_ecp_d_r(6),
      I1 => rx_scp_d_r(7),
      I2 => \rx_pe_control_r_reg_n_0_[3]\,
      I3 => \rx_pe_control_r_reg_n_0_[2]\,
      I4 => rx_spa_r(5),
      I5 => rx_scp_d_r(4),
      O => \RX_SCP[1]_i_1_n_0\
    );
\RX_SCP_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => RX_SCP0,
      Q => \^stage_1_scp_r_reg[0]\(1),
      R => '0'
    );
\RX_SCP_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \RX_SCP[1]_i_1_n_0\,
      Q => \^stage_1_scp_r_reg[0]\(0),
      R => '0'
    );
\RX_SNF[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => rx_snf_d_r(1),
      I1 => p_1_in,
      I2 => rx_snf_d_r(0),
      O => RX_SNF0
    );
\RX_SNF[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => rx_spa_r(5),
      I1 => \rx_pe_control_r_reg_n_0_[2]\,
      I2 => rx_snf_d_r(2),
      O => \RX_SNF[1]_i_1_n_0\
    );
\RX_SNF_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => RX_SNF0,
      Q => \^m_axi_nfc_rx_tvalid\(1),
      R => '0'
    );
\RX_SNF_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \RX_SNF[1]_i_1_n_0\,
      Q => \^m_axi_nfc_rx_tvalid\(0),
      R => '0'
    );
RX_SPA_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => RX_SP_i_2_n_0,
      I1 => RX_SPA_i_2_n_0,
      I2 => rx_sp_r(0),
      I3 => rx_snf_d_r(1),
      I4 => rx_spa_r(3),
      I5 => rx_spa_r(2),
      O => RX_SPA0
    );
RX_SPA_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => rx_spa_r(5),
      I1 => rx_spa_r(4),
      I2 => rx_spa_r(7),
      I3 => rx_spa_r(6),
      O => RX_SPA_i_2_n_0
    );
RX_SPA_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => RX_SPA0,
      Q => rx_spa_i,
      R => '0'
    );
RX_SP_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => RX_SP_i_2_n_0,
      I1 => RX_SP_i_3_n_0,
      I2 => rx_sp_r(0),
      I3 => rx_snf_d_r(1),
      I4 => rx_sp_r(3),
      I5 => rx_sp_r(2),
      O => RX_SP0
    );
RX_SP_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \rx_pe_control_r_reg_n_0_[3]\,
      I1 => \rx_pe_control_r_reg_n_0_[1]\,
      I2 => p_1_in,
      I3 => \rx_pe_control_r_reg_n_0_[2]\,
      O => RX_SP_i_2_n_0
    );
RX_SP_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => rx_sp_r(5),
      I1 => rx_sp_r(4),
      I2 => rx_sp_r(7),
      I3 => rx_sp_r(6),
      O => RX_SP_i_3_n_0
    );
RX_SP_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => RX_SP0,
      Q => rx_sp_i,
      R => '0'
    );
\counter3_r_reg[2]_srl3_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rx_spa_i,
      I1 => gen_spa_i,
      O => counter3_r0
    );
\counter4_r_reg[14]_srl15_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => rx_sp_i,
      I1 => ready_r,
      O => counter4_r0
    );
data_after_start_muxcy_0_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^stage_1_scp_r_reg[0]\(1),
      O => after_scp_select_c_1
    );
data_after_start_muxcy_1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^stage_1_scp_r_reg[0]\(0),
      O => after_scp_select_c_0
    );
first_v_received_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => lane_up,
      I1 => \^first_v_received_r\,
      I2 => got_v_c,
      O => first_v_received_r_i_1_n_0
    );
first_v_received_r_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => first_v_received_r_i_1_n_0,
      Q => \^first_v_received_r\,
      R => '0'
    );
in_frame_muxcy_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^stage_1_ecp_r_reg[0]\(1),
      I1 => \^stage_1_scp_r_reg[0]\(1),
      O => \IN_FRAME_reg[1]\
    );
in_frame_muxcy_1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^stage_1_ecp_r_reg[0]\(0),
      I1 => \^stage_1_scp_r_reg[0]\(0),
      O => in_frame_r_reg
    );
\left_align_select_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => gtrxreset_out_reg(1),
      Q => \^q\(1),
      R => '0'
    );
\left_align_select_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => gtrxreset_out_reg(0),
      Q => \^q\(0),
      R => '0'
    );
\previous_cycle_control_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rxctrl0_out(3),
      Q => \^word_aligned_control_bits_r_reg[1]_0\(0),
      R => '0'
    );
\previous_cycle_control_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rxctrl0_out(2),
      Q => previous_cycle_control_r(1),
      R => '0'
    );
\previous_cycle_control_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rxctrl0_out(1),
      Q => previous_cycle_control_r(2),
      R => '0'
    );
\previous_cycle_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(24),
      Q => \previous_cycle_data_r_reg_n_0_[0]\,
      R => '0'
    );
\previous_cycle_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(18),
      Q => p_2_in(2),
      R => '0'
    );
\previous_cycle_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(19),
      Q => p_2_in(3),
      R => '0'
    );
\previous_cycle_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(20),
      Q => p_2_in(4),
      R => '0'
    );
\previous_cycle_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(21),
      Q => p_2_in(5),
      R => '0'
    );
\previous_cycle_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(22),
      Q => p_2_in(6),
      R => '0'
    );
\previous_cycle_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(23),
      Q => p_2_in(7),
      R => '0'
    );
\previous_cycle_data_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(8),
      Q => \previous_cycle_data_r_reg_n_0_[16]\,
      R => '0'
    );
\previous_cycle_data_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(9),
      Q => \previous_cycle_data_r_reg_n_0_[17]\,
      R => '0'
    );
\previous_cycle_data_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(10),
      Q => \previous_cycle_data_r_reg_n_0_[18]\,
      R => '0'
    );
\previous_cycle_data_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(11),
      Q => \previous_cycle_data_r_reg_n_0_[19]\,
      R => '0'
    );
\previous_cycle_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(25),
      Q => \^word_aligned_data_r_reg[9]_0\(0),
      R => '0'
    );
\previous_cycle_data_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(12),
      Q => \previous_cycle_data_r_reg_n_0_[20]\,
      R => '0'
    );
\previous_cycle_data_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(13),
      Q => \previous_cycle_data_r_reg_n_0_[21]\,
      R => '0'
    );
\previous_cycle_data_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(14),
      Q => \previous_cycle_data_r_reg_n_0_[22]\,
      R => '0'
    );
\previous_cycle_data_r_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(15),
      Q => \previous_cycle_data_r_reg_n_0_[23]\,
      R => '0'
    );
\previous_cycle_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(26),
      Q => \^word_aligned_data_r_reg[9]_0\(1),
      R => '0'
    );
\previous_cycle_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(27),
      Q => \^word_aligned_data_r_reg[9]_0\(2),
      R => '0'
    );
\previous_cycle_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(28),
      Q => \previous_cycle_data_r_reg_n_0_[4]\,
      R => '0'
    );
\previous_cycle_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(29),
      Q => \previous_cycle_data_r_reg_n_0_[5]\,
      R => '0'
    );
\previous_cycle_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(30),
      Q => \^word_aligned_data_r_reg[9]_0\(3),
      R => '0'
    );
\previous_cycle_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(31),
      Q => \previous_cycle_data_r_reg_n_0_[7]\,
      R => '0'
    );
\previous_cycle_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(16),
      Q => p_2_in(0),
      R => '0'
    );
\previous_cycle_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userdata_rx_out(17),
      Q => p_2_in(1),
      R => '0'
    );
rx_cc_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_ecp_d_r_reg[7]_0\(3),
      I1 => \^rx_ecp_d_r_reg[7]_0\(2),
      I2 => \^rx_ecp_d_r_reg[7]_0\(1),
      I3 => \^rx_ecp_d_r_reg[7]_0\(0),
      O => rx_cc_r0_n_0
    );
\rx_cc_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(3),
      I1 => \^rx_spa_r_reg[4]_0\(2),
      I2 => \^rx_spa_r_reg[4]_0\(1),
      I3 => \^rx_spa_r_reg[4]_0\(0),
      O => \rx_cc_r0_inferred__0/i__n_0\
    );
\rx_cc_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_sp_neg_d_r_reg[1]_0\(3),
      I1 => \^rx_sp_neg_d_r_reg[1]_0\(2),
      I2 => \^rx_sp_neg_d_r_reg[1]_0\(1),
      I3 => \^rx_sp_neg_d_r_reg[1]_0\(0),
      O => \rx_cc_r0_inferred__1/i__n_0\
    );
\rx_cc_r0_inferred__2/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_snf_d_r_reg[0]_0\(3),
      I1 => \^rx_snf_d_r_reg[0]_0\(2),
      I2 => \^rx_snf_d_r_reg[0]_0\(1),
      I3 => \^rx_snf_d_r_reg[0]_0\(0),
      O => \rx_cc_r0__0\
    );
\rx_cc_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_cc_r0__0\,
      Q => rx_cc_r(1),
      R => '0'
    );
\rx_cc_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_cc_r0_inferred__1/i__n_0\,
      Q => rx_cc_r(3),
      R => '0'
    );
\rx_cc_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_cc_r0_inferred__0/i__n_0\,
      Q => rx_cc_r(5),
      R => '0'
    );
\rx_cc_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_cc_r0_n_0,
      Q => rx_cc_r(7),
      R => '0'
    );
rx_ecp_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_ecp_d_r_reg[7]_0\(0),
      I1 => \^rx_ecp_d_r_reg[7]_0\(2),
      I2 => \^rx_ecp_d_r_reg[7]_0\(3),
      I3 => \^rx_ecp_d_r_reg[7]_0\(1),
      O => rx_ecp_d_r0_n_0
    );
\rx_ecp_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(1),
      I1 => \^rx_spa_r_reg[4]_0\(2),
      I2 => \^rx_spa_r_reg[4]_0\(3),
      I3 => \^rx_spa_r_reg[4]_0\(0),
      O => \rx_ecp_d_r0_inferred__0/i__n_0\
    );
\rx_ecp_d_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(5),
      I1 => \^rx_spa_r_reg[4]_0\(4),
      I2 => \^rx_spa_r_reg[4]_0\(6),
      I3 => \^rx_spa_r_reg[4]_0\(7),
      O => \rx_ecp_d_r0_inferred__1/i__n_0\
    );
\rx_ecp_d_r0_inferred__2/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_sp_neg_d_r_reg[1]_0\(0),
      I1 => \^rx_sp_neg_d_r_reg[1]_0\(2),
      I2 => \^rx_sp_neg_d_r_reg[1]_0\(3),
      I3 => \^rx_sp_neg_d_r_reg[1]_0\(1),
      O => \rx_ecp_d_r0_inferred__2/i__n_0\
    );
\rx_ecp_d_r0_inferred__3/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_snf_d_r_reg[0]_0\(1),
      I1 => \^rx_snf_d_r_reg[0]_0\(2),
      I2 => \^rx_snf_d_r_reg[0]_0\(3),
      I3 => \^rx_snf_d_r_reg[0]_0\(0),
      O => \rx_ecp_d_r0_inferred__3/i__n_0\
    );
\rx_ecp_d_r0_inferred__4/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^rx_snf_d_r_reg[0]_0\(5),
      I1 => \^rx_snf_d_r_reg[0]_0\(4),
      I2 => \^rx_snf_d_r_reg[0]_0\(6),
      I3 => \^rx_snf_d_r_reg[0]_0\(7),
      O => \rx_ecp_d_r0__0\
    );
\rx_ecp_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_ecp_d_r0__0\,
      Q => rx_ecp_d_r(0),
      R => '0'
    );
\rx_ecp_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_ecp_d_r0_inferred__3/i__n_0\,
      Q => rx_ecp_d_r(1),
      R => '0'
    );
\rx_ecp_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_scp_d_r0_inferred__5/i__n_0\,
      Q => rx_ecp_d_r(2),
      R => '0'
    );
\rx_ecp_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_ecp_d_r0_inferred__2/i__n_0\,
      Q => rx_ecp_d_r(3),
      R => '0'
    );
\rx_ecp_d_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_ecp_d_r0_inferred__1/i__n_0\,
      Q => rx_ecp_d_r(4),
      R => '0'
    );
\rx_ecp_d_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_ecp_d_r0_inferred__0/i__n_0\,
      Q => rx_ecp_d_r(5),
      R => '0'
    );
\rx_ecp_d_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_scp_d_r0_inferred__1/i__n_0\,
      Q => rx_ecp_d_r(6),
      R => '0'
    );
\rx_ecp_d_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_ecp_d_r0_n_0,
      Q => rx_ecp_d_r(7),
      R => '0'
    );
rx_pad_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \^rx_ecp_d_r_reg[7]_0\(1),
      I1 => \^rx_ecp_d_r_reg[7]_0\(0),
      I2 => \^rx_ecp_d_r_reg[7]_0\(2),
      I3 => \^rx_ecp_d_r_reg[7]_0\(3),
      O => rx_pad_d_r0_n_0
    );
\rx_pad_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[25]\,
      I1 => \word_aligned_data_r_reg_n_0_[26]\,
      I2 => \word_aligned_data_r_reg_n_0_[24]\,
      I3 => \word_aligned_data_r_reg_n_0_[27]\,
      O => \rx_pad_d_r0_inferred__0/i__n_0\
    );
\rx_pad_d_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \^rx_sp_neg_d_r_reg[1]_0\(1),
      I1 => \^rx_sp_neg_d_r_reg[1]_0\(0),
      I2 => \^rx_sp_neg_d_r_reg[1]_0\(2),
      I3 => \^rx_sp_neg_d_r_reg[1]_0\(3),
      O => \rx_pad_d_r0_inferred__1/i__n_0\
    );
\rx_pad_d_r0_inferred__2/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(1),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      O => \rx_pad_d_r0__0\
    );
\rx_pad_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_pad_d_r0__0\,
      Q => rx_pad_d_r(0),
      R => '0'
    );
\rx_pad_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_pad_d_r0_inferred__0/i__n_0\,
      Q => rx_pad_d_r(2),
      R => '0'
    );
\rx_pe_control_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => word_aligned_control_bits_r(0),
      Q => p_1_in,
      R => '0'
    );
\rx_pe_control_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => word_aligned_control_bits_r(1),
      Q => \rx_pe_control_r_reg_n_0_[1]\,
      R => '0'
    );
\rx_pe_control_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => word_aligned_control_bits_r(2),
      Q => \rx_pe_control_r_reg_n_0_[2]\,
      R => '0'
    );
\rx_pe_control_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => word_aligned_control_bits_r_reg,
      Q => \rx_pe_control_r_reg_n_0_[3]\,
      R => '0'
    );
\rx_pe_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_0_in(1),
      Q => rx_pe_data_r(10),
      R => '0'
    );
\rx_pe_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_0_in(0),
      Q => rx_pe_data_r(11),
      R => '0'
    );
\rx_pe_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_0_in(3),
      Q => rx_pe_data_r(8),
      R => '0'
    );
\rx_pe_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_0_in(2),
      Q => rx_pe_data_r(9),
      R => '0'
    );
rx_scp_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \^rx_snf_d_r_reg[0]_0\(1),
      I1 => \^rx_snf_d_r_reg[0]_0\(0),
      I2 => \^rx_snf_d_r_reg[0]_0\(2),
      I3 => \^rx_snf_d_r_reg[0]_0\(3),
      O => rx_scp_d_r0_n_0
    );
\rx_scp_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_ecp_d_r_reg[7]_0\(2),
      I1 => \^rx_ecp_d_r_reg[7]_0\(3),
      I2 => \^rx_ecp_d_r_reg[7]_0\(1),
      I3 => \^rx_ecp_d_r_reg[7]_0\(0),
      O => \rx_scp_d_r0_inferred__0/i__n_0\
    );
\rx_scp_d_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[26]\,
      I1 => \word_aligned_data_r_reg_n_0_[27]\,
      I2 => \word_aligned_data_r_reg_n_0_[25]\,
      I3 => \word_aligned_data_r_reg_n_0_[24]\,
      O => \rx_scp_d_r0_inferred__1/i__n_0\
    );
\rx_scp_d_r0_inferred__2/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(1),
      I1 => \^rx_spa_r_reg[4]_0\(0),
      I2 => \^rx_spa_r_reg[4]_0\(2),
      I3 => \^rx_spa_r_reg[4]_0\(3),
      O => \rx_scp_d_r0_inferred__2/i__n_0\
    );
\rx_scp_d_r0_inferred__3/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(7),
      I1 => \^rx_spa_r_reg[4]_0\(5),
      I2 => \^rx_spa_r_reg[4]_0\(6),
      I3 => \^rx_spa_r_reg[4]_0\(4),
      O => \rx_scp_d_r0_inferred__3/i__n_0\
    );
\rx_scp_d_r0_inferred__4/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_sp_neg_d_r_reg[1]_0\(2),
      I1 => \^rx_sp_neg_d_r_reg[1]_0\(3),
      I2 => \^rx_sp_neg_d_r_reg[1]_0\(1),
      I3 => \^rx_sp_neg_d_r_reg[1]_0\(0),
      O => \rx_scp_d_r0_inferred__4/i__n_0\
    );
\rx_scp_d_r0_inferred__5/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(0),
      I2 => p_0_in(2),
      I3 => p_0_in(3),
      O => \rx_scp_d_r0_inferred__5/i__n_0\
    );
\rx_scp_d_r0_inferred__6/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \^rx_snf_d_r_reg[0]_0\(7),
      I1 => \^rx_snf_d_r_reg[0]_0\(5),
      I2 => \^rx_snf_d_r_reg[0]_0\(6),
      I3 => \^rx_snf_d_r_reg[0]_0\(4),
      O => \rx_scp_d_r0_inferred__6/i__n_0\
    );
\rx_scp_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_scp_d_r0_inferred__6/i__n_0\,
      Q => rx_scp_d_r(0),
      R => '0'
    );
\rx_scp_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_scp_d_r0_inferred__4/i__n_0\,
      Q => rx_scp_d_r(3),
      R => '0'
    );
\rx_scp_d_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_scp_d_r0_inferred__3/i__n_0\,
      Q => rx_scp_d_r(4),
      R => '0'
    );
\rx_scp_d_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_scp_d_r0_inferred__0/i__n_0\,
      Q => rx_scp_d_r(7),
      R => '0'
    );
\rx_snf_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_snf_d_r_reg[0]_0\(5),
      I1 => \^rx_snf_d_r_reg[0]_0\(6),
      I2 => \^rx_snf_d_r_reg[0]_0\(7),
      I3 => \^rx_snf_d_r_reg[0]_0\(4),
      O => rx_snf_d_r0
    );
\rx_snf_d_r[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(6),
      I1 => \^rx_spa_r_reg[4]_0\(5),
      I2 => \^rx_spa_r_reg[4]_0\(7),
      I3 => \^rx_spa_r_reg[4]_0\(4),
      O => \rx_snf_d_r[2]_i_1_n_0\
    );
\rx_snf_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_snf_d_r0,
      Q => rx_snf_d_r(0),
      R => '0'
    );
\rx_snf_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_scp_d_r0_n_0,
      Q => rx_snf_d_r(1),
      R => '0'
    );
\rx_snf_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_snf_d_r[2]_i_1_n_0\,
      Q => rx_snf_d_r(2),
      R => '0'
    );
\rx_sp_neg_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_sp_r114_in,
      Q => rx_sp_neg_d_r(0),
      R => '0'
    );
\rx_sp_neg_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_sp_r111_in,
      Q => rx_sp_neg_d_r(1),
      R => '0'
    );
rx_sp_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_snf_d_r_reg[0]_0\(6),
      I1 => \^rx_snf_d_r_reg[0]_0\(7),
      I2 => \^rx_snf_d_r_reg[0]_0\(5),
      I3 => \^rx_snf_d_r_reg[0]_0\(4),
      O => rx_sp_r0_n_0
    );
rx_sp_r1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \^rx_sp_neg_d_r_reg[1]_0\(3),
      I1 => \^rx_sp_neg_d_r_reg[1]_0\(1),
      I2 => \^rx_sp_neg_d_r_reg[1]_0\(2),
      I3 => \^rx_sp_neg_d_r_reg[1]_0\(0),
      O => rx_sp_r111_in
    );
\rx_sp_r1_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(3),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      O => rx_sp_r114_in
    );
\rx_sp_r[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0180"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(1),
      I2 => p_0_in(3),
      I3 => p_0_in(2),
      O => p_8_out(5)
    );
\rx_sp_r[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1008"
    )
        port map (
      I0 => \^rx_sp_neg_d_r_reg[1]_0\(0),
      I1 => \^rx_sp_neg_d_r_reg[1]_0\(2),
      I2 => \^rx_sp_neg_d_r_reg[1]_0\(1),
      I3 => \^rx_sp_neg_d_r_reg[1]_0\(3),
      O => p_8_out(4)
    );
\rx_sp_r[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(5),
      I1 => \^rx_spa_r_reg[4]_0\(4),
      I2 => \^rx_spa_r_reg[4]_0\(6),
      I3 => \^rx_spa_r_reg[4]_0\(7),
      O => p_8_out(3)
    );
\rx_sp_r[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1008"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(2),
      I1 => \^rx_spa_r_reg[4]_0\(0),
      I2 => \^rx_spa_r_reg[4]_0\(1),
      I3 => \^rx_spa_r_reg[4]_0\(3),
      O => p_8_out(2)
    );
\rx_sp_r[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0810"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[26]\,
      I1 => \word_aligned_data_r_reg_n_0_[27]\,
      I2 => \word_aligned_data_r_reg_n_0_[25]\,
      I3 => \word_aligned_data_r_reg_n_0_[24]\,
      O => p_8_out(1)
    );
\rx_sp_r[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1008"
    )
        port map (
      I0 => \^rx_ecp_d_r_reg[7]_0\(2),
      I1 => \^rx_ecp_d_r_reg[7]_0\(0),
      I2 => \^rx_ecp_d_r_reg[7]_0\(1),
      I3 => \^rx_ecp_d_r_reg[7]_0\(3),
      O => p_8_out(0)
    );
\rx_sp_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_sp_r0_n_0,
      Q => rx_sp_r(0),
      R => '0'
    );
\rx_sp_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_8_out(5),
      Q => rx_sp_r(2),
      R => '0'
    );
\rx_sp_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_8_out(4),
      Q => rx_sp_r(3),
      R => '0'
    );
\rx_sp_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_8_out(3),
      Q => rx_sp_r(4),
      R => '0'
    );
\rx_sp_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_8_out(2),
      Q => rx_sp_r(5),
      R => '0'
    );
\rx_sp_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_8_out(1),
      Q => rx_sp_r(6),
      R => '0'
    );
\rx_sp_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => p_8_out(0),
      Q => rx_sp_r(7),
      R => '0'
    );
rx_spa_neg_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \^rx_sp_neg_d_r_reg[1]_0\(2),
      I1 => \^rx_sp_neg_d_r_reg[1]_0\(3),
      I2 => \^rx_sp_neg_d_r_reg[1]_0\(1),
      I3 => \^rx_sp_neg_d_r_reg[1]_0\(0),
      O => rx_spa_neg_d_r0_n_0
    );
\rx_spa_neg_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => p_0_in(1),
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => p_0_in(0),
      O => \rx_spa_neg_d_r0__0\
    );
\rx_spa_neg_d_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_spa_neg_d_r0__0\,
      Q => rx_spa_neg_d_r(0),
      R => '0'
    );
\rx_spa_neg_d_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_spa_neg_d_r0_n_0,
      Q => rx_spa_neg_d_r(1),
      R => '0'
    );
rx_spa_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[25]\,
      I1 => \word_aligned_data_r_reg_n_0_[24]\,
      I2 => \word_aligned_data_r_reg_n_0_[26]\,
      I3 => \word_aligned_data_r_reg_n_0_[27]\,
      O => rx_spa_r0_n_0
    );
\rx_spa_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(6),
      I1 => \^rx_spa_r_reg[4]_0\(7),
      I2 => \^rx_spa_r_reg[4]_0\(5),
      I3 => \^rx_spa_r_reg[4]_0\(4),
      O => \rx_spa_r0_inferred__0/i__n_0\
    );
\rx_spa_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => p_0_in(2),
      I1 => p_0_in(3),
      I2 => p_0_in(1),
      I3 => p_0_in(0),
      O => \rx_spa_r0__0\
    );
\rx_spa_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_spa_r0__0\,
      Q => rx_spa_r(2),
      R => '0'
    );
\rx_spa_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_pad_d_r0_inferred__1/i__n_0\,
      Q => rx_spa_r(3),
      R => '0'
    );
\rx_spa_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_spa_r0_inferred__0/i__n_0\,
      Q => rx_spa_r(4),
      R => '0'
    );
\rx_spa_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_scp_d_r0_inferred__2/i__n_0\,
      Q => rx_spa_r(5),
      R => '0'
    );
\rx_spa_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_spa_r0_n_0,
      Q => rx_spa_r(6),
      R => '0'
    );
\rx_spa_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_pad_d_r0_n_0,
      Q => rx_spa_r(7),
      R => '0'
    );
rx_v_d_r0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \^rx_ecp_d_r_reg[7]_0\(2),
      I1 => \^rx_ecp_d_r_reg[7]_0\(1),
      I2 => \^rx_ecp_d_r_reg[7]_0\(3),
      I3 => \^rx_ecp_d_r_reg[7]_0\(0),
      O => rx_v_d_r0_n_0
    );
\rx_v_d_r0_inferred__0/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \word_aligned_data_r_reg_n_0_[27]\,
      I1 => \word_aligned_data_r_reg_n_0_[25]\,
      I2 => \word_aligned_data_r_reg_n_0_[24]\,
      I3 => \word_aligned_data_r_reg_n_0_[26]\,
      O => \rx_v_d_r0_inferred__0/i__n_0\
    );
\rx_v_d_r0_inferred__1/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(2),
      I1 => \^rx_spa_r_reg[4]_0\(1),
      I2 => \^rx_spa_r_reg[4]_0\(3),
      I3 => \^rx_spa_r_reg[4]_0\(0),
      O => \rx_v_d_r0_inferred__1/i__n_0\
    );
\rx_v_d_r0_inferred__2/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^rx_spa_r_reg[4]_0\(4),
      I1 => \^rx_spa_r_reg[4]_0\(6),
      I2 => \^rx_spa_r_reg[4]_0\(7),
      I3 => \^rx_spa_r_reg[4]_0\(5),
      O => \rx_v_d_r0_inferred__2/i__n_0\
    );
\rx_v_d_r0_inferred__3/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \^rx_sp_neg_d_r_reg[1]_0\(2),
      I1 => \^rx_sp_neg_d_r_reg[1]_0\(1),
      I2 => \^rx_sp_neg_d_r_reg[1]_0\(3),
      I3 => \^rx_sp_neg_d_r_reg[1]_0\(0),
      O => \rx_v_d_r0_inferred__3/i__n_0\
    );
\rx_v_d_r0_inferred__4/i_\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => p_0_in(0),
      I1 => p_0_in(2),
      I2 => p_0_in(3),
      I3 => p_0_in(1),
      O => \rx_v_d_r0__0\
    );
\rx_v_d_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_v_d_r0__0\,
      Q => rx_v_d_r(2),
      R => '0'
    );
\rx_v_d_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_v_d_r0_inferred__3/i__n_0\,
      Q => rx_v_d_r(3),
      R => '0'
    );
\rx_v_d_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_v_d_r0_inferred__2/i__n_0\,
      Q => rx_v_d_r(4),
      R => '0'
    );
\rx_v_d_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_v_d_r0_inferred__1/i__n_0\,
      Q => rx_v_d_r(5),
      R => '0'
    );
\rx_v_d_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \rx_v_d_r0_inferred__0/i__n_0\,
      Q => rx_v_d_r(6),
      R => '0'
    );
\rx_v_d_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_v_d_r0_n_0,
      Q => rx_v_d_r(7),
      R => '0'
    );
stage_1_load_nfc_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^m_axi_nfc_rx_tvalid\(1),
      I1 => \^m_axi_nfc_rx_tvalid\(0),
      O => stage_1_load_nfc_r_reg
    );
stage_1_pad_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => rx_pad_striped_i(1),
      I1 => rx_pad_striped_i(0),
      O => stage_1_pad_r_reg
    );
\word_aligned_control_bits_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => rxctrl0_out(0),
      I1 => previous_cycle_control_r(2),
      I2 => previous_cycle_control_r(1),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^word_aligned_control_bits_r_reg[1]_0\(0),
      O => \word_aligned_control_bits_r[0]_i_1_n_0\
    );
\word_aligned_control_bits_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => previous_cycle_control_r(1),
      I1 => \^word_aligned_control_bits_r_reg[1]_0\(0),
      I2 => rxctrl0_out(1),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => rxctrl0_out(0),
      O => \word_aligned_control_bits_r[1]_i_1_n_0\
    );
\word_aligned_control_bits_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_control_bits_r[0]_i_1_n_0\,
      Q => word_aligned_control_bits_r(0),
      R => '0'
    );
\word_aligned_control_bits_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_control_bits_r[1]_i_1_n_0\,
      Q => word_aligned_control_bits_r(1),
      R => '0'
    );
\word_aligned_control_bits_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \previous_cycle_control_r_reg[0]_0\,
      Q => word_aligned_control_bits_r(2),
      R => '0'
    );
\word_aligned_control_bits_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \left_align_select_r_reg[1]_0\,
      Q => word_aligned_control_bits_r_reg,
      R => '0'
    );
\word_aligned_data_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => gtwiz_userdata_rx_out(7),
      I1 => \previous_cycle_data_r_reg_n_0_[23]\,
      I2 => p_2_in(7),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \previous_cycle_data_r_reg_n_0_[7]\,
      O => \word_aligned_data_r[0]_i_1_n_0\
    );
\word_aligned_data_r[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => p_2_in(5),
      I1 => gtwiz_userdata_rx_out(5),
      I2 => gtwiz_userdata_rx_out(13),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \previous_cycle_data_r_reg_n_0_[5]\,
      O => \word_aligned_data_r[10]_i_1_n_0\
    );
\word_aligned_data_r[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => p_2_in(4),
      I1 => \previous_cycle_data_r_reg_n_0_[4]\,
      I2 => gtwiz_userdata_rx_out(12),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => gtwiz_userdata_rx_out(4),
      O => \word_aligned_data_r[11]_i_1_n_0\
    );
\word_aligned_data_r[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => gtwiz_userdata_rx_out(11),
      I1 => p_2_in(3),
      I2 => \^word_aligned_data_r_reg[9]_0\(2),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => gtwiz_userdata_rx_out(3),
      O => \word_aligned_data_r[12]_i_1_n_0\
    );
\word_aligned_data_r[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => gtwiz_userdata_rx_out(10),
      I1 => p_2_in(2),
      I2 => gtwiz_userdata_rx_out(2),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \^word_aligned_data_r_reg[9]_0\(1),
      O => \word_aligned_data_r[13]_i_1_n_0\
    );
\word_aligned_data_r[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => gtwiz_userdata_rx_out(9),
      I1 => p_2_in(1),
      I2 => \^word_aligned_data_r_reg[9]_0\(0),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => gtwiz_userdata_rx_out(1),
      O => \word_aligned_data_r[14]_i_1_n_0\
    );
\word_aligned_data_r[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => p_2_in(0),
      I1 => gtwiz_userdata_rx_out(0),
      I2 => gtwiz_userdata_rx_out(8),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \previous_cycle_data_r_reg_n_0_[0]\,
      O => \word_aligned_data_r[15]_i_1_n_0\
    );
\word_aligned_data_r[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => \previous_cycle_data_r_reg_n_0_[7]\,
      I1 => gtwiz_userdata_rx_out(7),
      I2 => gtwiz_userdata_rx_out(23),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => gtwiz_userdata_rx_out(15),
      O => \word_aligned_data_r[16]_i_1_n_0\
    );
\word_aligned_data_r[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => \previous_cycle_data_r_reg_n_0_[5]\,
      I1 => gtwiz_userdata_rx_out(5),
      I2 => gtwiz_userdata_rx_out(21),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => gtwiz_userdata_rx_out(13),
      O => \word_aligned_data_r[18]_i_1_n_0\
    );
\word_aligned_data_r[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \previous_cycle_data_r_reg_n_0_[4]\,
      I1 => gtwiz_userdata_rx_out(12),
      I2 => gtwiz_userdata_rx_out(20),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => gtwiz_userdata_rx_out(4),
      O => \word_aligned_data_r[19]_i_1_n_0\
    );
\word_aligned_data_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \previous_cycle_data_r_reg_n_0_[22]\,
      I1 => \^word_aligned_data_r_reg[9]_0\(3),
      I2 => gtwiz_userdata_rx_out(6),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => p_2_in(6),
      O => \word_aligned_data_r[1]_i_1_n_0\
    );
\word_aligned_data_r[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \previous_cycle_data_r_reg_n_0_[0]\,
      I1 => gtwiz_userdata_rx_out(8),
      I2 => gtwiz_userdata_rx_out(16),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => gtwiz_userdata_rx_out(0),
      O => \word_aligned_data_r[23]_i_1_n_0\
    );
\word_aligned_data_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => gtwiz_userdata_rx_out(5),
      I1 => \previous_cycle_data_r_reg_n_0_[21]\,
      I2 => \previous_cycle_data_r_reg_n_0_[5]\,
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => p_2_in(5),
      O => \word_aligned_data_r[2]_i_1_n_0\
    );
\word_aligned_data_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \previous_cycle_data_r_reg_n_0_[20]\,
      I1 => \previous_cycle_data_r_reg_n_0_[4]\,
      I2 => gtwiz_userdata_rx_out(4),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => p_2_in(4),
      O => \word_aligned_data_r[3]_i_1_n_0\
    );
\word_aligned_data_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => gtwiz_userdata_rx_out(3),
      I1 => \previous_cycle_data_r_reg_n_0_[19]\,
      I2 => \^word_aligned_data_r_reg[9]_0\(2),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => p_2_in(3),
      O => \word_aligned_data_r[4]_i_1_n_0\
    );
\word_aligned_data_r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => gtwiz_userdata_rx_out(2),
      I1 => \previous_cycle_data_r_reg_n_0_[18]\,
      I2 => \^word_aligned_data_r_reg[9]_0\(1),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => p_2_in(2),
      O => \word_aligned_data_r[5]_i_1_n_0\
    );
\word_aligned_data_r[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => gtwiz_userdata_rx_out(1),
      I1 => \previous_cycle_data_r_reg_n_0_[17]\,
      I2 => p_2_in(1),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^word_aligned_data_r_reg[9]_0\(0),
      O => \word_aligned_data_r[6]_i_1_n_0\
    );
\word_aligned_data_r[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => \previous_cycle_data_r_reg_n_0_[16]\,
      I1 => p_2_in(0),
      I2 => gtwiz_userdata_rx_out(0),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \previous_cycle_data_r_reg_n_0_[0]\,
      O => \word_aligned_data_r[7]_i_1_n_0\
    );
\word_aligned_data_r[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => p_2_in(7),
      I1 => \previous_cycle_data_r_reg_n_0_[7]\,
      I2 => gtwiz_userdata_rx_out(15),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => gtwiz_userdata_rx_out(7),
      O => \word_aligned_data_r[8]_i_1_n_0\
    );
\word_aligned_data_r[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => gtwiz_userdata_rx_out(14),
      I1 => p_2_in(6),
      I2 => gtwiz_userdata_rx_out(6),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \^word_aligned_data_r_reg[9]_0\(3),
      O => \word_aligned_data_r[9]_i_1_n_0\
    );
\word_aligned_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[0]_i_1_n_0\,
      Q => \^rx_snf_d_r_reg[0]_0\(7),
      R => '0'
    );
\word_aligned_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[10]_i_1_n_0\,
      Q => p_0_in(1),
      R => '0'
    );
\word_aligned_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[11]_i_1_n_0\,
      Q => p_0_in(0),
      R => '0'
    );
\word_aligned_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[12]_i_1_n_0\,
      Q => \^rx_sp_neg_d_r_reg[1]_0\(3),
      R => '0'
    );
\word_aligned_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[13]_i_1_n_0\,
      Q => \^rx_sp_neg_d_r_reg[1]_0\(2),
      R => '0'
    );
\word_aligned_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[14]_i_1_n_0\,
      Q => \^rx_sp_neg_d_r_reg[1]_0\(1),
      R => '0'
    );
\word_aligned_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[15]_i_1_n_0\,
      Q => \^rx_sp_neg_d_r_reg[1]_0\(0),
      R => '0'
    );
\word_aligned_data_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[16]_i_1_n_0\,
      Q => \^rx_spa_r_reg[4]_0\(7),
      R => '0'
    );
\word_aligned_data_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \previous_cycle_data_r_reg[6]_0\(3),
      Q => \^rx_spa_r_reg[4]_0\(6),
      R => '0'
    );
\word_aligned_data_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[18]_i_1_n_0\,
      Q => \^rx_spa_r_reg[4]_0\(5),
      R => '0'
    );
\word_aligned_data_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[19]_i_1_n_0\,
      Q => \^rx_spa_r_reg[4]_0\(4),
      R => '0'
    );
\word_aligned_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[1]_i_1_n_0\,
      Q => \^rx_snf_d_r_reg[0]_0\(6),
      R => '0'
    );
\word_aligned_data_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \previous_cycle_data_r_reg[6]_0\(2),
      Q => \^rx_spa_r_reg[4]_0\(3),
      R => '0'
    );
\word_aligned_data_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \previous_cycle_data_r_reg[6]_0\(1),
      Q => \^rx_spa_r_reg[4]_0\(2),
      R => '0'
    );
\word_aligned_data_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \previous_cycle_data_r_reg[6]_0\(0),
      Q => \^rx_spa_r_reg[4]_0\(1),
      R => '0'
    );
\word_aligned_data_r_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[23]_i_1_n_0\,
      Q => \^rx_spa_r_reg[4]_0\(0),
      R => '0'
    );
\word_aligned_data_r_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \left_align_select_r_reg[1]_1\(7),
      Q => \word_aligned_data_r_reg_n_0_[24]\,
      R => '0'
    );
\word_aligned_data_r_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \left_align_select_r_reg[1]_1\(6),
      Q => \word_aligned_data_r_reg_n_0_[25]\,
      R => '0'
    );
\word_aligned_data_r_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \left_align_select_r_reg[1]_1\(5),
      Q => \word_aligned_data_r_reg_n_0_[26]\,
      R => '0'
    );
\word_aligned_data_r_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \left_align_select_r_reg[1]_1\(4),
      Q => \word_aligned_data_r_reg_n_0_[27]\,
      R => '0'
    );
\word_aligned_data_r_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \left_align_select_r_reg[1]_1\(3),
      Q => \^rx_ecp_d_r_reg[7]_0\(3),
      R => '0'
    );
\word_aligned_data_r_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \left_align_select_r_reg[1]_1\(2),
      Q => \^rx_ecp_d_r_reg[7]_0\(2),
      R => '0'
    );
\word_aligned_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[2]_i_1_n_0\,
      Q => \^rx_snf_d_r_reg[0]_0\(5),
      R => '0'
    );
\word_aligned_data_r_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \left_align_select_r_reg[1]_1\(1),
      Q => \^rx_ecp_d_r_reg[7]_0\(1),
      R => '0'
    );
\word_aligned_data_r_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \left_align_select_r_reg[1]_1\(0),
      Q => \^rx_ecp_d_r_reg[7]_0\(0),
      R => '0'
    );
\word_aligned_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[3]_i_1_n_0\,
      Q => \^rx_snf_d_r_reg[0]_0\(4),
      R => '0'
    );
\word_aligned_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[4]_i_1_n_0\,
      Q => \^rx_snf_d_r_reg[0]_0\(3),
      R => '0'
    );
\word_aligned_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[5]_i_1_n_0\,
      Q => \^rx_snf_d_r_reg[0]_0\(2),
      R => '0'
    );
\word_aligned_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[6]_i_1_n_0\,
      Q => \^rx_snf_d_r_reg[0]_0\(1),
      R => '0'
    );
\word_aligned_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[7]_i_1_n_0\,
      Q => \^rx_snf_d_r_reg[0]_0\(0),
      R => '0'
    );
\word_aligned_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[8]_i_1_n_0\,
      Q => p_0_in(3),
      R => '0'
    );
\word_aligned_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \word_aligned_data_r[9]_i_1_n_0\,
      Q => p_0_in(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SYM_GEN_4BYTE is
  port (
    gen_spa_r : out STD_LOGIC;
    txctrl2_in : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gtwiz_userdata_tx_in : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gen_spa_i : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    GEN_SP : in STD_LOGIC;
    gen_cc_i : in STD_LOGIC;
    gen_snf_striped_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gen_ecp_i : in STD_LOGIC;
    gen_scp_striped_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gen_a_i : in STD_LOGIC;
    gen_v_flop_1_i : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \GEN_PAD_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \TX_PE_DATA_V_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_r_flop_0_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gen_k_flop_0_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \TX_PE_DATA_reg[0]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \FC_NB_reg[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SYM_GEN_4BYTE : entity is "dnpcie_aurora_2_sim_SYM_GEN_4BYTE";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SYM_GEN_4BYTE;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SYM_GEN_4BYTE is
  signal \TX_CHAR_IS_K[2]_i_2_n_0\ : STD_LOGIC;
  signal \TX_CHAR_IS_K[3]_i_1_n_0\ : STD_LOGIC;
  signal TX_CHAR_IS_K_reg0 : STD_LOGIC;
  signal TX_CHAR_IS_K_reg03_out : STD_LOGIC;
  signal TX_CHAR_IS_K_reg08_out : STD_LOGIC;
  signal \TX_DATA[0]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[0]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[10]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[10]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[10]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[11]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[12]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[12]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[13]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[13]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[14]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[14]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[14]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[15]_i_5_n_0\ : STD_LOGIC;
  signal \TX_DATA[16]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[17]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[18]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[18]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[18]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[19]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[1]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[20]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[20]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[21]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[21]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[22]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[22]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[23]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[23]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[23]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[23]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[24]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[25]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[26]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[27]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[28]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[29]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[29]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[2]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[2]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[30]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[30]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[31]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[31]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[31]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[31]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[3]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[4]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[4]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[5]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[5]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[6]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[6]_i_2_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_3_n_0\ : STD_LOGIC;
  signal \TX_DATA[7]_i_4_n_0\ : STD_LOGIC;
  signal \TX_DATA[8]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[9]_i_1_n_0\ : STD_LOGIC;
  signal \TX_DATA[9]_i_2_n_0\ : STD_LOGIC;
  signal TX_DATA_reg0 : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal data1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal fc_nb_r : STD_LOGIC_VECTOR ( 0 to 3 );
  signal gen_a_r : STD_LOGIC;
  signal gen_cc_r : STD_LOGIC;
  signal \gen_ecp_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \gen_k_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \gen_pad_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \gen_r_r_reg_n_0_[3]\ : STD_LOGIC;
  signal gen_sp_r : STD_LOGIC;
  signal \^gen_spa_r\ : STD_LOGIC;
  signal \gen_v_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \^gtwiz_userdata_tx_in\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal p_0_in12_in : STD_LOGIC;
  signal p_0_in14_in : STD_LOGIC;
  signal p_0_in16_in : STD_LOGIC;
  signal p_0_in4_in : STD_LOGIC;
  signal p_0_in5_in : STD_LOGIC;
  signal p_0_in6_in : STD_LOGIC;
  signal p_0_in8_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_1_in11_in : STD_LOGIC;
  signal p_1_in16_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[24]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[25]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[26]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[27]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[28]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[29]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[30]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[31]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \tx_pe_data_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \tx_pe_data_v_r_reg_n_0_[1]\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \TX_CHAR_IS_K[1]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \TX_CHAR_IS_K[2]_i_2\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \TX_DATA[10]_i_2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \TX_DATA[10]_i_3\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \TX_DATA[11]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \TX_DATA[12]_i_2\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \TX_DATA[13]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \TX_DATA[14]_i_2\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \TX_DATA[14]_i_3\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \TX_DATA[15]_i_3\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \TX_DATA[15]_i_4\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \TX_DATA[1]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \TX_DATA[24]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \TX_DATA[25]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \TX_DATA[26]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \TX_DATA[28]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \TX_DATA[29]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \TX_DATA[9]_i_2\ : label is "soft_lutpair37";
begin
  gen_spa_r <= \^gen_spa_r\;
  gtwiz_userdata_tx_in(31 downto 0) <= \^gtwiz_userdata_tx_in\(31 downto 0);
\TX_CHAR_IS_K[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000000B"
    )
        port map (
      I0 => \gen_pad_r_reg_n_0_[1]\,
      I1 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I2 => \gen_v_r_reg_n_0_[3]\,
      I3 => \^gen_spa_r\,
      I4 => gen_sp_r,
      I5 => gen_cc_r,
      O => TX_CHAR_IS_K_reg0
    );
\TX_CHAR_IS_K[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0001"
    )
        port map (
      I0 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I1 => p_1_in,
      I2 => \^gen_spa_r\,
      I3 => gen_sp_r,
      I4 => gen_cc_r,
      O => TX_CHAR_IS_K_reg03_out
    );
\TX_CHAR_IS_K[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF45FF00BA00"
    )
        port map (
      I0 => p_0_in5_in,
      I1 => p_0_in12_in,
      I2 => p_1_in11_in,
      I3 => gen_cc_r,
      I4 => p_2_in,
      I5 => \TX_CHAR_IS_K[2]_i_2_n_0\,
      O => TX_CHAR_IS_K_reg08_out
    );
\TX_CHAR_IS_K[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F1"
    )
        port map (
      I0 => \^gen_spa_r\,
      I1 => gen_sp_r,
      I2 => gen_cc_r,
      O => \TX_CHAR_IS_K[2]_i_2_n_0\
    );
\TX_CHAR_IS_K[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => gen_cc_r,
      I1 => p_1_in11_in,
      O => \TX_CHAR_IS_K[3]_i_1_n_0\
    );
\TX_CHAR_IS_K_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => TX_CHAR_IS_K_reg0,
      Q => txctrl2_in(3),
      R => '0'
    );
\TX_CHAR_IS_K_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => TX_CHAR_IS_K_reg03_out,
      Q => txctrl2_in(2),
      R => '0'
    );
\TX_CHAR_IS_K_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => TX_CHAR_IS_K_reg08_out,
      Q => txctrl2_in(1),
      R => '0'
    );
\TX_CHAR_IS_K_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => \TX_CHAR_IS_K[3]_i_1_n_0\,
      Q => txctrl2_in(0),
      R => '0'
    );
\TX_DATA[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \TX_DATA[0]_i_2_n_0\,
      I1 => TX_DATA_reg0,
      I2 => \^gtwiz_userdata_tx_in\(24),
      O => \TX_DATA[0]_i_1_n_0\
    );
\TX_DATA[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000044E4"
    )
        port map (
      I0 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I1 => gen_cc_r,
      I2 => \tx_pe_data_r_reg_n_0_[31]\,
      I3 => \gen_pad_r_reg_n_0_[1]\,
      I4 => \gen_ecp_r_reg_n_0_[1]\,
      O => \TX_DATA[0]_i_2_n_0\
    );
\TX_DATA[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB88BB8BBB88B888"
    )
        port map (
      I0 => data0(2),
      I1 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I2 => p_0_in4_in,
      I3 => \TX_DATA[10]_i_2_n_0\,
      I4 => p_0_in,
      I5 => \TX_DATA[10]_i_3_n_0\,
      O => \TX_DATA[10]_i_1_n_0\
    );
\TX_DATA[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F0FB"
    )
        port map (
      I0 => \^gen_spa_r\,
      I1 => p_1_in,
      I2 => gen_cc_r,
      I3 => gen_sp_r,
      O => \TX_DATA[10]_i_2_n_0\
    );
\TX_DATA[10]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => gen_sp_r,
      I1 => \^gen_spa_r\,
      I2 => gen_cc_r,
      O => \TX_DATA[10]_i_3_n_0\
    );
\TX_DATA[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => data0(3),
      I1 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I2 => gen_cc_r,
      O => \TX_DATA[11]_i_1_n_0\
    );
\TX_DATA[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB88BB8BBB88B888"
    )
        port map (
      I0 => data0(4),
      I1 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I2 => p_0_in4_in,
      I3 => \TX_DATA[12]_i_2_n_0\,
      I4 => p_0_in,
      I5 => gen_cc_r,
      O => \TX_DATA[12]_i_1_n_0\
    );
\TX_DATA[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF01"
    )
        port map (
      I0 => p_1_in,
      I1 => \^gen_spa_r\,
      I2 => gen_sp_r,
      I3 => gen_cc_r,
      O => \TX_DATA[12]_i_2_n_0\
    );
\TX_DATA[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data0(5),
      I1 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I2 => \TX_DATA[13]_i_2_n_0\,
      O => \TX_DATA[13]_i_1_n_0\
    );
\TX_DATA[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFFFEFF"
    )
        port map (
      I0 => p_0_in4_in,
      I1 => p_1_in,
      I2 => \^gen_spa_r\,
      I3 => p_0_in,
      I4 => gen_cc_r,
      I5 => gen_sp_r,
      O => \TX_DATA[13]_i_2_n_0\
    );
\TX_DATA[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB88BB8BBB88B888"
    )
        port map (
      I0 => data0(6),
      I1 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I2 => p_0_in4_in,
      I3 => \TX_DATA[14]_i_2_n_0\,
      I4 => p_0_in,
      I5 => \TX_DATA[14]_i_3_n_0\,
      O => \TX_DATA[14]_i_1_n_0\
    );
\TX_DATA[14]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF4"
    )
        port map (
      I0 => \^gen_spa_r\,
      I1 => p_1_in,
      I2 => gen_sp_r,
      I3 => gen_cc_r,
      O => \TX_DATA[14]_i_2_n_0\
    );
\TX_DATA[14]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \^gen_spa_r\,
      I1 => gen_sp_r,
      I2 => gen_cc_r,
      O => \TX_DATA[14]_i_3_n_0\
    );
\TX_DATA[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \gen_ecp_r_reg_n_0_[1]\,
      I1 => \TX_DATA[15]_i_2_n_0\,
      O => \TX_DATA[15]_i_1_n_0\
    );
\TX_DATA[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I1 => p_0_in,
      I2 => \TX_DATA[15]_i_4_n_0\,
      I3 => p_1_in,
      I4 => p_0_in4_in,
      I5 => \gen_ecp_r_reg_n_0_[1]\,
      O => \TX_DATA[15]_i_2_n_0\
    );
\TX_DATA[15]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data0(7),
      I1 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I2 => \TX_DATA[15]_i_5_n_0\,
      O => \TX_DATA[15]_i_3_n_0\
    );
\TX_DATA[15]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => gen_sp_r,
      I1 => \^gen_spa_r\,
      I2 => gen_cc_r,
      O => \TX_DATA[15]_i_4_n_0\
    );
\TX_DATA[15]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000000EF"
    )
        port map (
      I0 => p_0_in4_in,
      I1 => p_1_in,
      I2 => p_0_in,
      I3 => \^gen_spa_r\,
      I4 => gen_sp_r,
      I5 => gen_cc_r,
      O => \TX_DATA[15]_i_5_n_0\
    );
\TX_DATA[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000044E4"
    )
        port map (
      I0 => p_1_in11_in,
      I1 => gen_cc_r,
      I2 => data1(0),
      I3 => p_0_in12_in,
      I4 => p_0_in5_in,
      O => \TX_DATA[16]_i_1_n_0\
    );
\TX_DATA[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000EFE0E0E"
    )
        port map (
      I0 => gen_cc_r,
      I1 => gen_sp_r,
      I2 => p_1_in11_in,
      I3 => p_0_in12_in,
      I4 => data1(1),
      I5 => p_0_in5_in,
      O => \TX_DATA[17]_i_1_n_0\
    );
\TX_DATA[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0001FFFE0000"
    )
        port map (
      I0 => p_0_in5_in,
      I1 => \TX_DATA[23]_i_3_n_0\,
      I2 => p_1_in11_in,
      I3 => p_1_in16_in,
      I4 => \TX_DATA[18]_i_2_n_0\,
      I5 => \^gtwiz_userdata_tx_in\(10),
      O => \TX_DATA[18]_i_1_n_0\
    );
\TX_DATA[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000054555400"
    )
        port map (
      I0 => p_0_in5_in,
      I1 => data1(2),
      I2 => p_0_in12_in,
      I3 => p_1_in11_in,
      I4 => \TX_DATA[18]_i_3_n_0\,
      I5 => p_1_in16_in,
      O => \TX_DATA[18]_i_2_n_0\
    );
\TX_DATA[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00FF0032"
    )
        port map (
      I0 => p_0_in8_in,
      I1 => p_2_in,
      I2 => p_0_in6_in,
      I3 => gen_sp_r,
      I4 => \^gen_spa_r\,
      I5 => gen_cc_r,
      O => \TX_DATA[18]_i_3_n_0\
    );
\TX_DATA[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000DDD1"
    )
        port map (
      I0 => gen_cc_r,
      I1 => p_1_in11_in,
      I2 => p_0_in12_in,
      I3 => data1(3),
      I4 => p_0_in5_in,
      O => \TX_DATA[19]_i_1_n_0\
    );
\TX_DATA[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2F2F2F20"
    )
        port map (
      I0 => \tx_pe_data_r_reg_n_0_[30]\,
      I1 => \gen_pad_r_reg_n_0_[1]\,
      I2 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I3 => gen_sp_r,
      I4 => gen_cc_r,
      O => \TX_DATA[1]_i_1_n_0\
    );
\TX_DATA[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB8BBBBBBB88888"
    )
        port map (
      I0 => fc_nb_r(3),
      I1 => p_0_in5_in,
      I2 => data1(4),
      I3 => p_0_in12_in,
      I4 => p_1_in11_in,
      I5 => \TX_DATA[20]_i_2_n_0\,
      O => \TX_DATA[20]_i_1_n_0\
    );
\TX_DATA[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00030002"
    )
        port map (
      I0 => p_0_in8_in,
      I1 => p_2_in,
      I2 => \^gen_spa_r\,
      I3 => gen_sp_r,
      I4 => p_0_in6_in,
      I5 => gen_cc_r,
      O => \TX_DATA[20]_i_2_n_0\
    );
\TX_DATA[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8BBBB88B88888"
    )
        port map (
      I0 => fc_nb_r(2),
      I1 => p_0_in5_in,
      I2 => data1(5),
      I3 => p_0_in12_in,
      I4 => p_1_in11_in,
      I5 => \TX_DATA[21]_i_2_n_0\,
      O => \TX_DATA[21]_i_1_n_0\
    );
\TX_DATA[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFFFEFF"
    )
        port map (
      I0 => p_0_in8_in,
      I1 => p_2_in,
      I2 => \^gen_spa_r\,
      I3 => p_0_in6_in,
      I4 => gen_cc_r,
      I5 => gen_sp_r,
      O => \TX_DATA[21]_i_2_n_0\
    );
\TX_DATA[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8BBBB88B88888"
    )
        port map (
      I0 => fc_nb_r(1),
      I1 => p_0_in5_in,
      I2 => data1(6),
      I3 => p_0_in12_in,
      I4 => p_1_in11_in,
      I5 => \TX_DATA[22]_i_2_n_0\,
      O => \TX_DATA[22]_i_1_n_0\
    );
\TX_DATA[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF00CD"
    )
        port map (
      I0 => p_0_in8_in,
      I1 => p_2_in,
      I2 => p_0_in6_in,
      I3 => \^gen_spa_r\,
      I4 => gen_sp_r,
      I5 => gen_cc_r,
      O => \TX_DATA[22]_i_2_n_0\
    );
\TX_DATA[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_0_in5_in,
      I1 => \TX_DATA[23]_i_3_n_0\,
      I2 => p_1_in11_in,
      I3 => p_1_in16_in,
      O => \TX_DATA[23]_i_1_n_0\
    );
\TX_DATA[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB8BBBBBBB88888"
    )
        port map (
      I0 => fc_nb_r(0),
      I1 => p_0_in5_in,
      I2 => data1(7),
      I3 => p_0_in12_in,
      I4 => p_1_in11_in,
      I5 => \TX_DATA[23]_i_4_n_0\,
      O => \TX_DATA[23]_i_2_n_0\
    );
\TX_DATA[23]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => gen_cc_r,
      I2 => \^gen_spa_r\,
      I3 => gen_sp_r,
      I4 => p_2_in,
      I5 => p_0_in8_in,
      O => \TX_DATA[23]_i_3_n_0\
    );
\TX_DATA[23]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000000EF"
    )
        port map (
      I0 => p_0_in8_in,
      I1 => p_2_in,
      I2 => p_0_in6_in,
      I3 => \^gen_spa_r\,
      I4 => gen_sp_r,
      I5 => gen_cc_r,
      O => \TX_DATA[23]_i_4_n_0\
    );
\TX_DATA[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => gen_cc_r,
      I1 => p_1_in11_in,
      I2 => \tx_pe_data_r_reg_n_0_[7]\,
      I3 => p_0_in5_in,
      O => \TX_DATA[24]_i_1_n_0\
    );
\TX_DATA[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => gen_cc_r,
      I1 => p_1_in11_in,
      I2 => \tx_pe_data_r_reg_n_0_[6]\,
      I3 => p_0_in5_in,
      O => \TX_DATA[25]_i_1_n_0\
    );
\TX_DATA[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE2"
    )
        port map (
      I0 => \TX_DATA[31]_i_3_n_0\,
      I1 => p_1_in11_in,
      I2 => \tx_pe_data_r_reg_n_0_[5]\,
      I3 => p_0_in5_in,
      O => \TX_DATA[26]_i_1_n_0\
    );
\TX_DATA[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFD1"
    )
        port map (
      I0 => gen_cc_r,
      I1 => p_1_in11_in,
      I2 => \tx_pe_data_r_reg_n_0_[4]\,
      I3 => p_0_in5_in,
      O => \TX_DATA[27]_i_1_n_0\
    );
\TX_DATA[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE2"
    )
        port map (
      I0 => \TX_DATA[31]_i_3_n_0\,
      I1 => p_1_in11_in,
      I2 => \tx_pe_data_r_reg_n_0_[3]\,
      I3 => p_0_in5_in,
      O => \TX_DATA[28]_i_1_n_0\
    );
\TX_DATA[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FD0D"
    )
        port map (
      I0 => p_0_in14_in,
      I1 => \TX_DATA[29]_i_2_n_0\,
      I2 => p_1_in11_in,
      I3 => \tx_pe_data_r_reg_n_0_[2]\,
      I4 => p_0_in5_in,
      O => \TX_DATA[29]_i_1_n_0\
    );
\TX_DATA[29]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => gen_a_r,
      I1 => gen_sp_r,
      I2 => \^gen_spa_r\,
      I3 => gen_cc_r,
      I4 => p_0_in16_in,
      O => \TX_DATA[29]_i_2_n_0\
    );
\TX_DATA[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFE0"
    )
        port map (
      I0 => \tx_pe_data_r_reg_n_0_[29]\,
      I1 => \gen_pad_r_reg_n_0_[1]\,
      I2 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I3 => \TX_DATA[2]_i_2_n_0\,
      O => \TX_DATA[2]_i_1_n_0\
    );
\TX_DATA[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00FF0032"
    )
        port map (
      I0 => \gen_k_r_reg_n_0_[3]\,
      I1 => \gen_v_r_reg_n_0_[3]\,
      I2 => \gen_r_r_reg_n_0_[3]\,
      I3 => gen_sp_r,
      I4 => \^gen_spa_r\,
      I5 => gen_cc_r,
      O => \TX_DATA[2]_i_2_n_0\
    );
\TX_DATA[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE2"
    )
        port map (
      I0 => \TX_DATA[30]_i_2_n_0\,
      I1 => p_1_in11_in,
      I2 => \tx_pe_data_r_reg_n_0_[1]\,
      I3 => p_0_in5_in,
      O => \TX_DATA[30]_i_1_n_0\
    );
\TX_DATA[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000000CD"
    )
        port map (
      I0 => p_0_in14_in,
      I1 => gen_a_r,
      I2 => p_0_in16_in,
      I3 => \^gen_spa_r\,
      I4 => gen_sp_r,
      I5 => gen_cc_r,
      O => \TX_DATA[30]_i_2_n_0\
    );
\TX_DATA[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => p_0_in5_in,
      I1 => \TX_DATA[31]_i_3_n_0\,
      I2 => p_1_in11_in,
      I3 => p_1_in16_in,
      O => \TX_DATA[31]_i_1_n_0\
    );
\TX_DATA[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE2"
    )
        port map (
      I0 => \TX_DATA[31]_i_4_n_0\,
      I1 => p_1_in11_in,
      I2 => \tx_pe_data_r_reg_n_0_[0]\,
      I3 => p_0_in5_in,
      O => \TX_DATA[31]_i_2_n_0\
    );
\TX_DATA[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => p_0_in16_in,
      I1 => gen_cc_r,
      I2 => \^gen_spa_r\,
      I3 => gen_sp_r,
      I4 => gen_a_r,
      I5 => p_0_in14_in,
      O => \TX_DATA[31]_i_3_n_0\
    );
\TX_DATA[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF0FFFFFFFB"
    )
        port map (
      I0 => p_0_in16_in,
      I1 => p_0_in14_in,
      I2 => gen_cc_r,
      I3 => \^gen_spa_r\,
      I4 => gen_sp_r,
      I5 => gen_a_r,
      O => \TX_DATA[31]_i_4_n_0\
    );
\TX_DATA[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E0EF"
    )
        port map (
      I0 => \tx_pe_data_r_reg_n_0_[28]\,
      I1 => \gen_pad_r_reg_n_0_[1]\,
      I2 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I3 => gen_cc_r,
      O => \TX_DATA[3]_i_1_n_0\
    );
\TX_DATA[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFE0"
    )
        port map (
      I0 => \tx_pe_data_r_reg_n_0_[27]\,
      I1 => \gen_pad_r_reg_n_0_[1]\,
      I2 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I3 => \TX_DATA[4]_i_2_n_0\,
      O => \TX_DATA[4]_i_1_n_0\
    );
\TX_DATA[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00030002"
    )
        port map (
      I0 => \gen_k_r_reg_n_0_[3]\,
      I1 => \gen_v_r_reg_n_0_[3]\,
      I2 => \^gen_spa_r\,
      I3 => gen_sp_r,
      I4 => \gen_r_r_reg_n_0_[3]\,
      I5 => gen_cc_r,
      O => \TX_DATA[4]_i_2_n_0\
    );
\TX_DATA[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => \tx_pe_data_r_reg_n_0_[26]\,
      I1 => \gen_pad_r_reg_n_0_[1]\,
      I2 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I3 => \TX_DATA[5]_i_2_n_0\,
      O => \TX_DATA[5]_i_1_n_0\
    );
\TX_DATA[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000FFFFFEFF"
    )
        port map (
      I0 => \gen_k_r_reg_n_0_[3]\,
      I1 => \gen_v_r_reg_n_0_[3]\,
      I2 => \^gen_spa_r\,
      I3 => \gen_r_r_reg_n_0_[3]\,
      I4 => gen_cc_r,
      I5 => gen_sp_r,
      O => \TX_DATA[5]_i_2_n_0\
    );
\TX_DATA[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F20"
    )
        port map (
      I0 => \tx_pe_data_r_reg_n_0_[25]\,
      I1 => \gen_pad_r_reg_n_0_[1]\,
      I2 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I3 => \TX_DATA[6]_i_2_n_0\,
      O => \TX_DATA[6]_i_1_n_0\
    );
\TX_DATA[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF00CD"
    )
        port map (
      I0 => \gen_k_r_reg_n_0_[3]\,
      I1 => \gen_v_r_reg_n_0_[3]\,
      I2 => \gen_r_r_reg_n_0_[3]\,
      I3 => \^gen_spa_r\,
      I4 => gen_sp_r,
      I5 => gen_cc_r,
      O => \TX_DATA[6]_i_2_n_0\
    );
\TX_DATA[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \gen_ecp_r_reg_n_0_[1]\,
      I1 => TX_DATA_reg0,
      O => \TX_DATA[7]_i_1_n_0\
    );
\TX_DATA[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I1 => \gen_r_r_reg_n_0_[3]\,
      I2 => \TX_DATA[15]_i_4_n_0\,
      I3 => \gen_v_r_reg_n_0_[3]\,
      I4 => \gen_k_r_reg_n_0_[3]\,
      I5 => \gen_ecp_r_reg_n_0_[1]\,
      O => TX_DATA_reg0
    );
\TX_DATA[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFE0"
    )
        port map (
      I0 => \tx_pe_data_r_reg_n_0_[24]\,
      I1 => \gen_pad_r_reg_n_0_[1]\,
      I2 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I3 => \TX_DATA[7]_i_4_n_0\,
      O => \TX_DATA[7]_i_3_n_0\
    );
\TX_DATA[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000000EF"
    )
        port map (
      I0 => \gen_k_r_reg_n_0_[3]\,
      I1 => \gen_v_r_reg_n_0_[3]\,
      I2 => \gen_r_r_reg_n_0_[3]\,
      I3 => \^gen_spa_r\,
      I4 => gen_sp_r,
      I5 => gen_cc_r,
      O => \TX_DATA[7]_i_4_n_0\
    );
\TX_DATA[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => data0(0),
      I1 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I2 => gen_cc_r,
      O => \TX_DATA[8]_i_1_n_0\
    );
\TX_DATA[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00E2FFFF00E20000"
    )
        port map (
      I0 => \TX_DATA[9]_i_2_n_0\,
      I1 => \tx_pe_data_v_r_reg_n_0_[1]\,
      I2 => data0(1),
      I3 => \gen_ecp_r_reg_n_0_[1]\,
      I4 => \TX_DATA[15]_i_2_n_0\,
      I5 => \^gtwiz_userdata_tx_in\(17),
      O => \TX_DATA[9]_i_1_n_0\
    );
\TX_DATA[9]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => gen_sp_r,
      I1 => gen_cc_r,
      O => \TX_DATA[9]_i_2_n_0\
    );
\TX_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_DATA[0]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(24),
      R => '0'
    );
\TX_DATA_reg[10]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[15]_i_2_n_0\,
      D => \TX_DATA[10]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(18),
      S => \TX_DATA[15]_i_1_n_0\
    );
\TX_DATA_reg[11]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[15]_i_2_n_0\,
      D => \TX_DATA[11]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(19),
      S => \TX_DATA[15]_i_1_n_0\
    );
\TX_DATA_reg[12]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[15]_i_2_n_0\,
      D => \TX_DATA[12]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(20),
      S => \TX_DATA[15]_i_1_n_0\
    );
\TX_DATA_reg[13]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[15]_i_2_n_0\,
      D => \TX_DATA[13]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(21),
      S => \TX_DATA[15]_i_1_n_0\
    );
\TX_DATA_reg[14]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[15]_i_2_n_0\,
      D => \TX_DATA[14]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(22),
      S => \TX_DATA[15]_i_1_n_0\
    );
\TX_DATA_reg[15]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[15]_i_2_n_0\,
      D => \TX_DATA[15]_i_3_n_0\,
      Q => \^gtwiz_userdata_tx_in\(23),
      S => \TX_DATA[15]_i_1_n_0\
    );
\TX_DATA_reg[16]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[23]_i_1_n_0\,
      D => \TX_DATA[16]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(8),
      S => p_1_in16_in
    );
\TX_DATA_reg[17]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[23]_i_1_n_0\,
      D => \TX_DATA[17]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(9),
      S => p_1_in16_in
    );
\TX_DATA_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_DATA[18]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(10),
      R => '0'
    );
\TX_DATA_reg[19]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[23]_i_1_n_0\,
      D => \TX_DATA[19]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(11),
      S => p_1_in16_in
    );
\TX_DATA_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => TX_DATA_reg0,
      D => \TX_DATA[1]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(25),
      S => \TX_DATA[7]_i_1_n_0\
    );
\TX_DATA_reg[20]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[23]_i_1_n_0\,
      D => \TX_DATA[20]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(12),
      S => p_1_in16_in
    );
\TX_DATA_reg[21]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[23]_i_1_n_0\,
      D => \TX_DATA[21]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(13),
      S => p_1_in16_in
    );
\TX_DATA_reg[22]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[23]_i_1_n_0\,
      D => \TX_DATA[22]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(14),
      S => p_1_in16_in
    );
\TX_DATA_reg[23]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[23]_i_1_n_0\,
      D => \TX_DATA[23]_i_2_n_0\,
      Q => \^gtwiz_userdata_tx_in\(15),
      S => p_1_in16_in
    );
\TX_DATA_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \TX_DATA[31]_i_1_n_0\,
      D => \TX_DATA[24]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(0),
      R => p_1_in16_in
    );
\TX_DATA_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \TX_DATA[31]_i_1_n_0\,
      D => \TX_DATA[25]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(1),
      R => p_1_in16_in
    );
\TX_DATA_reg[26]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[31]_i_1_n_0\,
      D => \TX_DATA[26]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(2),
      S => p_1_in16_in
    );
\TX_DATA_reg[27]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[31]_i_1_n_0\,
      D => \TX_DATA[27]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(3),
      S => p_1_in16_in
    );
\TX_DATA_reg[28]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[31]_i_1_n_0\,
      D => \TX_DATA[28]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(4),
      S => p_1_in16_in
    );
\TX_DATA_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \TX_DATA[31]_i_1_n_0\,
      D => \TX_DATA[29]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(5),
      R => p_1_in16_in
    );
\TX_DATA_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => TX_DATA_reg0,
      D => \TX_DATA[2]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(26),
      S => \TX_DATA[7]_i_1_n_0\
    );
\TX_DATA_reg[30]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[31]_i_1_n_0\,
      D => \TX_DATA[30]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(6),
      S => p_1_in16_in
    );
\TX_DATA_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \TX_DATA[31]_i_1_n_0\,
      D => \TX_DATA[31]_i_2_n_0\,
      Q => \^gtwiz_userdata_tx_in\(7),
      R => p_1_in16_in
    );
\TX_DATA_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => TX_DATA_reg0,
      D => \TX_DATA[3]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(27),
      S => \TX_DATA[7]_i_1_n_0\
    );
\TX_DATA_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => TX_DATA_reg0,
      D => \TX_DATA[4]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(28),
      S => \TX_DATA[7]_i_1_n_0\
    );
\TX_DATA_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => TX_DATA_reg0,
      D => \TX_DATA[5]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(29),
      S => \TX_DATA[7]_i_1_n_0\
    );
\TX_DATA_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => TX_DATA_reg0,
      D => \TX_DATA[6]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(30),
      S => \TX_DATA[7]_i_1_n_0\
    );
\TX_DATA_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => TX_DATA_reg0,
      D => \TX_DATA[7]_i_3_n_0\,
      Q => \^gtwiz_userdata_tx_in\(31),
      S => \TX_DATA[7]_i_1_n_0\
    );
\TX_DATA_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \TX_DATA[15]_i_2_n_0\,
      D => \TX_DATA[8]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(16),
      S => \TX_DATA[15]_i_1_n_0\
    );
\TX_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_DATA[9]_i_1_n_0\,
      Q => \^gtwiz_userdata_tx_in\(17),
      R => '0'
    );
\fc_nb_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \FC_NB_reg[0]\(3),
      Q => fc_nb_r(0),
      R => '0'
    );
\fc_nb_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \FC_NB_reg[0]\(2),
      Q => fc_nb_r(1),
      R => '0'
    );
\fc_nb_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \FC_NB_reg[0]\(1),
      Q => fc_nb_r(2),
      R => '0'
    );
\fc_nb_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \FC_NB_reg[0]\(0),
      Q => fc_nb_r(3),
      R => '0'
    );
gen_a_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_a_i,
      Q => gen_a_r,
      R => '0'
    );
gen_cc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_cc_i,
      Q => gen_cc_r,
      R => '0'
    );
\gen_ecp_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_ecp_i,
      Q => \gen_ecp_r_reg_n_0_[1]\,
      R => '0'
    );
\gen_k_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_k_flop_0_i(3),
      Q => p_0_in16_in,
      R => '0'
    );
\gen_k_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_k_flop_0_i(2),
      Q => p_0_in8_in,
      R => '0'
    );
\gen_k_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_k_flop_0_i(1),
      Q => p_0_in4_in,
      R => '0'
    );
\gen_k_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_k_flop_0_i(0),
      Q => \gen_k_r_reg_n_0_[3]\,
      R => '0'
    );
\gen_pad_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \GEN_PAD_reg[0]\(1),
      Q => p_0_in12_in,
      R => '0'
    );
\gen_pad_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \GEN_PAD_reg[0]\(0),
      Q => \gen_pad_r_reg_n_0_[1]\,
      R => '0'
    );
\gen_r_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_r_flop_0_i(3),
      Q => p_0_in14_in,
      R => '0'
    );
\gen_r_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_r_flop_0_i(2),
      Q => p_0_in6_in,
      R => '0'
    );
\gen_r_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_r_flop_0_i(1),
      Q => p_0_in,
      R => '0'
    );
\gen_r_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_r_flop_0_i(0),
      Q => \gen_r_r_reg_n_0_[3]\,
      R => '0'
    );
\gen_scp_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_scp_striped_i(0),
      Q => p_1_in16_in,
      R => '0'
    );
\gen_snf_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_snf_striped_i(0),
      Q => p_0_in5_in,
      R => '0'
    );
gen_sp_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => GEN_SP,
      Q => gen_sp_r,
      R => '0'
    );
gen_spa_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_spa_i,
      Q => \^gen_spa_r\,
      R => '0'
    );
\gen_v_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_v_flop_1_i(2),
      Q => p_2_in,
      R => '0'
    );
\gen_v_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_v_flop_1_i(1),
      Q => p_1_in,
      R => '0'
    );
\gen_v_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gen_v_flop_1_i(0),
      Q => \gen_v_r_reg_n_0_[3]\,
      R => '0'
    );
\tx_pe_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(31),
      Q => \tx_pe_data_r_reg_n_0_[0]\,
      R => '0'
    );
\tx_pe_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(21),
      Q => data1(5),
      R => '0'
    );
\tx_pe_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(20),
      Q => data1(4),
      R => '0'
    );
\tx_pe_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(19),
      Q => data1(3),
      R => '0'
    );
\tx_pe_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(18),
      Q => data1(2),
      R => '0'
    );
\tx_pe_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(17),
      Q => data1(1),
      R => '0'
    );
\tx_pe_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(16),
      Q => data1(0),
      R => '0'
    );
\tx_pe_data_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(15),
      Q => data0(7),
      R => '0'
    );
\tx_pe_data_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(14),
      Q => data0(6),
      R => '0'
    );
\tx_pe_data_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(13),
      Q => data0(5),
      R => '0'
    );
\tx_pe_data_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(12),
      Q => data0(4),
      R => '0'
    );
\tx_pe_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(30),
      Q => \tx_pe_data_r_reg_n_0_[1]\,
      R => '0'
    );
\tx_pe_data_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(11),
      Q => data0(3),
      R => '0'
    );
\tx_pe_data_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(10),
      Q => data0(2),
      R => '0'
    );
\tx_pe_data_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(9),
      Q => data0(1),
      R => '0'
    );
\tx_pe_data_r_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(8),
      Q => data0(0),
      R => '0'
    );
\tx_pe_data_r_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(7),
      Q => \tx_pe_data_r_reg_n_0_[24]\,
      R => '0'
    );
\tx_pe_data_r_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(6),
      Q => \tx_pe_data_r_reg_n_0_[25]\,
      R => '0'
    );
\tx_pe_data_r_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(5),
      Q => \tx_pe_data_r_reg_n_0_[26]\,
      R => '0'
    );
\tx_pe_data_r_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(4),
      Q => \tx_pe_data_r_reg_n_0_[27]\,
      R => '0'
    );
\tx_pe_data_r_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(3),
      Q => \tx_pe_data_r_reg_n_0_[28]\,
      R => '0'
    );
\tx_pe_data_r_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(2),
      Q => \tx_pe_data_r_reg_n_0_[29]\,
      R => '0'
    );
\tx_pe_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(29),
      Q => \tx_pe_data_r_reg_n_0_[2]\,
      R => '0'
    );
\tx_pe_data_r_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(1),
      Q => \tx_pe_data_r_reg_n_0_[30]\,
      R => '0'
    );
\tx_pe_data_r_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(0),
      Q => \tx_pe_data_r_reg_n_0_[31]\,
      R => '0'
    );
\tx_pe_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(28),
      Q => \tx_pe_data_r_reg_n_0_[3]\,
      R => '0'
    );
\tx_pe_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(27),
      Q => \tx_pe_data_r_reg_n_0_[4]\,
      R => '0'
    );
\tx_pe_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(26),
      Q => \tx_pe_data_r_reg_n_0_[5]\,
      R => '0'
    );
\tx_pe_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(25),
      Q => \tx_pe_data_r_reg_n_0_[6]\,
      R => '0'
    );
\tx_pe_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(24),
      Q => \tx_pe_data_r_reg_n_0_[7]\,
      R => '0'
    );
\tx_pe_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(23),
      Q => data1(7),
      R => '0'
    );
\tx_pe_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_reg[0]\(22),
      Q => data1(6),
      R => '0'
    );
\tx_pe_data_v_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_V_reg[0]\(1),
      Q => p_1_in11_in,
      R => '0'
    );
\tx_pe_data_v_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \TX_PE_DATA_V_reg[0]\(0),
      Q => \tx_pe_data_v_r_reg_n_0_[1]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL_CONTROL is
  port (
    gen_cc_i : out STD_LOGIC;
    gen_cc_flop_0_i_0 : out STD_LOGIC;
    s_axi_nfc_tx_tready : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    idle_r_reg_0 : out STD_LOGIC;
    gen_scp_striped_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    gen_ecp_i : out STD_LOGIC;
    gen_snf_striped_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_tx_tready : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    storage_pad_r0 : out STD_LOGIC;
    storage_v_r0 : out STD_LOGIC;
    in_frame_r_reg : out STD_LOGIC;
    \fc_nb_r_reg[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    user_clk : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    do_nfc_r : in STD_LOGIC;
    Q : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    do_nfc_r_reg_0 : in STD_LOGIC;
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 3 );
    in_frame_r_reg_0 : in STD_LOGIC;
    new_pkt_r_reg : in STD_LOGIC;
    s_axi_nfc_nb : in STD_LOGIC_VECTOR ( 0 to 3 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL_CONTROL : entity is "dnpcie_aurora_2_sim_TX_LL_CONTROL";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL_CONTROL;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL_CONTROL is
  signal \^e\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GEN_ECP0 : STD_LOGIC;
  signal GEN_SCP0 : STD_LOGIC;
  signal TX_DST_RDY_N_i_2_n_0 : STD_LOGIC;
  signal data_r : STD_LOGIC;
  signal data_to_eof_1_r : STD_LOGIC;
  signal data_to_eof_2_r : STD_LOGIC;
  signal \^gen_cc_flop_0_i_0\ : STD_LOGIC;
  signal idle_r : STD_LOGIC;
  signal \^idle_r_reg_0\ : STD_LOGIC;
  signal next_data_c : STD_LOGIC;
  signal next_data_to_eof_1_c : STD_LOGIC;
  signal next_idle_c : STD_LOGIC;
  signal next_sof_to_eof_1_c : STD_LOGIC;
  signal \^s_axi_nfc_tx_tready\ : STD_LOGIC;
  signal sof_to_data_r : STD_LOGIC;
  signal sof_to_data_r_i_1_n_0 : STD_LOGIC;
  signal sof_to_eof_1_r : STD_LOGIC;
  signal sof_to_eof_1_r_i_2_n_0 : STD_LOGIC;
  signal sof_to_eof_2_r : STD_LOGIC;
  signal storage_v_r_i_3_n_0 : STD_LOGIC;
  signal tx_dst_rdy_n_c : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of TX_DST_RDY_N_i_2 : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of data_r_i_1 : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of data_to_eof_1_r_i_1 : label is "soft_lutpair97";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of gen_cc_flop_0_i : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of gen_cc_flop_0_i : label is "FDR";
  attribute SOFT_HLUTNM of in_frame_r_i_1 : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of sof_to_eof_1_r_i_2 : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of storage_v_r_i_3 : label is "soft_lutpair99";
begin
  E(0) <= \^e\(0);
  gen_cc_flop_0_i_0 <= \^gen_cc_flop_0_i_0\;
  idle_r_reg_0 <= \^idle_r_reg_0\;
  s_axi_nfc_tx_tready <= \^s_axi_nfc_tx_tready\;
\FC_NB_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => s_axi_nfc_nb(0),
      Q => \fc_nb_r_reg[0]\(3),
      R => '0'
    );
\FC_NB_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => s_axi_nfc_nb(1),
      Q => \fc_nb_r_reg[0]\(2),
      R => '0'
    );
\FC_NB_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => s_axi_nfc_nb(2),
      Q => \fc_nb_r_reg[0]\(1),
      R => '0'
    );
\FC_NB_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => s_axi_nfc_nb(3),
      Q => \fc_nb_r_reg[0]\(0),
      R => '0'
    );
GEN_ECP_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1110"
    )
        port map (
      I0 => \^gen_cc_flop_0_i_0\,
      I1 => \^s_axi_nfc_tx_tready\,
      I2 => data_to_eof_2_r,
      I3 => sof_to_eof_2_r,
      O => GEN_ECP0
    );
GEN_ECP_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => GEN_ECP0,
      Q => gen_ecp_i,
      R => p_0_in
    );
GEN_SCP_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1110"
    )
        port map (
      I0 => \^gen_cc_flop_0_i_0\,
      I1 => \^s_axi_nfc_tx_tready\,
      I2 => sof_to_eof_1_r,
      I3 => sof_to_data_r,
      O => GEN_SCP0
    );
GEN_SCP_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => GEN_SCP0,
      Q => gen_scp_striped_i(0),
      R => p_0_in
    );
GEN_SNF_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \^s_axi_nfc_tx_tready\,
      Q => gen_snf_striped_i(0),
      R => p_0_in
    );
TX_DST_RDY_N_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFDFDFDFFFFFFF0"
    )
        port map (
      I0 => TX_DST_RDY_N_i_2_n_0,
      I1 => next_sof_to_eof_1_c,
      I2 => do_nfc_r_reg_0,
      I3 => sof_to_eof_1_r,
      I4 => data_to_eof_1_r,
      I5 => \^e\(0),
      O => tx_dst_rdy_n_c
    );
TX_DST_RDY_N_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFDFDFFF"
    )
        port map (
      I0 => s_axi_tx_tlast,
      I1 => \^idle_r_reg_0\,
      I2 => s_axi_tx_tvalid,
      I3 => sof_to_data_r,
      I4 => data_r,
      O => TX_DST_RDY_N_i_2_n_0
    );
TX_DST_RDY_N_reg: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_dst_rdy_n_c,
      Q => \^idle_r_reg_0\,
      S => p_0_in
    );
data_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFDFDF00"
    )
        port map (
      I0 => s_axi_tx_tlast,
      I1 => \^idle_r_reg_0\,
      I2 => s_axi_tx_tvalid,
      I3 => sof_to_data_r,
      I4 => data_r,
      O => next_data_c
    );
data_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \^e\(0),
      D => next_data_c,
      Q => data_r,
      R => p_0_in
    );
data_to_eof_1_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00E00000"
    )
        port map (
      I0 => data_r,
      I1 => sof_to_data_r,
      I2 => s_axi_tx_tvalid,
      I3 => \^idle_r_reg_0\,
      I4 => s_axi_tx_tlast,
      O => next_data_to_eof_1_c
    );
data_to_eof_1_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \^e\(0),
      D => next_data_to_eof_1_c,
      Q => data_to_eof_1_r,
      R => p_0_in
    );
data_to_eof_2_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \^e\(0),
      D => data_to_eof_1_r,
      Q => data_to_eof_2_r,
      R => p_0_in
    );
do_cc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => Q,
      Q => \^gen_cc_flop_0_i_0\,
      R => '0'
    );
do_nfc_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => do_nfc_r,
      Q => \^s_axi_nfc_tx_tready\,
      R => p_0_in
    );
gen_cc_flop_0_i: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => \^gen_cc_flop_0_i_0\,
      Q => gen_cc_i,
      R => '0'
    );
\gen_pad_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001160000"
    )
        port map (
      I0 => s_axi_tx_tkeep(3),
      I1 => s_axi_tx_tkeep(0),
      I2 => s_axi_tx_tkeep(1),
      I3 => s_axi_tx_tkeep(2),
      I4 => s_axi_tx_tlast,
      I5 => storage_v_r_i_3_n_0,
      O => D(0)
    );
idle_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFBFBFBFBFBFB00"
    )
        port map (
      I0 => \^idle_r_reg_0\,
      I1 => s_axi_tx_tvalid,
      I2 => new_pkt_r_reg,
      I3 => sof_to_eof_2_r,
      I4 => data_to_eof_2_r,
      I5 => idle_r,
      O => next_idle_c
    );
idle_r_reg: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => \^e\(0),
      D => next_idle_c,
      Q => idle_r,
      S => p_0_in
    );
in_frame_r_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFDF0010"
    )
        port map (
      I0 => s_axi_tx_tlast,
      I1 => \^idle_r_reg_0\,
      I2 => s_axi_tx_tvalid,
      I3 => new_pkt_r_reg,
      I4 => in_frame_r_reg_0,
      O => in_frame_r_reg
    );
s_axi_tx_tready_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^idle_r_reg_0\,
      O => s_axi_tx_tready
    );
sof_to_data_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000005554"
    )
        port map (
      I0 => s_axi_tx_tlast,
      I1 => idle_r,
      I2 => data_to_eof_2_r,
      I3 => sof_to_eof_2_r,
      I4 => new_pkt_r_reg,
      I5 => sof_to_eof_1_r_i_2_n_0,
      O => sof_to_data_r_i_1_n_0
    );
sof_to_data_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \^e\(0),
      D => sof_to_data_r_i_1_n_0,
      Q => sof_to_data_r,
      R => p_0_in
    );
sof_to_eof_1_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000AAA8"
    )
        port map (
      I0 => s_axi_tx_tlast,
      I1 => idle_r,
      I2 => data_to_eof_2_r,
      I3 => sof_to_eof_2_r,
      I4 => new_pkt_r_reg,
      I5 => sof_to_eof_1_r_i_2_n_0,
      O => next_sof_to_eof_1_c
    );
sof_to_eof_1_r_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^idle_r_reg_0\,
      I1 => s_axi_tx_tvalid,
      O => sof_to_eof_1_r_i_2_n_0
    );
sof_to_eof_1_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \^e\(0),
      D => next_sof_to_eof_1_c,
      Q => sof_to_eof_1_r,
      R => p_0_in
    );
sof_to_eof_2_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => \^e\(0),
      D => sof_to_eof_1_r,
      Q => sof_to_eof_2_r,
      R => p_0_in
    );
storage_pad_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000068800000"
    )
        port map (
      I0 => s_axi_tx_tkeep(3),
      I1 => s_axi_tx_tkeep(0),
      I2 => s_axi_tx_tkeep(1),
      I3 => s_axi_tx_tkeep(2),
      I4 => s_axi_tx_tlast,
      I5 => storage_v_r_i_3_n_0,
      O => storage_pad_r0
    );
storage_v_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^s_axi_nfc_tx_tready\,
      I1 => \^gen_cc_flop_0_i_0\,
      O => \^e\(0)
    );
storage_v_r_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FDD5D557"
    )
        port map (
      I0 => s_axi_tx_tlast,
      I1 => s_axi_tx_tkeep(1),
      I2 => s_axi_tx_tkeep(2),
      I3 => s_axi_tx_tkeep(3),
      I4 => s_axi_tx_tkeep(0),
      I5 => storage_v_r_i_3_n_0,
      O => storage_v_r0
    );
storage_v_r_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFDD"
    )
        port map (
      I0 => s_axi_tx_tvalid,
      I1 => \^idle_r_reg_0\,
      I2 => in_frame_r_reg_0,
      I3 => new_pkt_r_reg,
      O => storage_v_r_i_3_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL_DATAPATH is
  port (
    \tx_pe_data_v_r_reg[1]_0\ : out STD_LOGIC;
    \tx_pe_data_v_r_reg[0]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_pad_r_reg[0]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \tx_pe_data_r_reg[0]_0\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    storage_v_r0 : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    storage_pad_r0 : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    TX_DST_RDY_N_reg : in STD_LOGIC;
    new_pkt_r_reg : in STD_LOGIC;
    tx_dst_rdy : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    do_cc_r : in STD_LOGIC;
    do_nfc_r_reg : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 31 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL_DATAPATH : entity is "dnpcie_aurora_2_sim_TX_LL_DATAPATH";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL_DATAPATH;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL_DATAPATH is
  signal \TX_PE_DATA_V[0]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pad_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \gen_pad_r_reg_n_0_[1]\ : STD_LOGIC;
  signal p_12_in : STD_LOGIC;
  signal storage_pad_r : STD_LOGIC;
  signal storage_r : STD_LOGIC_VECTOR ( 0 to 15 );
  signal storage_v_r : STD_LOGIC;
  signal tx_pe_data_r : STD_LOGIC_VECTOR ( 0 to 31 );
  signal \^tx_pe_data_v_r_reg[1]_0\ : STD_LOGIC;
  signal \tx_pe_data_v_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \tx_pe_data_v_r_reg_n_0_[1]\ : STD_LOGIC;
begin
  \tx_pe_data_v_r_reg[1]_0\ <= \^tx_pe_data_v_r_reg[1]_0\;
\GEN_PAD_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \gen_pad_r_reg_n_0_[0]\,
      Q => \gen_pad_r_reg[0]_0\(1),
      R => \TX_PE_DATA_V[0]_i_1_n_0\
    );
\GEN_PAD_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \gen_pad_r_reg_n_0_[1]\,
      Q => \gen_pad_r_reg[0]_0\(0),
      R => \TX_PE_DATA_V[0]_i_1_n_0\
    );
\TX_PE_DATA_V[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => do_cc_r,
      I1 => do_nfc_r_reg,
      O => \TX_PE_DATA_V[0]_i_1_n_0\
    );
\TX_PE_DATA_V_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \tx_pe_data_v_r_reg_n_0_[0]\,
      Q => \tx_pe_data_v_r_reg[0]_0\(1),
      R => \TX_PE_DATA_V[0]_i_1_n_0\
    );
\TX_PE_DATA_V_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \tx_pe_data_v_r_reg_n_0_[1]\,
      Q => \tx_pe_data_v_r_reg[0]_0\(0),
      R => \TX_PE_DATA_V[0]_i_1_n_0\
    );
\TX_PE_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(0),
      Q => \tx_pe_data_r_reg[0]_0\(31),
      R => '0'
    );
\TX_PE_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(10),
      Q => \tx_pe_data_r_reg[0]_0\(21),
      R => '0'
    );
\TX_PE_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(11),
      Q => \tx_pe_data_r_reg[0]_0\(20),
      R => '0'
    );
\TX_PE_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(12),
      Q => \tx_pe_data_r_reg[0]_0\(19),
      R => '0'
    );
\TX_PE_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(13),
      Q => \tx_pe_data_r_reg[0]_0\(18),
      R => '0'
    );
\TX_PE_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(14),
      Q => \tx_pe_data_r_reg[0]_0\(17),
      R => '0'
    );
\TX_PE_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(15),
      Q => \tx_pe_data_r_reg[0]_0\(16),
      R => '0'
    );
\TX_PE_DATA_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(16),
      Q => \tx_pe_data_r_reg[0]_0\(15),
      R => '0'
    );
\TX_PE_DATA_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(17),
      Q => \tx_pe_data_r_reg[0]_0\(14),
      R => '0'
    );
\TX_PE_DATA_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(18),
      Q => \tx_pe_data_r_reg[0]_0\(13),
      R => '0'
    );
\TX_PE_DATA_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(19),
      Q => \tx_pe_data_r_reg[0]_0\(12),
      R => '0'
    );
\TX_PE_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(1),
      Q => \tx_pe_data_r_reg[0]_0\(30),
      R => '0'
    );
\TX_PE_DATA_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(20),
      Q => \tx_pe_data_r_reg[0]_0\(11),
      R => '0'
    );
\TX_PE_DATA_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(21),
      Q => \tx_pe_data_r_reg[0]_0\(10),
      R => '0'
    );
\TX_PE_DATA_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(22),
      Q => \tx_pe_data_r_reg[0]_0\(9),
      R => '0'
    );
\TX_PE_DATA_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(23),
      Q => \tx_pe_data_r_reg[0]_0\(8),
      R => '0'
    );
\TX_PE_DATA_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(24),
      Q => \tx_pe_data_r_reg[0]_0\(7),
      R => '0'
    );
\TX_PE_DATA_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(25),
      Q => \tx_pe_data_r_reg[0]_0\(6),
      R => '0'
    );
\TX_PE_DATA_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(26),
      Q => \tx_pe_data_r_reg[0]_0\(5),
      R => '0'
    );
\TX_PE_DATA_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(27),
      Q => \tx_pe_data_r_reg[0]_0\(4),
      R => '0'
    );
\TX_PE_DATA_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(28),
      Q => \tx_pe_data_r_reg[0]_0\(3),
      R => '0'
    );
\TX_PE_DATA_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(29),
      Q => \tx_pe_data_r_reg[0]_0\(2),
      R => '0'
    );
\TX_PE_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(2),
      Q => \tx_pe_data_r_reg[0]_0\(29),
      R => '0'
    );
\TX_PE_DATA_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(30),
      Q => \tx_pe_data_r_reg[0]_0\(1),
      R => '0'
    );
\TX_PE_DATA_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(31),
      Q => \tx_pe_data_r_reg[0]_0\(0),
      R => '0'
    );
\TX_PE_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(3),
      Q => \tx_pe_data_r_reg[0]_0\(28),
      R => '0'
    );
\TX_PE_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(4),
      Q => \tx_pe_data_r_reg[0]_0\(27),
      R => '0'
    );
\TX_PE_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(5),
      Q => \tx_pe_data_r_reg[0]_0\(26),
      R => '0'
    );
\TX_PE_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(6),
      Q => \tx_pe_data_r_reg[0]_0\(25),
      R => '0'
    );
\TX_PE_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(7),
      Q => \tx_pe_data_r_reg[0]_0\(24),
      R => '0'
    );
\TX_PE_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(8),
      Q => \tx_pe_data_r_reg[0]_0\(23),
      R => '0'
    );
\TX_PE_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => tx_pe_data_r(9),
      Q => \tx_pe_data_r_reg[0]_0\(22),
      R => '0'
    );
\gen_pad_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_pad_r,
      Q => \gen_pad_r_reg_n_0_[0]\,
      R => '0'
    );
\gen_pad_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => D(0),
      Q => \gen_pad_r_reg_n_0_[1]\,
      R => '0'
    );
in_frame_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => TX_DST_RDY_N_reg,
      Q => \^tx_pe_data_v_r_reg[1]_0\,
      R => p_0_in
    );
storage_pad_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_pad_r0,
      Q => storage_pad_r,
      R => '0'
    );
\storage_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(16),
      Q => storage_r(0),
      R => '0'
    );
\storage_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(26),
      Q => storage_r(10),
      R => '0'
    );
\storage_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(27),
      Q => storage_r(11),
      R => '0'
    );
\storage_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(28),
      Q => storage_r(12),
      R => '0'
    );
\storage_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(29),
      Q => storage_r(13),
      R => '0'
    );
\storage_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(30),
      Q => storage_r(14),
      R => '0'
    );
\storage_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(31),
      Q => storage_r(15),
      R => '0'
    );
\storage_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(17),
      Q => storage_r(1),
      R => '0'
    );
\storage_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(18),
      Q => storage_r(2),
      R => '0'
    );
\storage_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(19),
      Q => storage_r(3),
      R => '0'
    );
\storage_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(20),
      Q => storage_r(4),
      R => '0'
    );
\storage_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(21),
      Q => storage_r(5),
      R => '0'
    );
\storage_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(22),
      Q => storage_r(6),
      R => '0'
    );
\storage_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(23),
      Q => storage_r(7),
      R => '0'
    );
\storage_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(24),
      Q => storage_r(8),
      R => '0'
    );
\storage_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(25),
      Q => storage_r(9),
      R => '0'
    );
storage_v_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_v_r0,
      Q => storage_v_r,
      R => '0'
    );
\tx_pe_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(0),
      Q => tx_pe_data_r(0),
      R => '0'
    );
\tx_pe_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(10),
      Q => tx_pe_data_r(10),
      R => '0'
    );
\tx_pe_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(11),
      Q => tx_pe_data_r(11),
      R => '0'
    );
\tx_pe_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(12),
      Q => tx_pe_data_r(12),
      R => '0'
    );
\tx_pe_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(13),
      Q => tx_pe_data_r(13),
      R => '0'
    );
\tx_pe_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(14),
      Q => tx_pe_data_r(14),
      R => '0'
    );
\tx_pe_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(15),
      Q => tx_pe_data_r(15),
      R => '0'
    );
\tx_pe_data_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(0),
      Q => tx_pe_data_r(16),
      R => '0'
    );
\tx_pe_data_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(1),
      Q => tx_pe_data_r(17),
      R => '0'
    );
\tx_pe_data_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(2),
      Q => tx_pe_data_r(18),
      R => '0'
    );
\tx_pe_data_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(3),
      Q => tx_pe_data_r(19),
      R => '0'
    );
\tx_pe_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(1),
      Q => tx_pe_data_r(1),
      R => '0'
    );
\tx_pe_data_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(4),
      Q => tx_pe_data_r(20),
      R => '0'
    );
\tx_pe_data_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(5),
      Q => tx_pe_data_r(21),
      R => '0'
    );
\tx_pe_data_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(6),
      Q => tx_pe_data_r(22),
      R => '0'
    );
\tx_pe_data_r_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(7),
      Q => tx_pe_data_r(23),
      R => '0'
    );
\tx_pe_data_r_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(8),
      Q => tx_pe_data_r(24),
      R => '0'
    );
\tx_pe_data_r_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(9),
      Q => tx_pe_data_r(25),
      R => '0'
    );
\tx_pe_data_r_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(10),
      Q => tx_pe_data_r(26),
      R => '0'
    );
\tx_pe_data_r_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(11),
      Q => tx_pe_data_r(27),
      R => '0'
    );
\tx_pe_data_r_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(12),
      Q => tx_pe_data_r(28),
      R => '0'
    );
\tx_pe_data_r_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(13),
      Q => tx_pe_data_r(29),
      R => '0'
    );
\tx_pe_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(2),
      Q => tx_pe_data_r(2),
      R => '0'
    );
\tx_pe_data_r_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(14),
      Q => tx_pe_data_r(30),
      R => '0'
    );
\tx_pe_data_r_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => s_axi_tx_tdata(15),
      Q => tx_pe_data_r(31),
      R => '0'
    );
\tx_pe_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(3),
      Q => tx_pe_data_r(3),
      R => '0'
    );
\tx_pe_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(4),
      Q => tx_pe_data_r(4),
      R => '0'
    );
\tx_pe_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(5),
      Q => tx_pe_data_r(5),
      R => '0'
    );
\tx_pe_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(6),
      Q => tx_pe_data_r(6),
      R => '0'
    );
\tx_pe_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(7),
      Q => tx_pe_data_r(7),
      R => '0'
    );
\tx_pe_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(8),
      Q => tx_pe_data_r(8),
      R => '0'
    );
\tx_pe_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_r(9),
      Q => tx_pe_data_r(9),
      R => '0'
    );
\tx_pe_data_v_r[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0D00"
    )
        port map (
      I0 => new_pkt_r_reg,
      I1 => \^tx_pe_data_v_r_reg[1]_0\,
      I2 => tx_dst_rdy,
      I3 => s_axi_tx_tvalid,
      O => p_12_in
    );
\tx_pe_data_v_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => storage_v_r,
      Q => \tx_pe_data_v_r_reg_n_0_[0]\,
      R => '0'
    );
\tx_pe_data_v_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => E(0),
      D => p_12_in,
      Q => \tx_pe_data_v_r_reg_n_0_[1]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_VALID_DATA_COUNTER is
  port (
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \STORAGE_CE_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    end_storage_r0 : out STD_LOGIC;
    \STORAGE_SELECT_reg[9]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    stage_2_start_with_data_r : in STD_LOGIC;
    stage_3_end_storage_r : in STD_LOGIC;
    \storage_count_r_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    stage_2_end_after_start_r : in STD_LOGIC;
    stage_2_end_before_start_r : in STD_LOGIC;
    \storage_count_r_reg[1]\ : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    \DEFRAMED_DATA_V_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_VALID_DATA_COUNTER : entity is "dnpcie_aurora_2_sim_VALID_DATA_COUNTER";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_VALID_DATA_COUNTER;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_VALID_DATA_COUNTER is
  signal \^q\ : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  Q(1 downto 0) <= \^q\(1 downto 0);
\COUNT_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \DEFRAMED_DATA_V_reg[0]\(1),
      Q => \^q\(1),
      R => SS(0)
    );
\COUNT_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \DEFRAMED_DATA_V_reg[0]\(0),
      Q => \^q\(0),
      R => SS(0)
    );
\STORAGE_CE[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFCFFFEFFFF"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => stage_2_start_with_data_r,
      I3 => stage_3_end_storage_r,
      I4 => \storage_count_r_reg[0]\(1),
      I5 => \storage_count_r_reg[0]\(0),
      O => \STORAGE_CE_reg[0]\(0)
    );
\STORAGE_SELECT[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \storage_count_r_reg[0]\(0),
      O => \STORAGE_SELECT_reg[9]\(0)
    );
end_storage_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B8B888B8"
    )
        port map (
      I0 => stage_2_end_after_start_r,
      I1 => stage_2_start_with_data_r,
      I2 => stage_2_end_before_start_r,
      I3 => \storage_count_r_reg[1]\,
      I4 => \^q\(1),
      I5 => \^q\(0),
      O => end_storage_r0
    );
\storage_count_r[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E1F1F0E0F0E0F1F0"
    )
        port map (
      I0 => stage_2_start_with_data_r,
      I1 => stage_3_end_storage_r,
      I2 => \^q\(1),
      I3 => \storage_count_r_reg[0]\(1),
      I4 => \^q\(0),
      I5 => \storage_count_r_reg[0]\(0),
      O => D(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync is
  port (
    \out\ : out STD_LOGIC;
    gt_reset : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync : entity is "dnpcie_aurora_2_sim_cdc_sync";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
  p_level_in_int <= gt_reset;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_dnpcie_aurora_2_sim_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(0)
    );
s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync_0 is
  port (
    reset : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync_0 : entity is "dnpcie_aurora_2_sim_cdc_sync";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync_0;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync_0 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  p_level_in_int <= reset;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_dnpcie_aurora_2_sim_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(0)
    );
s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync_1 is
  port (
    \out\ : out STD_LOGIC;
    reset : in STD_LOGIC;
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync_1 : entity is "dnpcie_aurora_2_sim_cdc_sync";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync_1;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync_1 is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
  p_level_in_int <= reset;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_dnpcie_aurora_2_sim_cdc_to
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => p_level_in_d1_cdc_from
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(0)
    );
s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0\ is
  port (
    \out\ : out STD_LOGIC;
    gtrxreset_i : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0\ : entity is "dnpcie_aurora_2_sim_cdc_sync";
end \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0\;

architecture STRUCTURE of \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_dnpcie_aurora_2_sim_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => gtrxreset_i,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_21\ is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    rx_cc_extend_r2 : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    init_clk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_21\ : entity is "dnpcie_aurora_2_sim_cdc_sync";
end \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_21\;

architecture STRUCTURE of \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_21\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  SR(0) <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_dnpcie_aurora_2_sim_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => rx_cc_extend_r2,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_22\ is
  port (
    \out\ : out STD_LOGIC;
    link_reset_r : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_22\ : entity is "dnpcie_aurora_2_sim_cdc_sync";
end \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_22\;

architecture STRUCTURE of \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_22\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_dnpcie_aurora_2_sim_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_r,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_23\ is
  port (
    \out\ : out STD_LOGIC;
    tx_lock_comb_r : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    user_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_23\ : entity is "dnpcie_aurora_2_sim_cdc_sync";
end \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_23\;

architecture STRUCTURE of \dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_23\ is
  signal p_level_in_d1_cdc_from : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of p_level_in_d1_cdc_from : signal is "true";
  signal p_level_in_int : STD_LOGIC;
  signal s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract : string;
  attribute shift_extract of s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_bus_d2 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d2 : signal is "true";
  attribute shift_extract of s_level_out_bus_d2 : signal is "{no}";
  signal s_level_out_bus_d3 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d3 : signal is "true";
  attribute shift_extract of s_level_out_bus_d3 : signal is "{no}";
  signal s_level_out_bus_d4 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d4 : signal is "true";
  attribute shift_extract of s_level_out_bus_d4 : signal is "{no}";
  signal s_level_out_bus_d5 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d5 : signal is "true";
  attribute shift_extract of s_level_out_bus_d5 : signal is "{no}";
  signal s_level_out_bus_d6 : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg of s_level_out_bus_d6 : signal is "true";
  attribute shift_extract of s_level_out_bus_d6 : signal is "{no}";
  signal s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_level_out_d2 : STD_LOGIC;
  attribute async_reg of s_level_out_d2 : signal is "true";
  attribute shift_extract of s_level_out_d2 : signal is "{no}";
  signal s_level_out_d3 : STD_LOGIC;
  attribute async_reg of s_level_out_d3 : signal is "true";
  attribute shift_extract of s_level_out_d3 : signal is "{no}";
  signal s_level_out_d4 : STD_LOGIC;
  attribute async_reg of s_level_out_d4 : signal is "true";
  attribute shift_extract of s_level_out_d4 : signal is "{no}";
  signal s_level_out_d5 : STD_LOGIC;
  attribute async_reg of s_level_out_d5 : signal is "true";
  attribute shift_extract of s_level_out_d5 : signal is "{no}";
  signal s_level_out_d6 : STD_LOGIC;
  attribute async_reg of s_level_out_d6 : signal is "true";
  attribute shift_extract of s_level_out_d6 : signal is "{no}";
  signal s_out_d1_dnpcie_aurora_2_sim_cdc_to : STD_LOGIC;
  attribute async_reg of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "true";
  attribute shift_extract of s_out_d1_dnpcie_aurora_2_sim_cdc_to : signal is "{no}";
  signal s_out_d2 : STD_LOGIC;
  attribute async_reg of s_out_d2 : signal is "true";
  attribute shift_extract of s_out_d2 : signal is "{no}";
  signal s_out_d3 : STD_LOGIC;
  attribute async_reg of s_out_d3 : signal is "true";
  attribute shift_extract of s_out_d3 : signal is "{no}";
  signal s_out_d4 : STD_LOGIC;
  attribute async_reg of s_out_d4 : signal is "true";
  attribute shift_extract of s_out_d4 : signal is "{no}";
  signal s_out_d5 : STD_LOGIC;
  attribute async_reg of s_out_d5 : signal is "true";
  attribute shift_extract of s_out_d5 : signal is "{no}";
  signal s_out_d6 : STD_LOGIC;
  attribute async_reg of s_out_d6 : signal is "true";
  attribute shift_extract of s_out_d6 : signal is "{no}";
  signal s_out_d7 : STD_LOGIC;
  attribute async_reg of s_out_d7 : signal is "true";
  attribute shift_extract of s_out_d7 : signal is "{no}";
  attribute KEEP : string;
  attribute KEEP of p_level_in_d1_cdc_from_reg : label is "yes";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "yes";
  attribute shift_extract of s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d2_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d2_reg : label is "yes";
  attribute shift_extract of s_level_out_d2_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d3_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d3_reg : label is "yes";
  attribute shift_extract of s_level_out_d3_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d4_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d4_reg : label is "yes";
  attribute shift_extract of s_level_out_d4_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d5_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d5_reg : label is "yes";
  attribute shift_extract of s_level_out_d5_reg : label is "{no}";
  attribute ASYNC_REG_boolean of s_level_out_d6_reg : label is std.standard.true;
  attribute KEEP of s_level_out_d6_reg : label is "yes";
  attribute shift_extract of s_level_out_d6_reg : label is "{no}";
begin
  \out\ <= s_level_out_d3;
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_level_in_d1_cdc_from,
      O => p_level_in_int
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d1_dnpcie_aurora_2_sim_cdc_to
    );
i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(1)
    );
i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d2(0)
    );
i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(1)
    );
i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d3(0)
    );
i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(1)
    );
i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d4(0)
    );
i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(1)
    );
i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d5(0)
    );
i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(1)
    );
i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d6(0)
    );
i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d2
    );
i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d3
    );
i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d4
    );
i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d5
    );
i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d6
    );
i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_out_d7
    );
i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(1)
    );
i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '0',
      O => s_level_out_bus_d1_dnpcie_aurora_2_sim_cdc_to(0)
    );
p_level_in_d1_cdc_from_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => tx_lock_comb_r,
      Q => p_level_in_d1_cdc_from,
      R => '0'
    );
s_level_out_d1_dnpcie_aurora_2_sim_cdc_to_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => p_level_in_int,
      Q => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      R => '0'
    );
s_level_out_d2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d1_dnpcie_aurora_2_sim_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
s_level_out_d3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
s_level_out_d4_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d3,
      Q => s_level_out_d4,
      R => '0'
    );
s_level_out_d5_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d4,
      Q => s_level_out_d5,
      R => '0'
    );
s_level_out_d6_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => s_level_out_d5,
      Q => s_level_out_d6,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer is
  port (
    \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\ : out STD_LOGIC;
    rxresetdone_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer is
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rxresetdone_out(0),
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_10 is
  port (
    plllock_rx_sync : out STD_LOGIC;
    gtwiz_reset_rx_done_int_reg : out STD_LOGIC;
    sm_reset_rx_timer_clr_reg : out STD_LOGIC;
    cplllock_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sm_reset_rx_timer_sat_reg : in STD_LOGIC;
    \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gtwiz_reset_rx_done_int_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_10 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_10;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_10 is
  signal gtwiz_reset_rx_done_int : STD_LOGIC;
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  signal \^plllock_rx_sync\ : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
  plllock_rx_sync <= \^plllock_rx_sync\;
gtwiz_reset_rx_done_int_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAC0FFFFAAC00000"
    )
        port map (
      I0 => \^plllock_rx_sync\,
      I1 => sm_reset_rx_timer_sat_reg,
      I2 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      I3 => \out\(0),
      I4 => gtwiz_reset_rx_done_int,
      I5 => gtwiz_reset_rx_done_int_reg_0,
      O => gtwiz_reset_rx_done_int_reg
    );
gtwiz_reset_rx_done_int_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4C40000040400000"
    )
        port map (
      I0 => \^plllock_rx_sync\,
      I1 => \out\(2),
      I2 => \out\(0),
      I3 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      I4 => \out\(1),
      I5 => sm_reset_rx_timer_sat_reg,
      O => gtwiz_reset_rx_done_int
    );
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => cplllock_out(0),
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => \^plllock_rx_sync\,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
sm_reset_rx_timer_clr_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88880000F5FF5555"
    )
        port map (
      I0 => \out\(1),
      I1 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      I2 => \^plllock_rx_sync\,
      I3 => \out\(0),
      I4 => sm_reset_rx_timer_sat_reg,
      I5 => \out\(2),
      O => sm_reset_rx_timer_clr_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_11 is
  port (
    plllock_tx_sync : out STD_LOGIC;
    gtwiz_reset_tx_done_int_reg : out STD_LOGIC;
    \FSM_sequential_sm_reset_tx_reg[0]\ : out STD_LOGIC;
    cplllock_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_done_int_reg_0 : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    sm_reset_tx_timer_sat : in STD_LOGIC;
    sm_reset_tx_timer_clr_reg : in STD_LOGIC;
    \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\ : in STD_LOGIC;
    sm_reset_tx_timer_sat_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_11 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_11;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_11 is
  signal gtwiz_reset_tx_done_int : STD_LOGIC;
  signal gtwiz_reset_tx_done_int_i_2_n_0 : STD_LOGIC;
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  signal \^plllock_tx_sync\ : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
  plllock_tx_sync <= \^plllock_tx_sync\;
\FSM_sequential_sm_reset_tx[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00CFA00000000000"
    )
        port map (
      I0 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\,
      I1 => \^plllock_tx_sync\,
      I2 => \out\(0),
      I3 => \out\(2),
      I4 => \out\(1),
      I5 => sm_reset_tx_timer_sat_reg,
      O => \FSM_sequential_sm_reset_tx_reg[0]\
    );
gtwiz_reset_tx_done_int_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => gtwiz_reset_tx_done_int_i_2_n_0,
      I1 => gtwiz_reset_tx_done_int,
      I2 => gtwiz_reset_tx_done_int_reg_0,
      O => gtwiz_reset_tx_done_int_reg
    );
gtwiz_reset_tx_done_int_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444F44444"
    )
        port map (
      I0 => \out\(0),
      I1 => \^plllock_tx_sync\,
      I2 => sm_reset_tx_timer_sat,
      I3 => sm_reset_tx_timer_clr_reg,
      I4 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\,
      I5 => \out\(1),
      O => gtwiz_reset_tx_done_int_i_2_n_0
    );
gtwiz_reset_tx_done_int_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3000404000004040"
    )
        port map (
      I0 => \^plllock_tx_sync\,
      I1 => \out\(1),
      I2 => \out\(2),
      I3 => sm_reset_tx_timer_sat_reg,
      I4 => \out\(0),
      I5 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\,
      O => gtwiz_reset_tx_done_int
    );
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => cplllock_out(0),
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => \^plllock_tx_sync\,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_12 is
  port (
    gtwiz_reset_rx_cdr_stable_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    sm_reset_rx_cdr_to_clr_reg : out STD_LOGIC;
    \FSM_sequential_sm_reset_rx_reg[0]\ : out STD_LOGIC;
    rxprogdivreset_out_reg : out STD_LOGIC;
    rxcdrlock_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sm_reset_rx_timer_clr_reg : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    plllock_rx_sync : in STD_LOGIC;
    sm_reset_rx_cdr_to_clr : in STD_LOGIC;
    sm_reset_rx_timer_sat_reg : in STD_LOGIC;
    sm_reset_rx_cdr_to_sat : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_12 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_12;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_12 is
  signal \^gtwiz_reset_rx_cdr_stable_out\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  signal \^rxprogdivreset_out_reg\ : STD_LOGIC;
  signal sm_reset_rx_cdr_to_clr_i_2_n_0 : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of rxprogdivreset_out_i_2 : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of sm_reset_rx_cdr_to_clr_i_2 : label is "soft_lutpair101";
begin
  gtwiz_reset_rx_cdr_stable_out(0) <= \^gtwiz_reset_rx_cdr_stable_out\(0);
  rxprogdivreset_out_reg <= \^rxprogdivreset_out_reg\;
\FSM_sequential_sm_reset_rx[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000A000AC0C000C0"
    )
        port map (
      I0 => \^rxprogdivreset_out_reg\,
      I1 => sm_reset_rx_timer_sat_reg,
      I2 => \out\(1),
      I3 => \out\(0),
      I4 => plllock_rx_sync,
      I5 => \out\(2),
      O => \FSM_sequential_sm_reset_rx_reg[0]\
    );
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rxcdrlock_out(0),
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => \^gtwiz_reset_rx_cdr_stable_out\(0),
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
rxprogdivreset_out_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_sat,
      I1 => \^gtwiz_reset_rx_cdr_stable_out\(0),
      O => \^rxprogdivreset_out_reg\
    );
sm_reset_rx_cdr_to_clr_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFF0800AAAA"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_clr_i_2_n_0,
      I1 => sm_reset_rx_timer_clr_reg,
      I2 => \out\(2),
      I3 => plllock_rx_sync,
      I4 => \out\(0),
      I5 => sm_reset_rx_cdr_to_clr,
      O => sm_reset_rx_cdr_to_clr_reg
    );
sm_reset_rx_cdr_to_clr_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00EF"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_sat,
      I1 => \^gtwiz_reset_rx_cdr_stable_out\(0),
      I2 => \out\(2),
      I3 => \out\(1),
      O => sm_reset_rx_cdr_to_clr_i_2_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_2 is
  port (
    \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\ : out STD_LOGIC;
    txresetdone_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_2 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_2;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_2 is
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => txresetdone_out(0),
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_3 is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtpowergood_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sm_reset_all_timer_sat_reg : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    sm_reset_all_timer_clr_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_3 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_3;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_3 is
  signal gtpowergood_sync : STD_LOGIC;
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
\FSM_sequential_sm_reset_all[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF0FAF00CFFFCFFF"
    )
        port map (
      I0 => gtpowergood_sync,
      I1 => sm_reset_all_timer_sat_reg,
      I2 => \out\(2),
      I3 => \out\(0),
      I4 => sm_reset_all_timer_clr_reg,
      I5 => \out\(1),
      O => E(0)
    );
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => gtpowergood_out(0),
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => gtpowergood_sync,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_4 is
  port (
    gtwiz_reset_rx_datapath_dly : out STD_LOGIC;
    in0 : in STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_4 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_4;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_4 is
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => in0,
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => gtwiz_reset_rx_datapath_dly,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_5 is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_sequential_sm_reset_rx_reg[0]\ : out STD_LOGIC;
    in0 : in STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    sm_reset_rx_timer_sat_reg : in STD_LOGIC;
    \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\ : in STD_LOGIC;
    gtwiz_reset_rx_datapath_dly : in STD_LOGIC;
    \FSM_sequential_sm_reset_rx_reg[0]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_5 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_5;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_5 is
  signal gtwiz_reset_rx_pll_and_datapath_dly : STD_LOGIC;
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
\FSM_sequential_sm_reset_rx[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA55AA55F5EE55EE"
    )
        port map (
      I0 => \out\(2),
      I1 => gtwiz_reset_rx_pll_and_datapath_dly,
      I2 => sm_reset_rx_timer_sat_reg,
      I3 => \out\(1),
      I4 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      I5 => \out\(0),
      O => D(0)
    );
\FSM_sequential_sm_reset_rx[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF8F8F000F"
    )
        port map (
      I0 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      I1 => sm_reset_rx_timer_sat_reg,
      I2 => \out\(2),
      I3 => gtwiz_reset_rx_pll_and_datapath_dly,
      I4 => \out\(1),
      I5 => \out\(0),
      O => D(1)
    );
\FSM_sequential_sm_reset_rx[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000000E"
    )
        port map (
      I0 => gtwiz_reset_rx_pll_and_datapath_dly,
      I1 => gtwiz_reset_rx_datapath_dly,
      I2 => \out\(2),
      I3 => \out\(1),
      I4 => \out\(0),
      I5 => \FSM_sequential_sm_reset_rx_reg[0]_0\,
      O => \FSM_sequential_sm_reset_rx_reg[0]\
    );
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => in0,
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => gtwiz_reset_rx_pll_and_datapath_dly,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_6 is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    in0 : in STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_sm_reset_tx_reg[1]\ : in STD_LOGIC;
    gtwiz_reset_tx_pll_and_datapath_dly : in STD_LOGIC;
    i_in_out_reg_0 : in STD_LOGIC;
    i_in_out_reg_1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_6 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_6;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_6 is
  signal gtwiz_reset_tx_datapath_dly : STD_LOGIC;
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
\FSM_sequential_sm_reset_tx[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF1110"
    )
        port map (
      I0 => \out\(0),
      I1 => \FSM_sequential_sm_reset_tx_reg[1]\,
      I2 => gtwiz_reset_tx_datapath_dly,
      I3 => gtwiz_reset_tx_pll_and_datapath_dly,
      I4 => i_in_out_reg_0,
      I5 => i_in_out_reg_1,
      O => E(0)
    );
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => in0,
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => gtwiz_reset_tx_datapath_dly,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_7 is
  port (
    gtwiz_reset_tx_pll_and_datapath_dly : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    in0 : in STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_7 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_7;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_7 is
  signal \^gtwiz_reset_tx_pll_and_datapath_dly\ : STD_LOGIC;
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_sm_reset_tx[0]_i_1\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \FSM_sequential_sm_reset_tx[1]_i_1\ : label is "soft_lutpair100";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
  gtwiz_reset_tx_pll_and_datapath_dly <= \^gtwiz_reset_tx_pll_and_datapath_dly\;
\FSM_sequential_sm_reset_tx[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1F1E"
    )
        port map (
      I0 => \out\(1),
      I1 => \out\(2),
      I2 => \out\(0),
      I3 => \^gtwiz_reset_tx_pll_and_datapath_dly\,
      O => D(0)
    );
\FSM_sequential_sm_reset_tx[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FF1"
    )
        port map (
      I0 => \out\(2),
      I1 => \^gtwiz_reset_tx_pll_and_datapath_dly\,
      I2 => \out\(1),
      I3 => \out\(0),
      O => D(1)
    );
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => in0,
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => \^gtwiz_reset_tx_pll_and_datapath_dly\,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_8 is
  port (
    sm_reset_rx_timer_clr_reg : out STD_LOGIC;
    rxuserrdy_out_reg : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_sm_reset_rx_reg[1]\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    sm_reset_rx_timer_clr_reg_0 : in STD_LOGIC;
    gtwiz_reset_rx_any_sync : in STD_LOGIC;
    \gen_gtwizard_gthe3.rxuserrdy_int\ : in STD_LOGIC;
    \FSM_sequential_sm_reset_rx_reg[1]_0\ : in STD_LOGIC;
    i_in_out_reg_0 : in STD_LOGIC;
    sm_reset_rx_pll_timer_clr_reg : in STD_LOGIC;
    sm_reset_rx_pll_timer_sat : in STD_LOGIC;
    sm_reset_rx_timer_sat : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_8 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_8;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_8 is
  signal \FSM_sequential_sm_reset_rx[2]_i_3_n_0\ : STD_LOGIC;
  signal gtwiz_reset_userclk_rx_active_sync : STD_LOGIC;
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  signal sm_reset_rx_timer_clr_i_2_n_0 : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
\FSM_sequential_sm_reset_rx[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \FSM_sequential_sm_reset_rx[2]_i_3_n_0\,
      I1 => \FSM_sequential_sm_reset_rx_reg[1]_0\,
      I2 => i_in_out_reg_0,
      O => E(0)
    );
\FSM_sequential_sm_reset_rx[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2023202000000000"
    )
        port map (
      I0 => sm_reset_rx_timer_clr_i_2_n_0,
      I1 => \out\(1),
      I2 => \out\(2),
      I3 => sm_reset_rx_pll_timer_clr_reg,
      I4 => sm_reset_rx_pll_timer_sat,
      I5 => \out\(0),
      O => \FSM_sequential_sm_reset_rx[2]_i_3_n_0\
    );
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => gtwiz_userclk_rx_active_in(0),
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => gtwiz_reset_userclk_rx_active_sync,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
rxuserrdy_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFAAF00000800"
    )
        port map (
      I0 => \out\(2),
      I1 => sm_reset_rx_timer_clr_i_2_n_0,
      I2 => \out\(1),
      I3 => \out\(0),
      I4 => gtwiz_reset_rx_any_sync,
      I5 => \gen_gtwizard_gthe3.rxuserrdy_int\,
      O => rxuserrdy_out_reg
    );
sm_reset_rx_timer_clr_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCCCEFFE0CCCE00E"
    )
        port map (
      I0 => sm_reset_rx_timer_clr_i_2_n_0,
      I1 => \FSM_sequential_sm_reset_rx_reg[1]\,
      I2 => \out\(0),
      I3 => \out\(2),
      I4 => \out\(1),
      I5 => sm_reset_rx_timer_clr_reg_0,
      O => sm_reset_rx_timer_clr_reg
    );
sm_reset_rx_timer_clr_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => sm_reset_rx_timer_clr_reg_0,
      I1 => sm_reset_rx_timer_sat,
      I2 => gtwiz_reset_userclk_rx_active_sync,
      O => sm_reset_rx_timer_clr_i_2_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_9 is
  port (
    gtwiz_reset_userclk_tx_active_sync : out STD_LOGIC;
    sm_reset_tx_timer_clr_reg : out STD_LOGIC;
    \FSM_sequential_sm_reset_tx_reg[0]\ : out STD_LOGIC;
    gtwiz_userclk_tx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    sm_reset_tx_timer_clr_reg_0 : in STD_LOGIC;
    \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\ : in STD_LOGIC;
    sm_reset_tx_timer_sat_reg : in STD_LOGIC;
    plllock_tx_sync : in STD_LOGIC;
    \FSM_sequential_sm_reset_tx_reg[1]\ : in STD_LOGIC;
    \FSM_sequential_sm_reset_tx_reg[1]_0\ : in STD_LOGIC;
    sm_reset_tx_pll_timer_clr_reg : in STD_LOGIC;
    sm_reset_tx_pll_timer_sat : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_9 : entity is "gtwizard_ultrascale_v1_7_4_bit_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_9;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_9 is
  signal \^gtwiz_reset_userclk_tx_active_sync\ : STD_LOGIC;
  signal i_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of i_in_meta : signal is "true";
  signal i_in_sync1 : STD_LOGIC;
  attribute async_reg of i_in_sync1 : signal is "true";
  signal i_in_sync2 : STD_LOGIC;
  attribute async_reg of i_in_sync2 : signal is "true";
  signal i_in_sync3 : STD_LOGIC;
  attribute async_reg of i_in_sync3 : signal is "true";
  signal sm_reset_tx_timer_clr_i_2_n_0 : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of i_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of i_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync1_reg : label is std.standard.true;
  attribute KEEP of i_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync2_reg : label is std.standard.true;
  attribute KEEP of i_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of i_in_sync3_reg : label is std.standard.true;
  attribute KEEP of i_in_sync3_reg : label is "yes";
begin
  gtwiz_reset_userclk_tx_active_sync <= \^gtwiz_reset_userclk_tx_active_sync\;
\FSM_sequential_sm_reset_tx[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F000088888888"
    )
        port map (
      I0 => \FSM_sequential_sm_reset_tx_reg[1]\,
      I1 => \^gtwiz_reset_userclk_tx_active_sync\,
      I2 => \FSM_sequential_sm_reset_tx_reg[1]_0\,
      I3 => sm_reset_tx_pll_timer_clr_reg,
      I4 => sm_reset_tx_pll_timer_sat,
      I5 => \out\(0),
      O => \FSM_sequential_sm_reset_tx_reg[0]\
    );
i_in_meta_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => gtwiz_userclk_tx_active_in(0),
      Q => i_in_meta,
      R => '0'
    );
i_in_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync3,
      Q => \^gtwiz_reset_userclk_tx_active_sync\,
      R => '0'
    );
i_in_sync1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_meta,
      Q => i_in_sync1,
      R => '0'
    );
i_in_sync2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync1,
      Q => i_in_sync2,
      R => '0'
    );
i_in_sync3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => i_in_sync2,
      Q => i_in_sync3,
      R => '0'
    );
sm_reset_tx_timer_clr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EBEB282B"
    )
        port map (
      I0 => sm_reset_tx_timer_clr_i_2_n_0,
      I1 => \out\(2),
      I2 => \out\(1),
      I3 => \out\(0),
      I4 => sm_reset_tx_timer_clr_reg_0,
      O => sm_reset_tx_timer_clr_reg
    );
sm_reset_tx_timer_clr_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0C0A0C0F0F000F0"
    )
        port map (
      I0 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\,
      I1 => \^gtwiz_reset_userclk_tx_active_sync\,
      I2 => sm_reset_tx_timer_sat_reg,
      I3 => \out\(0),
      I4 => plllock_tx_sync,
      I5 => \out\(2),
      O => sm_reset_tx_timer_clr_i_2_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_gthe3_channel is
  port (
    cpllfbclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    cplllock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    cpllrefclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    drprdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    eyescandataerror_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtpowergood_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclkmonitor_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcierategen3_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcierateidle_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pciesynctxsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieusergen3rdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserphystatusrst_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserratestart_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    phystatus_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    resetexception_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbyteisaligned_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbyterealign_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrlock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrphdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanbondseq_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanisaligned_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanrealign_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcominitdet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcommadet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcomsasdet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcomwakedet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlysresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxelecidle_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstarted_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobestarted_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclkfabric_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclkpcs_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxphaligndone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalignerr_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbserr_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbslocked_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprgdivresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxqpisenn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxqpisenp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxratedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxrecclkout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsliderdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipoutclkrdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslippmardy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxvalid_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txcomfinish_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txdlysresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclkfabric_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclkpcs_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txphaligndone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txphinitdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txprgdivresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txqpisenn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txqpisenp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txratedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcsrsvdout_out : out STD_LOGIC_VECTOR ( 11 downto 0 );
    rxdata_out : out STD_LOGIC_VECTOR ( 127 downto 0 );
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rxctrl0_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rxctrl1_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dmonitorout_out : out STD_LOGIC_VECTOR ( 16 downto 0 );
    pcierateqpllpd_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    pcierateqpllreset_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxclkcorcnt_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxdatavalid_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxheadervalid_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxstartofseq_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    bufgtce_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtcemask_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtreset_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtrstmask_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxchbondo_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rxheader_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    pinrsrvdas_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxctrl2_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxctrl3_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxdataextendrsvd_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    bufgtdiv_out : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rst_in0 : out STD_LOGIC;
    cfgreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    clkrsvd0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    clkrsvd1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cplllockdetclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cplllocken_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.cpllpd_ch_int\ : in STD_LOGIC;
    cpllreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    dmonfiforeset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    dmonitorclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpwe_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphicaldone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphicalstart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphidrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphidwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphixrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphixwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescanmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescanreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescantrigger_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtgrefclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxn_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxp_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtresetsel_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.gtrxreset_int\ : in STD_LOGIC;
    gtsouthrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.gttxreset_int\ : in STD_LOGIC;
    lpbkrxtxseren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    lpbktxrxseren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcieeqrxeqadaptdone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcierstidle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pciersttxsyncstart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserratedone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0clk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0refclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1clk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1refclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    resetovrd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rstclkentx_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rx8b10ben_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxbufreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrfreqreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrresetrsv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbonden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbondmaster_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbondslave_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcommadeten_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeagchold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeagcovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelfovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelpmreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap10hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap10ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap11hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap11ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap12hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap12ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap13hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap13ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap14hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap14ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap15hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap15ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap2hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap2ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap3hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap3ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap4hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap4ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap5hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap5ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap6hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap6ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap7hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap7ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap8hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap8ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap9hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap9ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeuthold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeutovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevphold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevpovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevsen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfexyden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlybypass_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlyen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlyovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlysreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxgearboxslip_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlatclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmgchold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmgcovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmhfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmhfovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmlfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmlfklovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmoshold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmosovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxmcommaalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoobreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoscalreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoshold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinten_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinthold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobe_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinttestovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpcommaalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpcsreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalign_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphdlypd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphdlyreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpmareset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpolarity_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbscntreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.rxprogdivreset_int\ : in STD_LOGIC;
    rxqpien_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxratemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslide_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipoutclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslippma_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncallin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.rxuserrdy_int\ : in STD_LOGIC;
    rxusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sigvalidclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx8b10ben_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcominit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcomsas_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcomwake_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdeemph_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdetectrx_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdiffpd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlybypass_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlysreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyupdown_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txelecidle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txinhibit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txlatclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpcsreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpdelecidlemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphalign_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlypd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlyreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlytstclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphinit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmpd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmsel_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpisopd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpmareset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpolarity_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpostcursorinv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txprbsforceerr_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txprecursorinv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.txprogdivreset_int\ : in STD_LOGIC;
    txqpibiasen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txqpistrongpdown_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txqpiweakpup_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txratemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txswing_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncallin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.txuserrdy_int\ : in STD_LOGIC;
    txusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userdata_tx_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gtrsvd_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    pcsrsvdin_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txctrl0_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txctrl1_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rxdfeagcctrl_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxelecidlemode_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxpllclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxsysclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txpllclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txsysclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cpllrefclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxchbondlevel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxoutclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txbufdiffctrl_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txmargin_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txoutclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxosintcfg_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxprbssel_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    txprbssel_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pcsrsvdin2_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    pmarsvdin_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    rxchbondi_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txpippmstepsize_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txheader_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    txmaincursor_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    txsequence_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    tx8b10bbypass_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txctrl2_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txdataextendrsvd_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_gthe3_channel : entity is "gtwizard_ultrascale_v1_7_4_gthe3_channel";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_gthe3_channel;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_gthe3_channel is
  signal \^cplllock_out\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \gthe3_channel_gen.gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST\ : label is "PRIMITIVE";
begin
  cplllock_out(0) <= \^cplllock_out\(0);
\gthe3_channel_gen.gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST\: unisim.vcomponents.GTHE3_CHANNEL
    generic map(
      ACJTAG_DEBUG_MODE => '0',
      ACJTAG_MODE => '0',
      ACJTAG_RESET => '0',
      ADAPT_CFG0 => X"F800",
      ADAPT_CFG1 => X"0000",
      ALIGN_COMMA_DOUBLE => "FALSE",
      ALIGN_COMMA_ENABLE => B"1111111111",
      ALIGN_COMMA_WORD => 2,
      ALIGN_MCOMMA_DET => "TRUE",
      ALIGN_MCOMMA_VALUE => B"1010000011",
      ALIGN_PCOMMA_DET => "TRUE",
      ALIGN_PCOMMA_VALUE => B"0101111100",
      A_RXOSCALRESET => '0',
      A_RXPROGDIVRESET => '0',
      A_TXPROGDIVRESET => '0',
      CBCC_DATA_SOURCE_SEL => "DECODED",
      CDR_SWAP_MODE_EN => '0',
      CHAN_BOND_KEEP_ALIGN => "FALSE",
      CHAN_BOND_MAX_SKEW => 1,
      CHAN_BOND_SEQ_1_1 => B"0000000000",
      CHAN_BOND_SEQ_1_2 => B"0000000000",
      CHAN_BOND_SEQ_1_3 => B"0000000000",
      CHAN_BOND_SEQ_1_4 => B"0000000000",
      CHAN_BOND_SEQ_1_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_1 => B"0000000000",
      CHAN_BOND_SEQ_2_2 => B"0000000000",
      CHAN_BOND_SEQ_2_3 => B"0000000000",
      CHAN_BOND_SEQ_2_4 => B"0000000000",
      CHAN_BOND_SEQ_2_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_USE => "FALSE",
      CHAN_BOND_SEQ_LEN => 1,
      CLK_CORRECT_USE => "TRUE",
      CLK_COR_KEEP_IDLE => "FALSE",
      CLK_COR_MAX_LAT => 31,
      CLK_COR_MIN_LAT => 24,
      CLK_COR_PRECEDENCE => "TRUE",
      CLK_COR_REPEAT_WAIT => 0,
      CLK_COR_SEQ_1_1 => B"0111110111",
      CLK_COR_SEQ_1_2 => B"0111110111",
      CLK_COR_SEQ_1_3 => B"0111110111",
      CLK_COR_SEQ_1_4 => B"0111110111",
      CLK_COR_SEQ_1_ENABLE => B"1111",
      CLK_COR_SEQ_2_1 => B"0000000000",
      CLK_COR_SEQ_2_2 => B"0000000000",
      CLK_COR_SEQ_2_3 => B"0000000000",
      CLK_COR_SEQ_2_4 => B"0000000000",
      CLK_COR_SEQ_2_ENABLE => B"1111",
      CLK_COR_SEQ_2_USE => "FALSE",
      CLK_COR_SEQ_LEN => 4,
      CPLL_CFG0 => X"21F8",
      CPLL_CFG1 => X"A4AC",
      CPLL_CFG2 => X"0004",
      CPLL_CFG3 => B"00" & X"0",
      CPLL_FBDIV => 4,
      CPLL_FBDIV_45 => 4,
      CPLL_INIT_CFG0 => X"02B2",
      CPLL_INIT_CFG1 => X"00",
      CPLL_LOCK_CFG => X"01E8",
      CPLL_REFCLK_DIV => 1,
      DDI_CTRL => B"00",
      DDI_REALIGN_WAIT => 15,
      DEC_MCOMMA_DETECT => "TRUE",
      DEC_PCOMMA_DETECT => "TRUE",
      DEC_VALID_COMMA_ONLY => "FALSE",
      DFE_D_X_REL_POS => '0',
      DFE_VCM_COMP_EN => '0',
      DMONITOR_CFG0 => B"00" & X"00",
      DMONITOR_CFG1 => X"00",
      ES_CLK_PHASE_SEL => '0',
      ES_CONTROL => B"000000",
      ES_ERRDET_EN => "FALSE",
      ES_EYE_SCAN_EN => "FALSE",
      ES_HORZ_OFFSET => X"000",
      ES_PMA_CFG => B"0000000000",
      ES_PRESCALE => B"00000",
      ES_QUALIFIER0 => X"0000",
      ES_QUALIFIER1 => X"0000",
      ES_QUALIFIER2 => X"0000",
      ES_QUALIFIER3 => X"0000",
      ES_QUALIFIER4 => X"0000",
      ES_QUAL_MASK0 => X"0000",
      ES_QUAL_MASK1 => X"0000",
      ES_QUAL_MASK2 => X"0000",
      ES_QUAL_MASK3 => X"0000",
      ES_QUAL_MASK4 => X"0000",
      ES_SDATA_MASK0 => X"0000",
      ES_SDATA_MASK1 => X"0000",
      ES_SDATA_MASK2 => X"0000",
      ES_SDATA_MASK3 => X"0000",
      ES_SDATA_MASK4 => X"0000",
      EVODD_PHI_CFG => B"00000000000",
      EYE_SCAN_SWAP_EN => '0',
      FTS_DESKEW_SEQ_ENABLE => B"1111",
      FTS_LANE_DESKEW_CFG => B"1111",
      FTS_LANE_DESKEW_EN => "FALSE",
      GEARBOX_MODE => B"00000",
      GM_BIAS_SELECT => '0',
      LOCAL_MASTER => '1',
      OOBDIVCTL => B"00",
      OOB_PWRUP => '0',
      PCI3_AUTO_REALIGN => "OVR_1K_BLK",
      PCI3_PIPE_RX_ELECIDLE => '0',
      PCI3_RX_ASYNC_EBUF_BYPASS => B"00",
      PCI3_RX_ELECIDLE_EI2_ENABLE => '0',
      PCI3_RX_ELECIDLE_H2L_COUNT => B"000000",
      PCI3_RX_ELECIDLE_H2L_DISABLE => B"000",
      PCI3_RX_ELECIDLE_HI_COUNT => B"000000",
      PCI3_RX_ELECIDLE_LP4_DISABLE => '0',
      PCI3_RX_FIFO_DISABLE => '0',
      PCIE_BUFG_DIV_CTRL => X"1000",
      PCIE_RXPCS_CFG_GEN3 => X"02A4",
      PCIE_RXPMA_CFG => X"000A",
      PCIE_TXPCS_CFG_GEN3 => X"2CA4",
      PCIE_TXPMA_CFG => X"000A",
      PCS_PCIE_EN => "FALSE",
      PCS_RSVD0 => B"0000000000000000",
      PCS_RSVD1 => B"000",
      PD_TRANS_TIME_FROM_P2 => X"03C",
      PD_TRANS_TIME_NONE_P2 => X"19",
      PD_TRANS_TIME_TO_P2 => X"64",
      PLL_SEL_MODE_GEN12 => B"00",
      PLL_SEL_MODE_GEN3 => B"11",
      PMA_RSV1 => X"E000",
      PROCESS_PAR => B"010",
      RATE_SW_USE_DRP => '1',
      RESET_POWERSAVE_DISABLE => '0',
      RXBUFRESET_TIME => B"00011",
      RXBUF_ADDR_MODE => "FULL",
      RXBUF_EIDLE_HI_CNT => B"1000",
      RXBUF_EIDLE_LO_CNT => B"0000",
      RXBUF_EN => "TRUE",
      RXBUF_RESET_ON_CB_CHANGE => "TRUE",
      RXBUF_RESET_ON_COMMAALIGN => "FALSE",
      RXBUF_RESET_ON_EIDLE => "FALSE",
      RXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      RXBUF_THRESH_OVFLW => 0,
      RXBUF_THRESH_OVRD => "FALSE",
      RXBUF_THRESH_UNDFLW => 0,
      RXCDRFREQRESET_TIME => B"00001",
      RXCDRPHRESET_TIME => B"00001",
      RXCDR_CFG0 => X"0000",
      RXCDR_CFG0_GEN3 => X"0000",
      RXCDR_CFG1 => X"0000",
      RXCDR_CFG1_GEN3 => X"0000",
      RXCDR_CFG2 => X"0766",
      RXCDR_CFG2_GEN3 => X"07E6",
      RXCDR_CFG3 => X"0000",
      RXCDR_CFG3_GEN3 => X"0000",
      RXCDR_CFG4 => X"0000",
      RXCDR_CFG4_GEN3 => X"0000",
      RXCDR_CFG5 => X"0000",
      RXCDR_CFG5_GEN3 => X"0000",
      RXCDR_FR_RESET_ON_EIDLE => '0',
      RXCDR_HOLD_DURING_EIDLE => '0',
      RXCDR_LOCK_CFG0 => X"4480",
      RXCDR_LOCK_CFG1 => X"5FFF",
      RXCDR_LOCK_CFG2 => X"77C3",
      RXCDR_PH_RESET_ON_EIDLE => '0',
      RXCFOK_CFG0 => X"4000",
      RXCFOK_CFG1 => X"0065",
      RXCFOK_CFG2 => X"002E",
      RXDFELPMRESET_TIME => B"0001111",
      RXDFELPM_KL_CFG0 => X"0000",
      RXDFELPM_KL_CFG1 => X"0032",
      RXDFELPM_KL_CFG2 => X"0000",
      RXDFE_CFG0 => X"0A00",
      RXDFE_CFG1 => X"0000",
      RXDFE_GC_CFG0 => X"0000",
      RXDFE_GC_CFG1 => X"7870",
      RXDFE_GC_CFG2 => X"0000",
      RXDFE_H2_CFG0 => X"0000",
      RXDFE_H2_CFG1 => X"0000",
      RXDFE_H3_CFG0 => X"4000",
      RXDFE_H3_CFG1 => X"0000",
      RXDFE_H4_CFG0 => X"2000",
      RXDFE_H4_CFG1 => X"0003",
      RXDFE_H5_CFG0 => X"2000",
      RXDFE_H5_CFG1 => X"0003",
      RXDFE_H6_CFG0 => X"2000",
      RXDFE_H6_CFG1 => X"0000",
      RXDFE_H7_CFG0 => X"2000",
      RXDFE_H7_CFG1 => X"0000",
      RXDFE_H8_CFG0 => X"2000",
      RXDFE_H8_CFG1 => X"0000",
      RXDFE_H9_CFG0 => X"2000",
      RXDFE_H9_CFG1 => X"0000",
      RXDFE_HA_CFG0 => X"2000",
      RXDFE_HA_CFG1 => X"0000",
      RXDFE_HB_CFG0 => X"2000",
      RXDFE_HB_CFG1 => X"0000",
      RXDFE_HC_CFG0 => X"0000",
      RXDFE_HC_CFG1 => X"0000",
      RXDFE_HD_CFG0 => X"0000",
      RXDFE_HD_CFG1 => X"0000",
      RXDFE_HE_CFG0 => X"0000",
      RXDFE_HE_CFG1 => X"0000",
      RXDFE_HF_CFG0 => X"0000",
      RXDFE_HF_CFG1 => X"0000",
      RXDFE_OS_CFG0 => X"8000",
      RXDFE_OS_CFG1 => X"0000",
      RXDFE_UT_CFG0 => X"8000",
      RXDFE_UT_CFG1 => X"0003",
      RXDFE_VP_CFG0 => X"AA00",
      RXDFE_VP_CFG1 => X"0033",
      RXDLY_CFG => X"001F",
      RXDLY_LCFG => X"0030",
      RXELECIDLE_CFG => "Sigcfg_4",
      RXGBOX_FIFO_INIT_RD_ADDR => 4,
      RXGEARBOX_EN => "FALSE",
      RXISCANRESET_TIME => B"00001",
      RXLPM_CFG => X"0000",
      RXLPM_GC_CFG => X"1000",
      RXLPM_KH_CFG0 => X"0000",
      RXLPM_KH_CFG1 => X"0002",
      RXLPM_OS_CFG0 => X"8000",
      RXLPM_OS_CFG1 => X"0002",
      RXOOB_CFG => B"000000110",
      RXOOB_CLK_CFG => "PMA",
      RXOSCALRESET_TIME => B"00011",
      RXOUT_DIV => 1,
      RXPCSRESET_TIME => B"00011",
      RXPHBEACON_CFG => X"0000",
      RXPHDLY_CFG => X"2020",
      RXPHSAMP_CFG => X"2100",
      RXPHSLIP_CFG => X"6622",
      RXPH_MONITOR_SEL => B"00000",
      RXPI_CFG0 => B"01",
      RXPI_CFG1 => B"01",
      RXPI_CFG2 => B"01",
      RXPI_CFG3 => B"01",
      RXPI_CFG4 => '1',
      RXPI_CFG5 => '1',
      RXPI_CFG6 => B"011",
      RXPI_LPM => '0',
      RXPI_VREFSEL => '0',
      RXPMACLK_SEL => "DATA",
      RXPMARESET_TIME => B"00011",
      RXPRBS_ERR_LOOPBACK => '0',
      RXPRBS_LINKACQ_CNT => 15,
      RXSLIDE_AUTO_WAIT => 7,
      RXSLIDE_MODE => "OFF",
      RXSYNC_MULTILANE => '0',
      RXSYNC_OVRD => '0',
      RXSYNC_SKIP_DA => '0',
      RX_AFE_CM_EN => '0',
      RX_BIAS_CFG0 => X"0AB4",
      RX_BUFFER_CFG => B"000000",
      RX_CAPFF_SARC_ENB => '0',
      RX_CLK25_DIV => 8,
      RX_CLKMUX_EN => '1',
      RX_CLK_SLIP_OVRD => B"00000",
      RX_CM_BUF_CFG => B"1010",
      RX_CM_BUF_PD => '0',
      RX_CM_SEL => B"11",
      RX_CM_TRIM => B"1010",
      RX_CTLE3_LPF => B"00000001",
      RX_DATA_WIDTH => 40,
      RX_DDI_SEL => B"000000",
      RX_DEFER_RESET_BUF_EN => "TRUE",
      RX_DFELPM_CFG0 => B"0110",
      RX_DFELPM_CFG1 => '1',
      RX_DFELPM_KLKH_AGC_STUP_EN => '1',
      RX_DFE_AGC_CFG0 => B"10",
      RX_DFE_AGC_CFG1 => B"000",
      RX_DFE_KL_LPM_KH_CFG0 => B"01",
      RX_DFE_KL_LPM_KH_CFG1 => B"000",
      RX_DFE_KL_LPM_KL_CFG0 => B"01",
      RX_DFE_KL_LPM_KL_CFG1 => B"000",
      RX_DFE_LPM_HOLD_DURING_EIDLE => '0',
      RX_DISPERR_SEQ_MATCH => "TRUE",
      RX_DIVRESET_TIME => B"00001",
      RX_EN_HI_LR => '0',
      RX_EYESCAN_VS_CODE => B"0000000",
      RX_EYESCAN_VS_NEG_DIR => '0',
      RX_EYESCAN_VS_RANGE => B"00",
      RX_EYESCAN_VS_UT_SIGN => '0',
      RX_FABINT_USRCLK_FLOP => '0',
      RX_INT_DATAWIDTH => 1,
      RX_PMA_POWER_SAVE => '0',
      RX_PROGDIV_CFG => 0.000000,
      RX_SAMPLE_PERIOD => B"111",
      RX_SIG_VALID_DLY => 11,
      RX_SUM_DFETAPREP_EN => '0',
      RX_SUM_IREF_TUNE => B"1100",
      RX_SUM_RES_CTRL => B"11",
      RX_SUM_VCMTUNE => B"0000",
      RX_SUM_VCM_OVWR => '0',
      RX_SUM_VREF_TUNE => B"000",
      RX_TUNE_AFE_OS => B"10",
      RX_WIDEMODE_CDR => '0',
      RX_XCLK_SEL => "RXDES",
      SAS_MAX_COM => 64,
      SAS_MIN_COM => 36,
      SATA_BURST_SEQ_LEN => B"1110",
      SATA_BURST_VAL => B"100",
      SATA_CPLL_CFG => "VCO_3000MHZ",
      SATA_EIDLE_VAL => B"100",
      SATA_MAX_BURST => 8,
      SATA_MAX_INIT => 21,
      SATA_MAX_WAKE => 7,
      SATA_MIN_BURST => 4,
      SATA_MIN_INIT => 12,
      SATA_MIN_WAKE => 4,
      SHOW_REALIGN_COMMA => "TRUE",
      SIM_MODE => "FAST",
      SIM_RECEIVER_DETECT_PASS => "TRUE",
      SIM_RESET_SPEEDUP => "TRUE",
      SIM_TX_EIDLE_DRIVE_LEVEL => '0',
      SIM_VERSION => 2,
      TAPDLY_SET_TX => B"00",
      TEMPERATUR_PAR => B"0010",
      TERM_RCAL_CFG => B"100001000010000",
      TERM_RCAL_OVRD => B"000",
      TRANS_TIME_RATE => X"0E",
      TST_RSV0 => X"00",
      TST_RSV1 => X"00",
      TXBUF_EN => "TRUE",
      TXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      TXDLY_CFG => X"0009",
      TXDLY_LCFG => X"0050",
      TXDRVBIAS_N => B"1010",
      TXDRVBIAS_P => B"1010",
      TXFIFO_ADDR_CFG => "LOW",
      TXGBOX_FIFO_INIT_RD_ADDR => 4,
      TXGEARBOX_EN => "FALSE",
      TXOUT_DIV => 1,
      TXPCSRESET_TIME => B"00011",
      TXPHDLY_CFG0 => X"2020",
      TXPHDLY_CFG1 => X"0075",
      TXPH_CFG => X"0980",
      TXPH_MONITOR_SEL => B"00000",
      TXPI_CFG0 => B"01",
      TXPI_CFG1 => B"01",
      TXPI_CFG2 => B"01",
      TXPI_CFG3 => '1',
      TXPI_CFG4 => '1',
      TXPI_CFG5 => B"011",
      TXPI_GRAY_SEL => '0',
      TXPI_INVSTROBE_SEL => '0',
      TXPI_LPM => '0',
      TXPI_PPMCLK_SEL => "TXUSRCLK2",
      TXPI_PPM_CFG => B"00000000",
      TXPI_SYNFREQ_PPM => B"001",
      TXPI_VREFSEL => '0',
      TXPMARESET_TIME => B"00011",
      TXSYNC_MULTILANE => '0',
      TXSYNC_OVRD => '0',
      TXSYNC_SKIP_DA => '0',
      TX_CLK25_DIV => 8,
      TX_CLKMUX_EN => '1',
      TX_DATA_WIDTH => 40,
      TX_DCD_CFG => B"000010",
      TX_DCD_EN => '0',
      TX_DEEMPH0 => B"000000",
      TX_DEEMPH1 => B"000000",
      TX_DIVRESET_TIME => B"00001",
      TX_DRIVE_MODE => "DIRECT",
      TX_EIDLE_ASSERT_DELAY => B"100",
      TX_EIDLE_DEASSERT_DELAY => B"011",
      TX_EML_PHI_TUNE => '0',
      TX_FABINT_USRCLK_FLOP => '0',
      TX_IDLE_DATA_ZERO => '0',
      TX_INT_DATAWIDTH => 1,
      TX_LOOPBACK_DRIVE_HIZ => "FALSE",
      TX_MAINCURSOR_SEL => '0',
      TX_MARGIN_FULL_0 => B"1001111",
      TX_MARGIN_FULL_1 => B"1001110",
      TX_MARGIN_FULL_2 => B"1001100",
      TX_MARGIN_FULL_3 => B"1001010",
      TX_MARGIN_FULL_4 => B"1001000",
      TX_MARGIN_LOW_0 => B"1000110",
      TX_MARGIN_LOW_1 => B"1000101",
      TX_MARGIN_LOW_2 => B"1000011",
      TX_MARGIN_LOW_3 => B"1000010",
      TX_MARGIN_LOW_4 => B"1000000",
      TX_MODE_SEL => B"000",
      TX_PMADATA_OPT => '0',
      TX_PMA_POWER_SAVE => '0',
      TX_PROGCLK_SEL => "PREPI",
      TX_PROGDIV_CFG => 0.000000,
      TX_QPI_STATUS_EN => '0',
      TX_RXDETECT_CFG => B"00" & X"032",
      TX_RXDETECT_REF => B"100",
      TX_SAMPLE_PERIOD => B"111",
      TX_SARC_LPBK_ENB => '0',
      TX_XCLK_SEL => "TXOUT",
      USE_PCS_CLK_PHASE_SEL => '0',
      WB_MODE => B"00"
    )
        port map (
      BUFGTCE(2 downto 0) => bufgtce_out(2 downto 0),
      BUFGTCEMASK(2 downto 0) => bufgtcemask_out(2 downto 0),
      BUFGTDIV(8 downto 0) => bufgtdiv_out(8 downto 0),
      BUFGTRESET(2 downto 0) => bufgtreset_out(2 downto 0),
      BUFGTRSTMASK(2 downto 0) => bufgtrstmask_out(2 downto 0),
      CFGRESET => cfgreset_in(0),
      CLKRSVD0 => clkrsvd0_in(0),
      CLKRSVD1 => clkrsvd1_in(0),
      CPLLFBCLKLOST => cpllfbclklost_out(0),
      CPLLLOCK => \^cplllock_out\(0),
      CPLLLOCKDETCLK => cplllockdetclk_in(0),
      CPLLLOCKEN => cplllocken_in(0),
      CPLLPD => \gen_gtwizard_gthe3.cpllpd_ch_int\,
      CPLLREFCLKLOST => cpllrefclklost_out(0),
      CPLLREFCLKSEL(2 downto 0) => cpllrefclksel_in(2 downto 0),
      CPLLRESET => cpllreset_in(0),
      DMONFIFORESET => dmonfiforeset_in(0),
      DMONITORCLK => dmonitorclk_in(0),
      DMONITOROUT(16 downto 0) => dmonitorout_out(16 downto 0),
      DRPADDR(8 downto 0) => drpaddr_in(8 downto 0),
      DRPCLK => drpclk_in(0),
      DRPDI(15 downto 0) => drpdi_in(15 downto 0),
      DRPDO(15 downto 0) => drpdo_out(15 downto 0),
      DRPEN => drpen_in(0),
      DRPRDY => drprdy_out(0),
      DRPWE => drpwe_in(0),
      EVODDPHICALDONE => evoddphicaldone_in(0),
      EVODDPHICALSTART => evoddphicalstart_in(0),
      EVODDPHIDRDEN => evoddphidrden_in(0),
      EVODDPHIDWREN => evoddphidwren_in(0),
      EVODDPHIXRDEN => evoddphixrden_in(0),
      EVODDPHIXWREN => evoddphixwren_in(0),
      EYESCANDATAERROR => eyescandataerror_out(0),
      EYESCANMODE => eyescanmode_in(0),
      EYESCANRESET => eyescanreset_in(0),
      EYESCANTRIGGER => eyescantrigger_in(0),
      GTGREFCLK => gtgrefclk_in(0),
      GTHRXN => gthrxn_in(0),
      GTHRXP => gthrxp_in(0),
      GTHTXN => gthtxn_out(0),
      GTHTXP => gthtxp_out(0),
      GTNORTHREFCLK0 => gtnorthrefclk0_in(0),
      GTNORTHREFCLK1 => gtnorthrefclk1_in(0),
      GTPOWERGOOD => gtpowergood_out(0),
      GTREFCLK0 => gtrefclk0_in(0),
      GTREFCLK1 => gtrefclk1_in(0),
      GTREFCLKMONITOR => gtrefclkmonitor_out(0),
      GTRESETSEL => gtresetsel_in(0),
      GTRSVD(15 downto 0) => gtrsvd_in(15 downto 0),
      GTRXRESET => \gen_gtwizard_gthe3.gtrxreset_int\,
      GTSOUTHREFCLK0 => gtsouthrefclk0_in(0),
      GTSOUTHREFCLK1 => gtsouthrefclk1_in(0),
      GTTXRESET => \gen_gtwizard_gthe3.gttxreset_int\,
      LOOPBACK(2 downto 0) => loopback_in(2 downto 0),
      LPBKRXTXSEREN => lpbkrxtxseren_in(0),
      LPBKTXRXSEREN => lpbktxrxseren_in(0),
      PCIEEQRXEQADAPTDONE => pcieeqrxeqadaptdone_in(0),
      PCIERATEGEN3 => pcierategen3_out(0),
      PCIERATEIDLE => pcierateidle_out(0),
      PCIERATEQPLLPD(1 downto 0) => pcierateqpllpd_out(1 downto 0),
      PCIERATEQPLLRESET(1 downto 0) => pcierateqpllreset_out(1 downto 0),
      PCIERSTIDLE => pcierstidle_in(0),
      PCIERSTTXSYNCSTART => pciersttxsyncstart_in(0),
      PCIESYNCTXSYNCDONE => pciesynctxsyncdone_out(0),
      PCIEUSERGEN3RDY => pcieusergen3rdy_out(0),
      PCIEUSERPHYSTATUSRST => pcieuserphystatusrst_out(0),
      PCIEUSERRATEDONE => pcieuserratedone_in(0),
      PCIEUSERRATESTART => pcieuserratestart_out(0),
      PCSRSVDIN(15 downto 0) => pcsrsvdin_in(15 downto 0),
      PCSRSVDIN2(4 downto 0) => pcsrsvdin2_in(4 downto 0),
      PCSRSVDOUT(11 downto 0) => pcsrsvdout_out(11 downto 0),
      PHYSTATUS => phystatus_out(0),
      PINRSRVDAS(7 downto 0) => pinrsrvdas_out(7 downto 0),
      PMARSVDIN(4 downto 0) => pmarsvdin_in(4 downto 0),
      QPLL0CLK => qpll0clk_in(0),
      QPLL0REFCLK => qpll0refclk_in(0),
      QPLL1CLK => qpll1clk_in(0),
      QPLL1REFCLK => qpll1refclk_in(0),
      RESETEXCEPTION => resetexception_out(0),
      RESETOVRD => resetovrd_in(0),
      RSTCLKENTX => rstclkentx_in(0),
      RX8B10BEN => rx8b10ben_in(0),
      RXBUFRESET => rxbufreset_in(0),
      RXBUFSTATUS(2 downto 0) => rxbufstatus_out(2 downto 0),
      RXBYTEISALIGNED => rxbyteisaligned_out(0),
      RXBYTEREALIGN => rxbyterealign_out(0),
      RXCDRFREQRESET => rxcdrfreqreset_in(0),
      RXCDRHOLD => rxcdrhold_in(0),
      RXCDRLOCK => rxcdrlock_out(0),
      RXCDROVRDEN => rxcdrovrden_in(0),
      RXCDRPHDONE => rxcdrphdone_out(0),
      RXCDRRESET => rxcdrreset_in(0),
      RXCDRRESETRSV => rxcdrresetrsv_in(0),
      RXCHANBONDSEQ => rxchanbondseq_out(0),
      RXCHANISALIGNED => rxchanisaligned_out(0),
      RXCHANREALIGN => rxchanrealign_out(0),
      RXCHBONDEN => rxchbonden_in(0),
      RXCHBONDI(4 downto 0) => rxchbondi_in(4 downto 0),
      RXCHBONDLEVEL(2 downto 0) => rxchbondlevel_in(2 downto 0),
      RXCHBONDMASTER => rxchbondmaster_in(0),
      RXCHBONDO(4 downto 0) => rxchbondo_out(4 downto 0),
      RXCHBONDSLAVE => rxchbondslave_in(0),
      RXCLKCORCNT(1 downto 0) => rxclkcorcnt_out(1 downto 0),
      RXCOMINITDET => rxcominitdet_out(0),
      RXCOMMADET => rxcommadet_out(0),
      RXCOMMADETEN => rxcommadeten_in(0),
      RXCOMSASDET => rxcomsasdet_out(0),
      RXCOMWAKEDET => rxcomwakedet_out(0),
      RXCTRL0(15 downto 0) => rxctrl0_out(15 downto 0),
      RXCTRL1(15 downto 0) => rxctrl1_out(15 downto 0),
      RXCTRL2(7 downto 0) => rxctrl2_out(7 downto 0),
      RXCTRL3(7 downto 0) => rxctrl3_out(7 downto 0),
      RXDATA(127 downto 0) => rxdata_out(127 downto 0),
      RXDATAEXTENDRSVD(7 downto 0) => rxdataextendrsvd_out(7 downto 0),
      RXDATAVALID(1 downto 0) => rxdatavalid_out(1 downto 0),
      RXDFEAGCCTRL(1 downto 0) => rxdfeagcctrl_in(1 downto 0),
      RXDFEAGCHOLD => rxdfeagchold_in(0),
      RXDFEAGCOVRDEN => rxdfeagcovrden_in(0),
      RXDFELFHOLD => rxdfelfhold_in(0),
      RXDFELFOVRDEN => rxdfelfovrden_in(0),
      RXDFELPMRESET => rxdfelpmreset_in(0),
      RXDFETAP10HOLD => rxdfetap10hold_in(0),
      RXDFETAP10OVRDEN => rxdfetap10ovrden_in(0),
      RXDFETAP11HOLD => rxdfetap11hold_in(0),
      RXDFETAP11OVRDEN => rxdfetap11ovrden_in(0),
      RXDFETAP12HOLD => rxdfetap12hold_in(0),
      RXDFETAP12OVRDEN => rxdfetap12ovrden_in(0),
      RXDFETAP13HOLD => rxdfetap13hold_in(0),
      RXDFETAP13OVRDEN => rxdfetap13ovrden_in(0),
      RXDFETAP14HOLD => rxdfetap14hold_in(0),
      RXDFETAP14OVRDEN => rxdfetap14ovrden_in(0),
      RXDFETAP15HOLD => rxdfetap15hold_in(0),
      RXDFETAP15OVRDEN => rxdfetap15ovrden_in(0),
      RXDFETAP2HOLD => rxdfetap2hold_in(0),
      RXDFETAP2OVRDEN => rxdfetap2ovrden_in(0),
      RXDFETAP3HOLD => rxdfetap3hold_in(0),
      RXDFETAP3OVRDEN => rxdfetap3ovrden_in(0),
      RXDFETAP4HOLD => rxdfetap4hold_in(0),
      RXDFETAP4OVRDEN => rxdfetap4ovrden_in(0),
      RXDFETAP5HOLD => rxdfetap5hold_in(0),
      RXDFETAP5OVRDEN => rxdfetap5ovrden_in(0),
      RXDFETAP6HOLD => rxdfetap6hold_in(0),
      RXDFETAP6OVRDEN => rxdfetap6ovrden_in(0),
      RXDFETAP7HOLD => rxdfetap7hold_in(0),
      RXDFETAP7OVRDEN => rxdfetap7ovrden_in(0),
      RXDFETAP8HOLD => rxdfetap8hold_in(0),
      RXDFETAP8OVRDEN => rxdfetap8ovrden_in(0),
      RXDFETAP9HOLD => rxdfetap9hold_in(0),
      RXDFETAP9OVRDEN => rxdfetap9ovrden_in(0),
      RXDFEUTHOLD => rxdfeuthold_in(0),
      RXDFEUTOVRDEN => rxdfeutovrden_in(0),
      RXDFEVPHOLD => rxdfevphold_in(0),
      RXDFEVPOVRDEN => rxdfevpovrden_in(0),
      RXDFEVSEN => rxdfevsen_in(0),
      RXDFEXYDEN => rxdfexyden_in(0),
      RXDLYBYPASS => rxdlybypass_in(0),
      RXDLYEN => rxdlyen_in(0),
      RXDLYOVRDEN => rxdlyovrden_in(0),
      RXDLYSRESET => rxdlysreset_in(0),
      RXDLYSRESETDONE => rxdlysresetdone_out(0),
      RXELECIDLE => rxelecidle_out(0),
      RXELECIDLEMODE(1 downto 0) => rxelecidlemode_in(1 downto 0),
      RXGEARBOXSLIP => rxgearboxslip_in(0),
      RXHEADER(5 downto 0) => rxheader_out(5 downto 0),
      RXHEADERVALID(1 downto 0) => rxheadervalid_out(1 downto 0),
      RXLATCLK => rxlatclk_in(0),
      RXLPMEN => rxlpmen_in(0),
      RXLPMGCHOLD => rxlpmgchold_in(0),
      RXLPMGCOVRDEN => rxlpmgcovrden_in(0),
      RXLPMHFHOLD => rxlpmhfhold_in(0),
      RXLPMHFOVRDEN => rxlpmhfovrden_in(0),
      RXLPMLFHOLD => rxlpmlfhold_in(0),
      RXLPMLFKLOVRDEN => rxlpmlfklovrden_in(0),
      RXLPMOSHOLD => rxlpmoshold_in(0),
      RXLPMOSOVRDEN => rxlpmosovrden_in(0),
      RXMCOMMAALIGNEN => rxmcommaalignen_in(0),
      RXMONITOROUT(6 downto 0) => rxmonitorout_out(6 downto 0),
      RXMONITORSEL(1 downto 0) => rxmonitorsel_in(1 downto 0),
      RXOOBRESET => rxoobreset_in(0),
      RXOSCALRESET => rxoscalreset_in(0),
      RXOSHOLD => rxoshold_in(0),
      RXOSINTCFG(3 downto 0) => rxosintcfg_in(3 downto 0),
      RXOSINTDONE => rxosintdone_out(0),
      RXOSINTEN => rxosinten_in(0),
      RXOSINTHOLD => rxosinthold_in(0),
      RXOSINTOVRDEN => rxosintovrden_in(0),
      RXOSINTSTARTED => rxosintstarted_out(0),
      RXOSINTSTROBE => rxosintstrobe_in(0),
      RXOSINTSTROBEDONE => rxosintstrobedone_out(0),
      RXOSINTSTROBESTARTED => rxosintstrobestarted_out(0),
      RXOSINTTESTOVRDEN => rxosinttestovrden_in(0),
      RXOSOVRDEN => rxosovrden_in(0),
      RXOUTCLK => rxoutclk_out(0),
      RXOUTCLKFABRIC => rxoutclkfabric_out(0),
      RXOUTCLKPCS => rxoutclkpcs_out(0),
      RXOUTCLKSEL(2 downto 0) => rxoutclksel_in(2 downto 0),
      RXPCOMMAALIGNEN => rxpcommaalignen_in(0),
      RXPCSRESET => rxpcsreset_in(0),
      RXPD(1 downto 0) => rxpd_in(1 downto 0),
      RXPHALIGN => rxphalign_in(0),
      RXPHALIGNDONE => rxphaligndone_out(0),
      RXPHALIGNEN => rxphalignen_in(0),
      RXPHALIGNERR => rxphalignerr_out(0),
      RXPHDLYPD => rxphdlypd_in(0),
      RXPHDLYRESET => rxphdlyreset_in(0),
      RXPHOVRDEN => rxphovrden_in(0),
      RXPLLCLKSEL(1 downto 0) => rxpllclksel_in(1 downto 0),
      RXPMARESET => rxpmareset_in(0),
      RXPMARESETDONE => rxpmaresetdone_out(0),
      RXPOLARITY => rxpolarity_in(0),
      RXPRBSCNTRESET => rxprbscntreset_in(0),
      RXPRBSERR => rxprbserr_out(0),
      RXPRBSLOCKED => rxprbslocked_out(0),
      RXPRBSSEL(3 downto 0) => rxprbssel_in(3 downto 0),
      RXPRGDIVRESETDONE => rxprgdivresetdone_out(0),
      RXPROGDIVRESET => \gen_gtwizard_gthe3.rxprogdivreset_int\,
      RXQPIEN => rxqpien_in(0),
      RXQPISENN => rxqpisenn_out(0),
      RXQPISENP => rxqpisenp_out(0),
      RXRATE(2 downto 0) => rxrate_in(2 downto 0),
      RXRATEDONE => rxratedone_out(0),
      RXRATEMODE => rxratemode_in(0),
      RXRECCLKOUT => rxrecclkout_out(0),
      RXRESETDONE => rxresetdone_out(0),
      RXSLIDE => rxslide_in(0),
      RXSLIDERDY => rxsliderdy_out(0),
      RXSLIPDONE => rxslipdone_out(0),
      RXSLIPOUTCLK => rxslipoutclk_in(0),
      RXSLIPOUTCLKRDY => rxslipoutclkrdy_out(0),
      RXSLIPPMA => rxslippma_in(0),
      RXSLIPPMARDY => rxslippmardy_out(0),
      RXSTARTOFSEQ(1 downto 0) => rxstartofseq_out(1 downto 0),
      RXSTATUS(2 downto 0) => rxstatus_out(2 downto 0),
      RXSYNCALLIN => rxsyncallin_in(0),
      RXSYNCDONE => rxsyncdone_out(0),
      RXSYNCIN => rxsyncin_in(0),
      RXSYNCMODE => rxsyncmode_in(0),
      RXSYNCOUT => rxsyncout_out(0),
      RXSYSCLKSEL(1 downto 0) => rxsysclksel_in(1 downto 0),
      RXUSERRDY => \gen_gtwizard_gthe3.rxuserrdy_int\,
      RXUSRCLK => rxusrclk_in(0),
      RXUSRCLK2 => rxusrclk2_in(0),
      RXVALID => rxvalid_out(0),
      SIGVALIDCLK => sigvalidclk_in(0),
      TSTIN(19 downto 0) => B"00000000000000000000",
      TX8B10BBYPASS(7 downto 0) => tx8b10bbypass_in(7 downto 0),
      TX8B10BEN => tx8b10ben_in(0),
      TXBUFDIFFCTRL(2 downto 0) => txbufdiffctrl_in(2 downto 0),
      TXBUFSTATUS(1 downto 0) => txbufstatus_out(1 downto 0),
      TXCOMFINISH => txcomfinish_out(0),
      TXCOMINIT => txcominit_in(0),
      TXCOMSAS => txcomsas_in(0),
      TXCOMWAKE => txcomwake_in(0),
      TXCTRL0(15 downto 0) => txctrl0_in(15 downto 0),
      TXCTRL1(15 downto 0) => txctrl1_in(15 downto 0),
      TXCTRL2(7 downto 0) => txctrl2_in(7 downto 0),
      TXDATA(127 downto 32) => B"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      TXDATA(31 downto 0) => gtwiz_userdata_tx_in(31 downto 0),
      TXDATAEXTENDRSVD(7 downto 0) => txdataextendrsvd_in(7 downto 0),
      TXDEEMPH => txdeemph_in(0),
      TXDETECTRX => txdetectrx_in(0),
      TXDIFFCTRL(3 downto 0) => txdiffctrl_in(3 downto 0),
      TXDIFFPD => txdiffpd_in(0),
      TXDLYBYPASS => txdlybypass_in(0),
      TXDLYEN => txdlyen_in(0),
      TXDLYHOLD => txdlyhold_in(0),
      TXDLYOVRDEN => txdlyovrden_in(0),
      TXDLYSRESET => txdlysreset_in(0),
      TXDLYSRESETDONE => txdlysresetdone_out(0),
      TXDLYUPDOWN => txdlyupdown_in(0),
      TXELECIDLE => txelecidle_in(0),
      TXHEADER(5 downto 0) => txheader_in(5 downto 0),
      TXINHIBIT => txinhibit_in(0),
      TXLATCLK => txlatclk_in(0),
      TXMAINCURSOR(6 downto 0) => txmaincursor_in(6 downto 0),
      TXMARGIN(2 downto 0) => txmargin_in(2 downto 0),
      TXOUTCLK => txoutclk_out(0),
      TXOUTCLKFABRIC => txoutclkfabric_out(0),
      TXOUTCLKPCS => txoutclkpcs_out(0),
      TXOUTCLKSEL(2 downto 0) => txoutclksel_in(2 downto 0),
      TXPCSRESET => txpcsreset_in(0),
      TXPD(1 downto 0) => txpd_in(1 downto 0),
      TXPDELECIDLEMODE => txpdelecidlemode_in(0),
      TXPHALIGN => txphalign_in(0),
      TXPHALIGNDONE => txphaligndone_out(0),
      TXPHALIGNEN => txphalignen_in(0),
      TXPHDLYPD => txphdlypd_in(0),
      TXPHDLYRESET => txphdlyreset_in(0),
      TXPHDLYTSTCLK => txphdlytstclk_in(0),
      TXPHINIT => txphinit_in(0),
      TXPHINITDONE => txphinitdone_out(0),
      TXPHOVRDEN => txphovrden_in(0),
      TXPIPPMEN => txpippmen_in(0),
      TXPIPPMOVRDEN => txpippmovrden_in(0),
      TXPIPPMPD => txpippmpd_in(0),
      TXPIPPMSEL => txpippmsel_in(0),
      TXPIPPMSTEPSIZE(4 downto 0) => txpippmstepsize_in(4 downto 0),
      TXPISOPD => txpisopd_in(0),
      TXPLLCLKSEL(1 downto 0) => txpllclksel_in(1 downto 0),
      TXPMARESET => txpmareset_in(0),
      TXPMARESETDONE => txpmaresetdone_out(0),
      TXPOLARITY => txpolarity_in(0),
      TXPOSTCURSOR(4 downto 0) => txpostcursor_in(4 downto 0),
      TXPOSTCURSORINV => txpostcursorinv_in(0),
      TXPRBSFORCEERR => txprbsforceerr_in(0),
      TXPRBSSEL(3 downto 0) => txprbssel_in(3 downto 0),
      TXPRECURSOR(4 downto 0) => txprecursor_in(4 downto 0),
      TXPRECURSORINV => txprecursorinv_in(0),
      TXPRGDIVRESETDONE => txprgdivresetdone_out(0),
      TXPROGDIVRESET => \gen_gtwizard_gthe3.txprogdivreset_int\,
      TXQPIBIASEN => txqpibiasen_in(0),
      TXQPISENN => txqpisenn_out(0),
      TXQPISENP => txqpisenp_out(0),
      TXQPISTRONGPDOWN => txqpistrongpdown_in(0),
      TXQPIWEAKPUP => txqpiweakpup_in(0),
      TXRATE(2 downto 0) => txrate_in(2 downto 0),
      TXRATEDONE => txratedone_out(0),
      TXRATEMODE => txratemode_in(0),
      TXRESETDONE => txresetdone_out(0),
      TXSEQUENCE(6 downto 0) => txsequence_in(6 downto 0),
      TXSWING => txswing_in(0),
      TXSYNCALLIN => txsyncallin_in(0),
      TXSYNCDONE => txsyncdone_out(0),
      TXSYNCIN => txsyncin_in(0),
      TXSYNCMODE => txsyncmode_in(0),
      TXSYNCOUT => txsyncout_out(0),
      TXSYSCLKSEL(1 downto 0) => txsysclksel_in(1 downto 0),
      TXUSERRDY => \gen_gtwizard_gthe3.txuserrdy_int\,
      TXUSRCLK => txusrclk_in(0),
      TXUSRCLK2 => txusrclk2_in(0)
    );
\rst_in_meta_i_1__4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^cplllock_out\(0),
      O => rst_in0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer is
  port (
    gtwiz_reset_rx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_done_int_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer : entity is "gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer is
  signal rst_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_in_meta : signal is "true";
  signal \rst_in_out_i_1__0_n_0\ : STD_LOGIC;
  signal rst_in_sync1 : STD_LOGIC;
  attribute async_reg of rst_in_sync1 : signal is "true";
  signal rst_in_sync2 : STD_LOGIC;
  attribute async_reg of rst_in_sync2 : signal is "true";
  signal rst_in_sync3 : STD_LOGIC;
  attribute async_reg of rst_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of rst_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of rst_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync1_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync2_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync3_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync3_reg : label is "yes";
begin
rst_in_meta_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rxusrclk2_in(0),
      CE => '1',
      CLR => \rst_in_out_i_1__0_n_0\,
      D => '1',
      Q => rst_in_meta
    );
\rst_in_out_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => gtwiz_reset_rx_done_int_reg,
      O => \rst_in_out_i_1__0_n_0\
    );
rst_in_out_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rxusrclk2_in(0),
      CE => '1',
      CLR => \rst_in_out_i_1__0_n_0\,
      D => rst_in_sync3,
      Q => gtwiz_reset_rx_done_out(0)
    );
rst_in_sync1_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rxusrclk2_in(0),
      CE => '1',
      CLR => \rst_in_out_i_1__0_n_0\,
      D => rst_in_meta,
      Q => rst_in_sync1
    );
rst_in_sync2_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rxusrclk2_in(0),
      CE => '1',
      CLR => \rst_in_out_i_1__0_n_0\,
      D => rst_in_sync1,
      Q => rst_in_sync2
    );
rst_in_sync3_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => rxusrclk2_in(0),
      CE => '1',
      CLR => \rst_in_out_i_1__0_n_0\,
      D => rst_in_sync2,
      Q => rst_in_sync3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer_19 is
  port (
    gtwiz_reset_tx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_done_int_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer_19 : entity is "gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer_19;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer_19 is
  signal rst_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_in_meta : signal is "true";
  signal rst_in_out_i_1_n_0 : STD_LOGIC;
  signal rst_in_sync1 : STD_LOGIC;
  attribute async_reg of rst_in_sync1 : signal is "true";
  signal rst_in_sync2 : STD_LOGIC;
  attribute async_reg of rst_in_sync2 : signal is "true";
  signal rst_in_sync3 : STD_LOGIC;
  attribute async_reg of rst_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of rst_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of rst_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync1_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync2_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync3_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync3_reg : label is "yes";
begin
rst_in_meta_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => txusrclk2_in(0),
      CE => '1',
      CLR => rst_in_out_i_1_n_0,
      D => '1',
      Q => rst_in_meta
    );
rst_in_out_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => gtwiz_reset_tx_done_int_reg,
      O => rst_in_out_i_1_n_0
    );
rst_in_out_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => txusrclk2_in(0),
      CE => '1',
      CLR => rst_in_out_i_1_n_0,
      D => rst_in_sync3,
      Q => gtwiz_reset_tx_done_out(0)
    );
rst_in_sync1_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => txusrclk2_in(0),
      CE => '1',
      CLR => rst_in_out_i_1_n_0,
      D => rst_in_meta,
      Q => rst_in_sync1
    );
rst_in_sync2_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => txusrclk2_in(0),
      CE => '1',
      CLR => rst_in_out_i_1_n_0,
      D => rst_in_sync1,
      Q => rst_in_sync2
    );
rst_in_sync3_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => txusrclk2_in(0),
      CE => '1',
      CLR => rst_in_out_i_1_n_0,
      D => rst_in_sync2,
      Q => rst_in_sync3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer is
  port (
    gtwiz_reset_all_sync : out STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_all_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer : entity is "gtwizard_ultrascale_v1_7_4_reset_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer is
  signal rst_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_in_meta : signal is "true";
  signal rst_in_sync1 : STD_LOGIC;
  attribute async_reg of rst_in_sync1 : signal is "true";
  signal rst_in_sync2 : STD_LOGIC;
  attribute async_reg of rst_in_sync2 : signal is "true";
  signal rst_in_sync3 : STD_LOGIC;
  attribute async_reg of rst_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of rst_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of rst_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync1_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync2_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync3_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync3_reg : label is "yes";
begin
rst_in_meta_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => '0',
      PRE => gtwiz_reset_all_in(0),
      Q => rst_in_meta
    );
rst_in_out_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync3,
      PRE => gtwiz_reset_all_in(0),
      Q => gtwiz_reset_all_sync
    );
rst_in_sync1_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_meta,
      PRE => gtwiz_reset_all_in(0),
      Q => rst_in_sync1
    );
rst_in_sync2_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync1,
      PRE => gtwiz_reset_all_in(0),
      Q => rst_in_sync2
    );
rst_in_sync3_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync2,
      PRE => gtwiz_reset_all_in(0),
      Q => rst_in_sync3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_13 is
  port (
    gtwiz_reset_rx_any_sync : out STD_LOGIC;
    pllreset_rx_out_reg : out STD_LOGIC;
    rxprogdivreset_out_reg : out STD_LOGIC;
    gtrxreset_out_reg : out STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_rx_int\ : in STD_LOGIC;
    sm_reset_rx_cdr_to_sat_reg : in STD_LOGIC;
    \gen_gtwizard_gthe3.rxprogdivreset_int\ : in STD_LOGIC;
    plllock_rx_sync : in STD_LOGIC;
    sm_reset_rx_timer_sat_reg : in STD_LOGIC;
    \gen_gtwizard_gthe3.gtrxreset_int\ : in STD_LOGIC;
    gtwiz_reset_rx_datapath_int_reg : in STD_LOGIC;
    gtwiz_reset_rx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_pll_and_datapath_int_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_13 : entity is "gtwizard_ultrascale_v1_7_4_reset_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_13;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_13 is
  signal gtrxreset_out_i_2_n_0 : STD_LOGIC;
  signal gtwiz_reset_rx_any : STD_LOGIC;
  signal \^gtwiz_reset_rx_any_sync\ : STD_LOGIC;
  signal rst_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_in_meta : signal is "true";
  signal rst_in_sync1 : STD_LOGIC;
  attribute async_reg of rst_in_sync1 : signal is "true";
  signal rst_in_sync2 : STD_LOGIC;
  attribute async_reg of rst_in_sync2 : signal is "true";
  signal rst_in_sync3 : STD_LOGIC;
  attribute async_reg of rst_in_sync3 : signal is "true";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of gtrxreset_out_i_2 : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of pllreset_rx_out_i_1 : label is "soft_lutpair102";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of rst_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of rst_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync1_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync2_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync3_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync3_reg : label is "yes";
begin
  gtwiz_reset_rx_any_sync <= \^gtwiz_reset_rx_any_sync\;
gtrxreset_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF44884488"
    )
        port map (
      I0 => \out\(1),
      I1 => gtrxreset_out_i_2_n_0,
      I2 => plllock_rx_sync,
      I3 => \out\(0),
      I4 => sm_reset_rx_timer_sat_reg,
      I5 => \gen_gtwizard_gthe3.gtrxreset_int\,
      O => gtrxreset_out_reg
    );
gtrxreset_out_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^gtwiz_reset_rx_any_sync\,
      I1 => \out\(2),
      O => gtrxreset_out_i_2_n_0
    );
pllreset_rx_out_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FDFF0100"
    )
        port map (
      I0 => \out\(1),
      I1 => \out\(2),
      I2 => \^gtwiz_reset_rx_any_sync\,
      I3 => \out\(0),
      I4 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_rx_int\,
      O => pllreset_rx_out_reg
    );
\rst_in_meta_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => gtwiz_reset_rx_datapath_int_reg,
      I1 => gtwiz_reset_rx_datapath_in(0),
      I2 => gtwiz_reset_rx_pll_and_datapath_in(0),
      I3 => gtwiz_reset_rx_pll_and_datapath_int_reg,
      O => gtwiz_reset_rx_any
    );
rst_in_meta_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => '0',
      PRE => gtwiz_reset_rx_any,
      Q => rst_in_meta
    );
rst_in_out_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync3,
      PRE => gtwiz_reset_rx_any,
      Q => \^gtwiz_reset_rx_any_sync\
    );
rst_in_sync1_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_meta,
      PRE => gtwiz_reset_rx_any,
      Q => rst_in_sync1
    );
rst_in_sync2_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync1,
      PRE => gtwiz_reset_rx_any,
      Q => rst_in_sync2
    );
rst_in_sync3_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync2,
      PRE => gtwiz_reset_rx_any,
      Q => rst_in_sync3
    );
rxprogdivreset_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFBFFFF00120012"
    )
        port map (
      I0 => \out\(1),
      I1 => \out\(2),
      I2 => \out\(0),
      I3 => \^gtwiz_reset_rx_any_sync\,
      I4 => sm_reset_rx_cdr_to_sat_reg,
      I5 => \gen_gtwizard_gthe3.rxprogdivreset_int\,
      O => rxprogdivreset_out_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_14 is
  port (
    in0 : out STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_datapath_int_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_14 : entity is "gtwizard_ultrascale_v1_7_4_reset_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_14;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_14 is
  signal rst_in0_2 : STD_LOGIC;
  signal rst_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_in_meta : signal is "true";
  signal rst_in_sync1 : STD_LOGIC;
  attribute async_reg of rst_in_sync1 : signal is "true";
  signal rst_in_sync2 : STD_LOGIC;
  attribute async_reg of rst_in_sync2 : signal is "true";
  signal rst_in_sync3 : STD_LOGIC;
  attribute async_reg of rst_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of rst_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of rst_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync1_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync2_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync3_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync3_reg : label is "yes";
begin
\rst_in_meta_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => gtwiz_reset_rx_datapath_in(0),
      I1 => gtwiz_reset_rx_datapath_int_reg,
      O => rst_in0_2
    );
rst_in_meta_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => '0',
      PRE => rst_in0_2,
      Q => rst_in_meta
    );
rst_in_out_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync3,
      PRE => rst_in0_2,
      Q => in0
    );
rst_in_sync1_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_meta,
      PRE => rst_in0_2,
      Q => rst_in_sync1
    );
rst_in_sync2_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync1,
      PRE => rst_in0_2,
      Q => rst_in_sync2
    );
rst_in_sync3_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync2,
      PRE => rst_in0_2,
      Q => rst_in_sync3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_15 is
  port (
    in0 : out STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_pll_and_datapath_int_reg : in STD_LOGIC;
    gtwiz_reset_rx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_15 : entity is "gtwizard_ultrascale_v1_7_4_reset_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_15;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_15 is
  signal p_0_in_1 : STD_LOGIC;
  signal rst_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_in_meta : signal is "true";
  signal rst_in_sync1 : STD_LOGIC;
  attribute async_reg of rst_in_sync1 : signal is "true";
  signal rst_in_sync2 : STD_LOGIC;
  attribute async_reg of rst_in_sync2 : signal is "true";
  signal rst_in_sync3 : STD_LOGIC;
  attribute async_reg of rst_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of rst_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of rst_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync1_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync2_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync3_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync3_reg : label is "yes";
begin
\rst_in_meta_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => gtwiz_reset_rx_pll_and_datapath_int_reg,
      I1 => gtwiz_reset_rx_pll_and_datapath_in(0),
      O => p_0_in_1
    );
rst_in_meta_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => '0',
      PRE => p_0_in_1,
      Q => rst_in_meta
    );
rst_in_out_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync3,
      PRE => p_0_in_1,
      Q => in0
    );
rst_in_sync1_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_meta,
      PRE => p_0_in_1,
      Q => rst_in_sync1
    );
rst_in_sync2_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync1,
      PRE => p_0_in_1,
      Q => rst_in_sync2
    );
rst_in_sync3_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync2,
      PRE => p_0_in_1,
      Q => rst_in_sync3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_16 is
  port (
    gtwiz_reset_tx_any_sync : out STD_LOGIC;
    pllreset_tx_out_reg : out STD_LOGIC;
    gttxreset_out_reg : out STD_LOGIC;
    txuserrdy_out_reg : out STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_tx_int\ : in STD_LOGIC;
    plllock_tx_sync : in STD_LOGIC;
    sm_reset_tx_timer_sat_reg : in STD_LOGIC;
    \gen_gtwizard_gthe3.gttxreset_int\ : in STD_LOGIC;
    \FSM_sequential_sm_reset_tx_reg[1]\ : in STD_LOGIC;
    gtwiz_reset_userclk_tx_active_sync : in STD_LOGIC;
    \gen_gtwizard_gthe3.txuserrdy_int\ : in STD_LOGIC;
    gtwiz_reset_tx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_pll_and_datapath_int_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_16 : entity is "gtwizard_ultrascale_v1_7_4_reset_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_16;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_16 is
  signal gttxreset_out_i_2_n_0 : STD_LOGIC;
  signal gtwiz_reset_tx_any : STD_LOGIC;
  signal \^gtwiz_reset_tx_any_sync\ : STD_LOGIC;
  signal rst_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_in_meta : signal is "true";
  signal rst_in_sync1 : STD_LOGIC;
  attribute async_reg of rst_in_sync1 : signal is "true";
  signal rst_in_sync2 : STD_LOGIC;
  attribute async_reg of rst_in_sync2 : signal is "true";
  signal rst_in_sync3 : STD_LOGIC;
  attribute async_reg of rst_in_sync3 : signal is "true";
  signal txuserrdy_out_i_2_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of pllreset_tx_out_i_1 : label is "soft_lutpair103";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of rst_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of rst_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync1_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync2_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync3_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync3_reg : label is "yes";
  attribute SOFT_HLUTNM of txuserrdy_out_i_2 : label is "soft_lutpair103";
begin
  gtwiz_reset_tx_any_sync <= \^gtwiz_reset_tx_any_sync\;
gttxreset_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF44884488"
    )
        port map (
      I0 => \out\(1),
      I1 => gttxreset_out_i_2_n_0,
      I2 => plllock_tx_sync,
      I3 => \out\(0),
      I4 => sm_reset_tx_timer_sat_reg,
      I5 => \gen_gtwizard_gthe3.gttxreset_int\,
      O => gttxreset_out_reg
    );
gttxreset_out_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^gtwiz_reset_tx_any_sync\,
      I1 => \out\(2),
      O => gttxreset_out_i_2_n_0
    );
pllreset_tx_out_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FDFF0100"
    )
        port map (
      I0 => \out\(1),
      I1 => \out\(2),
      I2 => \^gtwiz_reset_tx_any_sync\,
      I3 => \out\(0),
      I4 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_tx_int\,
      O => pllreset_tx_out_reg
    );
rst_in_meta_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => gtwiz_reset_tx_datapath_in(0),
      I1 => gtwiz_reset_tx_pll_and_datapath_in(0),
      I2 => gtwiz_reset_tx_pll_and_datapath_int_reg,
      O => gtwiz_reset_tx_any
    );
rst_in_meta_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => '0',
      PRE => gtwiz_reset_tx_any,
      Q => rst_in_meta
    );
rst_in_out_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync3,
      PRE => gtwiz_reset_tx_any,
      Q => \^gtwiz_reset_tx_any_sync\
    );
rst_in_sync1_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_meta,
      PRE => gtwiz_reset_tx_any,
      Q => rst_in_sync1
    );
rst_in_sync2_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync1,
      PRE => gtwiz_reset_tx_any,
      Q => rst_in_sync2
    );
rst_in_sync3_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync2,
      PRE => gtwiz_reset_tx_any,
      Q => rst_in_sync3
    );
txuserrdy_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD55DD5588008C00"
    )
        port map (
      I0 => txuserrdy_out_i_2_n_0,
      I1 => \FSM_sequential_sm_reset_tx_reg[1]\,
      I2 => \out\(0),
      I3 => gtwiz_reset_userclk_tx_active_sync,
      I4 => \^gtwiz_reset_tx_any_sync\,
      I5 => \gen_gtwizard_gthe3.txuserrdy_int\,
      O => txuserrdy_out_reg
    );
txuserrdy_out_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0110"
    )
        port map (
      I0 => \out\(2),
      I1 => \^gtwiz_reset_tx_any_sync\,
      I2 => \out\(1),
      I3 => \out\(0),
      O => txuserrdy_out_i_2_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_17 is
  port (
    in0 : out STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_17 : entity is "gtwizard_ultrascale_v1_7_4_reset_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_17;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_17 is
  signal rst_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_in_meta : signal is "true";
  signal rst_in_sync1 : STD_LOGIC;
  attribute async_reg of rst_in_sync1 : signal is "true";
  signal rst_in_sync2 : STD_LOGIC;
  attribute async_reg of rst_in_sync2 : signal is "true";
  signal rst_in_sync3 : STD_LOGIC;
  attribute async_reg of rst_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of rst_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of rst_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync1_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync2_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync3_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync3_reg : label is "yes";
begin
rst_in_meta_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => '0',
      PRE => gtwiz_reset_tx_datapath_in(0),
      Q => rst_in_meta
    );
rst_in_out_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync3,
      PRE => gtwiz_reset_tx_datapath_in(0),
      Q => in0
    );
rst_in_sync1_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_meta,
      PRE => gtwiz_reset_tx_datapath_in(0),
      Q => rst_in_sync1
    );
rst_in_sync2_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync1,
      PRE => gtwiz_reset_tx_datapath_in(0),
      Q => rst_in_sync2
    );
rst_in_sync3_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync2,
      PRE => gtwiz_reset_tx_datapath_in(0),
      Q => rst_in_sync3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_18 is
  port (
    in0 : out STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_pll_and_datapath_int_reg : in STD_LOGIC;
    gtwiz_reset_tx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_18 : entity is "gtwizard_ultrascale_v1_7_4_reset_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_18;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_18 is
  signal p_1_in_0 : STD_LOGIC;
  signal rst_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_in_meta : signal is "true";
  signal rst_in_sync1 : STD_LOGIC;
  attribute async_reg of rst_in_sync1 : signal is "true";
  signal rst_in_sync2 : STD_LOGIC;
  attribute async_reg of rst_in_sync2 : signal is "true";
  signal rst_in_sync3 : STD_LOGIC;
  attribute async_reg of rst_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of rst_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of rst_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync1_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync2_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync3_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync3_reg : label is "yes";
begin
\rst_in_meta_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => gtwiz_reset_tx_pll_and_datapath_int_reg,
      I1 => gtwiz_reset_tx_pll_and_datapath_in(0),
      O => p_1_in_0
    );
rst_in_meta_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => '0',
      PRE => p_1_in_0,
      Q => rst_in_meta
    );
rst_in_out_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync3,
      PRE => p_1_in_0,
      Q => in0
    );
rst_in_sync1_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_meta,
      PRE => p_1_in_0,
      Q => rst_in_sync1
    );
rst_in_sync2_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync1,
      PRE => p_1_in_0,
      Q => rst_in_sync2
    );
rst_in_sync3_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync2,
      PRE => p_1_in_0,
      Q => rst_in_sync3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_20 is
  port (
    \gen_gtwizard_gthe3.txprogdivreset_int\ : out STD_LOGIC;
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_in0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_20 : entity is "gtwizard_ultrascale_v1_7_4_reset_synchronizer";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_20;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_20 is
  signal rst_in_meta : STD_LOGIC;
  attribute async_reg : string;
  attribute async_reg of rst_in_meta : signal is "true";
  signal rst_in_sync1 : STD_LOGIC;
  attribute async_reg of rst_in_sync1 : signal is "true";
  signal rst_in_sync2 : STD_LOGIC;
  attribute async_reg of rst_in_sync2 : signal is "true";
  signal rst_in_sync3 : STD_LOGIC;
  attribute async_reg of rst_in_sync3 : signal is "true";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of rst_in_meta_reg : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of rst_in_meta_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync1_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync1_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync2_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync2_reg : label is "yes";
  attribute ASYNC_REG_boolean of rst_in_sync3_reg : label is std.standard.true;
  attribute KEEP of rst_in_sync3_reg : label is "yes";
begin
rst_in_meta_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => '0',
      PRE => rst_in0,
      Q => rst_in_meta
    );
rst_in_out_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync3,
      PRE => rst_in0,
      Q => \gen_gtwizard_gthe3.txprogdivreset_int\
    );
rst_in_sync1_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_meta,
      PRE => rst_in0,
      Q => rst_in_sync1
    );
rst_in_sync2_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync1,
      PRE => rst_in0,
      Q => rst_in_sync2
    );
rst_in_sync3_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => rst_in_sync2,
      PRE => rst_in0,
      Q => rst_in_sync3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_GLOBAL_LOGIC is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_v_r_reg[1]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gen_a_i : out STD_LOGIC;
    \gen_k_r_reg[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \gen_r_r_reg[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    channel_up : out STD_LOGIC;
    start_rx_i : out STD_LOGIC;
    gtrxreset_i : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    hard_err : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC;
    got_v_i : in STD_LOGIC;
    SYSTEM_RESET_reg : in STD_LOGIC;
    hard_err_i : in STD_LOGIC;
    lane_up : in STD_LOGIC;
    power_down : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_GLOBAL_LOGIC : entity is "dnpcie_aurora_2_sim_GLOBAL_LOGIC";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_GLOBAL_LOGIC;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_GLOBAL_LOGIC is
  signal gen_ver_i : STD_LOGIC;
  signal reset_channel_i : STD_LOGIC;
  signal txver_count_r0 : STD_LOGIC;
  signal wait_for_lane_up_r0 : STD_LOGIC;
begin
channel_err_detect_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_CHANNEL_ERR_DETECT
     port map (
      D(1 downto 0) => D(1 downto 0),
      SS(0) => wait_for_lane_up_r0,
      SYSTEM_RESET_reg => SYSTEM_RESET_reg,
      hard_err => hard_err,
      hard_err_i => hard_err_i,
      lane_up => lane_up,
      power_down => power_down,
      reset_channel_i => reset_channel_i,
      soft_err => soft_err,
      user_clk => user_clk
    );
channel_init_sm_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_CHANNEL_INIT_SM
     port map (
      SR(0) => SR(0),
      SS(0) => wait_for_lane_up_r0,
      \STORAGE_CE_reg[0]\(0) => SS(0),
      SYSTEM_RESET_reg => SYSTEM_RESET_reg,
      channel_up => channel_up,
      gen_ver_i => gen_ver_i,
      got_v_i => got_v_i,
      gtrxreset_i => gtrxreset_i,
      p_0_in => p_0_in,
      reset_channel_i => reset_channel_i,
      start_rx_i => start_rx_i,
      txver_count_r0 => txver_count_r0,
      user_clk => user_clk
    );
idle_and_ver_gen_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_IDLE_AND_VER_GEN
     port map (
      SYSTEM_RESET_reg => SYSTEM_RESET_reg,
      gen_a_i => gen_a_i,
      \gen_k_r_reg[0]\(3 downto 0) => \gen_k_r_reg[0]\(3 downto 0),
      \gen_r_r_reg[0]\(3 downto 0) => \gen_r_r_reg[0]\(3 downto 0),
      \gen_v_r_reg[1]\(2 downto 0) => \gen_v_r_reg[1]\(2 downto 0),
      gen_ver_i => gen_ver_i,
      txver_count_r0 => txver_count_r0,
      user_clk => user_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RESET_LOGIC is
  port (
    link_reset_r : out STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    new_pkt_r : out STD_LOGIC;
    \out\ : in STD_LOGIC;
    link_reset_out : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    tx_lock : in STD_LOGIC;
    gt_txresetdone_r3_reg_0 : in STD_LOGIC;
    gt_rxresetdone_r3_reg_0 : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    channel_up : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    tx_dst_rdy : in STD_LOGIC;
    new_pkt_r_reg : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RESET_LOGIC : entity is "dnpcie_aurora_2_sim_RESET_LOGIC";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RESET_LOGIC;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RESET_LOGIC is
  signal SYSTEM_RESET0_n_0 : STD_LOGIC;
  signal gt_rxresetdone_r : STD_LOGIC;
  signal gt_rxresetdone_r2 : STD_LOGIC;
  signal gt_rxresetdone_r3 : STD_LOGIC;
  signal gt_txresetdone_r : STD_LOGIC;
  signal gt_txresetdone_r2 : STD_LOGIC;
  signal gt_txresetdone_r3 : STD_LOGIC;
  signal \^link_reset_r\ : STD_LOGIC;
  signal link_reset_sync : STD_LOGIC;
  signal \^sys_reset_out\ : STD_LOGIC;
  signal tx_lock_comb_r : STD_LOGIC;
  signal tx_lock_sync : STD_LOGIC;
begin
  link_reset_r <= \^link_reset_r\;
  sys_reset_out <= \^sys_reset_out\;
SYSTEM_RESET0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBFFFFF"
    )
        port map (
      I0 => \out\,
      I1 => gt_rxresetdone_r3,
      I2 => gt_txresetdone_r3,
      I3 => link_reset_sync,
      I4 => tx_lock_sync,
      O => SYSTEM_RESET0_n_0
    );
SYSTEM_RESET_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => SYSTEM_RESET0_n_0,
      Q => \^sys_reset_out\,
      R => '0'
    );
gt_rxresetdone_r2_reg: unisim.vcomponents.FDCE
     port map (
      C => user_clk,
      CE => '1',
      CLR => gt_rxresetdone_r3_reg_0,
      D => gt_rxresetdone_r,
      Q => gt_rxresetdone_r2
    );
gt_rxresetdone_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gt_rxresetdone_r2,
      Q => gt_rxresetdone_r3,
      R => '0'
    );
gt_rxresetdone_r_reg: unisim.vcomponents.FDCE
     port map (
      C => user_clk,
      CE => '1',
      CLR => gt_rxresetdone_r3_reg_0,
      D => '1',
      Q => gt_rxresetdone_r
    );
gt_txresetdone_r2_reg: unisim.vcomponents.FDCE
     port map (
      C => user_clk,
      CE => '1',
      CLR => gt_txresetdone_r3_reg_0,
      D => gt_txresetdone_r,
      Q => gt_txresetdone_r2
    );
gt_txresetdone_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gt_txresetdone_r2,
      Q => gt_txresetdone_r3,
      R => '0'
    );
gt_txresetdone_r_reg: unisim.vcomponents.FDCE
     port map (
      C => user_clk,
      CE => '1',
      CLR => gt_txresetdone_r3_reg_0,
      D => '1',
      Q => gt_txresetdone_r
    );
link_reset_cdc_sync: entity work.\dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_22\
     port map (
      init_clk_in => init_clk_in,
      link_reset_r => \^link_reset_r\,
      \out\ => link_reset_sync,
      user_clk => user_clk
    );
link_reset_comb_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_out,
      Q => \^link_reset_r\,
      R => '0'
    );
new_pkt_r_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030103000001000"
    )
        port map (
      I0 => s_axi_tx_tlast,
      I1 => \^sys_reset_out\,
      I2 => channel_up,
      I3 => s_axi_tx_tvalid,
      I4 => tx_dst_rdy,
      I5 => new_pkt_r_reg,
      O => new_pkt_r
    );
tx_lock_cdc_sync: entity work.\dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_23\
     port map (
      init_clk_in => init_clk_in,
      \out\ => tx_lock_sync,
      tx_lock_comb_r => tx_lock_comb_r,
      user_clk => user_clk
    );
tx_lock_comb_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => tx_lock,
      Q => tx_lock_comb_r,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_PDU_DATAPATH is
  port (
    rx_eof : out STD_LOGIC;
    frame_err : out STD_LOGIC;
    m_axi_rx_tlast : out STD_LOGIC;
    m_axi_rx_tvalid : out STD_LOGIC;
    \m_axi_rx_tkeep[2]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \STORAGE_DATA_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 31 );
    \RX_ECP_reg[0]\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \RX_ECP_reg[1]\ : in STD_LOGIC;
    after_scp_select_c_1 : in STD_LOGIC;
    after_scp_select_c_0 : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC;
    \RX_PAD_reg[1]\ : in STD_LOGIC;
    \word_aligned_data_r_reg[0]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \word_aligned_data_r_reg[12]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \word_aligned_data_r_reg[16]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \word_aligned_data_r_reg[28]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    start_rx_i : in STD_LOGIC;
    \RX_PE_DATA_V_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \RX_ECP_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \channel_fcnb_r_reg[0]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \MUXED_DATA_reg[16]\ : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_PDU_DATAPATH : entity is "dnpcie_aurora_2_sim_RX_LL_PDU_DATAPATH";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_PDU_DATAPATH;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_PDU_DATAPATH is
  signal EOF_N : STD_LOGIC;
  signal FRAME_ERR_RESULT : STD_LOGIC;
  signal FRAME_ERR_RESULT0 : STD_LOGIC;
  signal MUX_SELECT : STD_LOGIC_VECTOR ( 2 to 2 );
  signal OUTPUT_SELECT : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SRC_RDY_N : STD_LOGIC;
  signal STORAGE_DATA : STD_LOGIC_VECTOR ( 0 to 31 );
  signal ce_command_c : STD_LOGIC_VECTOR ( 0 to 1 );
  signal count_c : STD_LOGIC_VECTOR ( 0 to 1 );
  signal end_storage_r0 : STD_LOGIC;
  signal mux_select_c : STD_LOGIC_VECTOR ( 2 to 2 );
  signal output_select_c : STD_LOGIC_VECTOR ( 9 to 9 );
  signal overwrite_c : STD_LOGIC;
  signal p_0_in0 : STD_LOGIC;
  signal \^rx_eof\ : STD_LOGIC;
  signal rx_src_rdy : STD_LOGIC;
  signal sideband_output_i_n_1 : STD_LOGIC;
  signal sideband_output_i_n_6 : STD_LOGIC;
  signal sideband_output_i_n_7 : STD_LOGIC;
  signal \stage_1_data_r_reg[0]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[12]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[13]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[14]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[15]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[16]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[17]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[18]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[19]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[1]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[20]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[21]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[22]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[23]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[28]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[29]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[2]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[30]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[31]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[3]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[4]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[5]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[6]_srl3_n_0\ : STD_LOGIC;
  signal \stage_1_data_r_reg[7]_srl3_n_0\ : STD_LOGIC;
  signal stage_1_ecp_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal stage_1_pad_r : STD_LOGIC;
  signal stage_1_rx_ll_deframer_i_n_1 : STD_LOGIC;
  signal stage_1_rx_ll_deframer_i_n_2 : STD_LOGIC;
  signal stage_1_rx_ll_deframer_i_n_3 : STD_LOGIC;
  signal stage_1_rx_ll_deframer_i_n_6 : STD_LOGIC;
  signal stage_1_scp_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal stage_2_data_r : STD_LOGIC_VECTOR ( 0 to 31 );
  signal stage_2_data_v_count_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal stage_2_end_after_start_r : STD_LOGIC;
  signal stage_2_end_before_start_r : STD_LOGIC;
  signal stage_2_frame_err_r : STD_LOGIC;
  signal stage_2_pad_r : STD_LOGIC;
  signal stage_2_start_with_data_r : STD_LOGIC;
  signal stage_3_end_storage_r : STD_LOGIC;
  signal stage_3_storage_ce_control_i_n_1 : STD_LOGIC;
  signal stage_3_storage_count_control_i_n_5 : STD_LOGIC;
  signal stage_3_storage_count_control_i_n_6 : STD_LOGIC;
  signal stage_3_storage_count_control_i_n_7 : STD_LOGIC;
  signal stage_3_storage_count_r : STD_LOGIC_VECTOR ( 0 to 1 );
  signal storage_count_c : STD_LOGIC_VECTOR ( 0 to 0 );
  signal storage_select_c0_in : STD_LOGIC_VECTOR ( 4 to 9 );
  attribute srl_bus_name : string;
  attribute srl_bus_name of \stage_1_data_r_reg[0]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \stage_1_data_r_reg[0]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[0]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[12]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[12]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[12]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[13]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[13]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[13]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[14]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[14]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[14]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[15]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[15]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[15]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[16]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[16]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[16]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[17]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[17]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[17]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[18]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[18]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[18]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[19]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[19]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[19]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[1]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[1]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[1]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[20]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[20]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[20]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[21]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[21]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[21]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[22]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[22]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[22]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[23]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[23]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[23]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[28]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[28]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[28]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[29]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[29]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[29]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[2]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[2]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[2]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[30]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[30]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[30]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[31]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[31]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[31]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[3]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[3]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[3]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[4]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[4]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[4]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[5]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[5]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[5]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[6]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[6]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[6]_srl3 ";
  attribute srl_bus_name of \stage_1_data_r_reg[7]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg ";
  attribute srl_name of \stage_1_data_r_reg[7]_srl3\ : label is "inst/\dnpcie_aurora_2_sim_rx_ll_i/rx_ll_pdu_datapath_i/stage_1_data_r_reg[7]_srl3 ";
begin
  Q(31 downto 0) <= \^q\(31 downto 0);
  rx_eof <= \^rx_eof\;
FRAME_ERR_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => FRAME_ERR_RESULT,
      Q => frame_err,
      R => SS(0)
    );
RX_EOF_N_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => EOF_N,
      Q => \^rx_eof\,
      R => '0'
    );
\RX_REM_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => sideband_output_i_n_6,
      Q => \m_axi_rx_tkeep[2]\(1),
      R => '0'
    );
\RX_REM_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => sideband_output_i_n_7,
      Q => \m_axi_rx_tkeep[2]\(0),
      R => '0'
    );
RX_SRC_RDY_N_reg: unisim.vcomponents.FDSE
     port map (
      C => user_clk,
      CE => '1',
      D => SRC_RDY_N,
      Q => rx_src_rdy,
      S => SS(0)
    );
m_axi_rx_tlast_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^rx_eof\,
      O => m_axi_rx_tlast
    );
m_axi_rx_tvalid_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rx_src_rdy,
      O => m_axi_rx_tvalid
    );
output_mux_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_OUTPUT_MUX
     port map (
      \MUXED_DATA_reg[0]\(15 downto 0) => \^q\(31 downto 16),
      OUTPUT_SELECT => OUTPUT_SELECT,
      Q(31) => STORAGE_DATA(0),
      Q(30) => STORAGE_DATA(1),
      Q(29) => STORAGE_DATA(2),
      Q(28) => STORAGE_DATA(3),
      Q(27) => STORAGE_DATA(4),
      Q(26) => STORAGE_DATA(5),
      Q(25) => STORAGE_DATA(6),
      Q(24) => STORAGE_DATA(7),
      Q(23) => STORAGE_DATA(8),
      Q(22) => STORAGE_DATA(9),
      Q(21) => STORAGE_DATA(10),
      Q(20) => STORAGE_DATA(11),
      Q(19) => STORAGE_DATA(12),
      Q(18) => STORAGE_DATA(13),
      Q(17) => STORAGE_DATA(14),
      Q(16) => STORAGE_DATA(15),
      Q(15) => STORAGE_DATA(16),
      Q(14) => STORAGE_DATA(17),
      Q(13) => STORAGE_DATA(18),
      Q(12) => STORAGE_DATA(19),
      Q(11) => STORAGE_DATA(20),
      Q(10) => STORAGE_DATA(21),
      Q(9) => STORAGE_DATA(22),
      Q(8) => STORAGE_DATA(23),
      Q(7) => STORAGE_DATA(24),
      Q(6) => STORAGE_DATA(25),
      Q(5) => STORAGE_DATA(26),
      Q(4) => STORAGE_DATA(27),
      Q(3) => STORAGE_DATA(28),
      Q(2) => STORAGE_DATA(29),
      Q(1) => STORAGE_DATA(30),
      Q(0) => STORAGE_DATA(31),
      m_axi_rx_tdata(0 to 31) => m_axi_rx_tdata(0 to 31),
      user_clk => user_clk
    );
sideband_output_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SIDEBAND_OUTPUT
     port map (
      \COUNT_reg[1]\(0) => stage_2_data_v_count_r(1),
      EOF_N => EOF_N,
      FRAME_ERR_RESULT => FRAME_ERR_RESULT,
      FRAME_ERR_RESULT0 => FRAME_ERR_RESULT0,
      Q(0) => stage_3_storage_count_r(1),
      \RX_REM_reg[0]_0\(1) => sideband_output_i_n_6,
      \RX_REM_reg[0]_0\(0) => sideband_output_i_n_7,
      SRC_RDY_N => SRC_RDY_N,
      SRC_RDY_N_reg_0 => sideband_output_i_n_1,
      SS(0) => overwrite_c,
      end_storage_r0 => end_storage_r0,
      stage_2_end_before_start_r => stage_2_end_before_start_r,
      stage_2_frame_err_r => stage_2_frame_err_r,
      stage_2_pad_r => stage_2_pad_r,
      stage_2_start_with_data_r => stage_2_start_with_data_r,
      stage_2_start_with_data_r_reg => stage_3_storage_count_control_i_n_6,
      stage_3_end_storage_r => stage_3_end_storage_r,
      start_rx_i => start_rx_i,
      \storage_count_r_reg[1]\ => stage_3_storage_count_control_i_n_7,
      user_clk => user_clk
    );
\stage_1_data_r_reg[0]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[0]\(7),
      Q => \stage_1_data_r_reg[0]_srl3_n_0\
    );
\stage_1_data_r_reg[12]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[12]\(3),
      Q => \stage_1_data_r_reg[12]_srl3_n_0\
    );
\stage_1_data_r_reg[13]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[12]\(2),
      Q => \stage_1_data_r_reg[13]_srl3_n_0\
    );
\stage_1_data_r_reg[14]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[12]\(1),
      Q => \stage_1_data_r_reg[14]_srl3_n_0\
    );
\stage_1_data_r_reg[15]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[12]\(0),
      Q => \stage_1_data_r_reg[15]_srl3_n_0\
    );
\stage_1_data_r_reg[16]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[16]\(7),
      Q => \stage_1_data_r_reg[16]_srl3_n_0\
    );
\stage_1_data_r_reg[17]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[16]\(6),
      Q => \stage_1_data_r_reg[17]_srl3_n_0\
    );
\stage_1_data_r_reg[18]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[16]\(5),
      Q => \stage_1_data_r_reg[18]_srl3_n_0\
    );
\stage_1_data_r_reg[19]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[16]\(4),
      Q => \stage_1_data_r_reg[19]_srl3_n_0\
    );
\stage_1_data_r_reg[1]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[0]\(6),
      Q => \stage_1_data_r_reg[1]_srl3_n_0\
    );
\stage_1_data_r_reg[20]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[16]\(3),
      Q => \stage_1_data_r_reg[20]_srl3_n_0\
    );
\stage_1_data_r_reg[21]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[16]\(2),
      Q => \stage_1_data_r_reg[21]_srl3_n_0\
    );
\stage_1_data_r_reg[22]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[16]\(1),
      Q => \stage_1_data_r_reg[22]_srl3_n_0\
    );
\stage_1_data_r_reg[23]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[16]\(0),
      Q => \stage_1_data_r_reg[23]_srl3_n_0\
    );
\stage_1_data_r_reg[28]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[28]\(3),
      Q => \stage_1_data_r_reg[28]_srl3_n_0\
    );
\stage_1_data_r_reg[29]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[28]\(2),
      Q => \stage_1_data_r_reg[29]_srl3_n_0\
    );
\stage_1_data_r_reg[2]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[0]\(5),
      Q => \stage_1_data_r_reg[2]_srl3_n_0\
    );
\stage_1_data_r_reg[30]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[28]\(1),
      Q => \stage_1_data_r_reg[30]_srl3_n_0\
    );
\stage_1_data_r_reg[31]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[28]\(0),
      Q => \stage_1_data_r_reg[31]_srl3_n_0\
    );
\stage_1_data_r_reg[3]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[0]\(4),
      Q => \stage_1_data_r_reg[3]_srl3_n_0\
    );
\stage_1_data_r_reg[4]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[0]\(3),
      Q => \stage_1_data_r_reg[4]_srl3_n_0\
    );
\stage_1_data_r_reg[5]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[0]\(2),
      Q => \stage_1_data_r_reg[5]_srl3_n_0\
    );
\stage_1_data_r_reg[6]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[0]\(1),
      Q => \stage_1_data_r_reg[6]_srl3_n_0\
    );
\stage_1_data_r_reg[7]_srl3\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => \word_aligned_data_r_reg[0]\(0),
      Q => \stage_1_data_r_reg[7]_srl3_n_0\
    );
\stage_1_ecp_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \RX_ECP_reg[0]_0\(1),
      Q => stage_1_ecp_r(0),
      R => '0'
    );
\stage_1_ecp_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \RX_ECP_reg[0]_0\(0),
      Q => stage_1_ecp_r(1),
      R => '0'
    );
stage_1_pad_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \RX_PAD_reg[1]\,
      Q => stage_1_pad_r,
      R => '0'
    );
stage_1_rx_ll_deframer_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_DEFRAMER
     port map (
      \COUNT_reg[0]\(1) => count_c(0),
      \COUNT_reg[0]\(0) => count_c(1),
      D(1 downto 0) => D(1 downto 0),
      Q(1) => stage_1_ecp_r(0),
      Q(0) => stage_1_ecp_r(1),
      \RX_ECP_reg[0]\ => \RX_ECP_reg[0]\,
      \RX_ECP_reg[1]\ => \RX_ECP_reg[1]\,
      \RX_PE_DATA_V_reg[0]\(1 downto 0) => \RX_PE_DATA_V_reg[0]\(1 downto 0),
      SS(0) => SS(0),
      after_scp_select_c_0 => after_scp_select_c_0,
      after_scp_select_c_1 => after_scp_select_c_1,
      mux_select_c(0) => mux_select_c(2),
      \stage_1_scp_r_reg[0]\(1) => stage_1_scp_r(0),
      \stage_1_scp_r_reg[0]\(0) => stage_1_scp_r(1),
      stage_2_end_after_start_r_reg => stage_1_rx_ll_deframer_i_n_3,
      stage_2_end_before_start_r_reg => stage_1_rx_ll_deframer_i_n_2,
      stage_2_frame_err_r_reg => stage_1_rx_ll_deframer_i_n_6,
      stage_2_start_with_data_r_reg => stage_1_rx_ll_deframer_i_n_1,
      user_clk => user_clk
    );
\stage_1_scp_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(1),
      Q => stage_1_scp_r(0),
      R => '0'
    );
\stage_1_scp_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => D(0),
      Q => stage_1_scp_r(1),
      R => '0'
    );
\stage_2_data_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[0]_srl3_n_0\,
      Q => stage_2_data_r(0),
      R => '0'
    );
\stage_2_data_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \channel_fcnb_r_reg[0]\(5),
      Q => stage_2_data_r(10),
      R => '0'
    );
\stage_2_data_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \channel_fcnb_r_reg[0]\(4),
      Q => stage_2_data_r(11),
      R => '0'
    );
\stage_2_data_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[12]_srl3_n_0\,
      Q => stage_2_data_r(12),
      R => '0'
    );
\stage_2_data_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[13]_srl3_n_0\,
      Q => stage_2_data_r(13),
      R => '0'
    );
\stage_2_data_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[14]_srl3_n_0\,
      Q => stage_2_data_r(14),
      R => '0'
    );
\stage_2_data_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[15]_srl3_n_0\,
      Q => stage_2_data_r(15),
      R => '0'
    );
\stage_2_data_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[16]_srl3_n_0\,
      Q => stage_2_data_r(16),
      R => '0'
    );
\stage_2_data_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[17]_srl3_n_0\,
      Q => stage_2_data_r(17),
      R => '0'
    );
\stage_2_data_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[18]_srl3_n_0\,
      Q => stage_2_data_r(18),
      R => '0'
    );
\stage_2_data_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[19]_srl3_n_0\,
      Q => stage_2_data_r(19),
      R => '0'
    );
\stage_2_data_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[1]_srl3_n_0\,
      Q => stage_2_data_r(1),
      R => '0'
    );
\stage_2_data_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[20]_srl3_n_0\,
      Q => stage_2_data_r(20),
      R => '0'
    );
\stage_2_data_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[21]_srl3_n_0\,
      Q => stage_2_data_r(21),
      R => '0'
    );
\stage_2_data_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[22]_srl3_n_0\,
      Q => stage_2_data_r(22),
      R => '0'
    );
\stage_2_data_r_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[23]_srl3_n_0\,
      Q => stage_2_data_r(23),
      R => '0'
    );
\stage_2_data_r_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \channel_fcnb_r_reg[0]\(3),
      Q => stage_2_data_r(24),
      R => '0'
    );
\stage_2_data_r_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \channel_fcnb_r_reg[0]\(2),
      Q => stage_2_data_r(25),
      R => '0'
    );
\stage_2_data_r_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \channel_fcnb_r_reg[0]\(1),
      Q => stage_2_data_r(26),
      R => '0'
    );
\stage_2_data_r_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \channel_fcnb_r_reg[0]\(0),
      Q => stage_2_data_r(27),
      R => '0'
    );
\stage_2_data_r_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[28]_srl3_n_0\,
      Q => stage_2_data_r(28),
      R => '0'
    );
\stage_2_data_r_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[29]_srl3_n_0\,
      Q => stage_2_data_r(29),
      R => '0'
    );
\stage_2_data_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[2]_srl3_n_0\,
      Q => stage_2_data_r(2),
      R => '0'
    );
\stage_2_data_r_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[30]_srl3_n_0\,
      Q => stage_2_data_r(30),
      R => '0'
    );
\stage_2_data_r_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[31]_srl3_n_0\,
      Q => stage_2_data_r(31),
      R => '0'
    );
\stage_2_data_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[3]_srl3_n_0\,
      Q => stage_2_data_r(3),
      R => '0'
    );
\stage_2_data_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[4]_srl3_n_0\,
      Q => stage_2_data_r(4),
      R => '0'
    );
\stage_2_data_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[5]_srl3_n_0\,
      Q => stage_2_data_r(5),
      R => '0'
    );
\stage_2_data_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[6]_srl3_n_0\,
      Q => stage_2_data_r(6),
      R => '0'
    );
\stage_2_data_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \stage_1_data_r_reg[7]_srl3_n_0\,
      Q => stage_2_data_r(7),
      R => '0'
    );
\stage_2_data_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \channel_fcnb_r_reg[0]\(7),
      Q => stage_2_data_r(8),
      R => '0'
    );
\stage_2_data_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => \channel_fcnb_r_reg[0]\(6),
      Q => stage_2_data_r(9),
      R => '0'
    );
stage_2_end_after_start_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_1_rx_ll_deframer_i_n_3,
      Q => stage_2_end_after_start_r,
      R => SS(0)
    );
stage_2_end_before_start_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_1_rx_ll_deframer_i_n_2,
      Q => stage_2_end_before_start_r,
      R => SS(0)
    );
stage_2_frame_err_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_1_rx_ll_deframer_i_n_6,
      Q => stage_2_frame_err_r,
      R => SS(0)
    );
stage_2_left_align_control_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LEFT_ALIGN_CONTROL
     port map (
      MUX_SELECT(0) => MUX_SELECT(2),
      mux_select_c(0) => mux_select_c(2),
      user_clk => user_clk
    );
stage_2_pad_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_1_pad_r,
      Q => stage_2_pad_r,
      R => '0'
    );
stage_2_start_with_data_r_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => stage_1_rx_ll_deframer_i_n_1,
      Q => stage_2_start_with_data_r,
      R => SS(0)
    );
stage_2_valid_data_counter_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_VALID_DATA_COUNTER
     port map (
      D(0) => storage_count_c(0),
      \DEFRAMED_DATA_V_reg[0]\(1) => count_c(0),
      \DEFRAMED_DATA_V_reg[0]\(0) => count_c(1),
      Q(1) => stage_2_data_v_count_r(0),
      Q(0) => stage_2_data_v_count_r(1),
      SS(0) => SS(0),
      \STORAGE_CE_reg[0]\(0) => ce_command_c(0),
      \STORAGE_SELECT_reg[9]\(0) => storage_select_c0_in(9),
      end_storage_r0 => end_storage_r0,
      stage_2_end_after_start_r => stage_2_end_after_start_r,
      stage_2_end_before_start_r => stage_2_end_before_start_r,
      stage_2_start_with_data_r => stage_2_start_with_data_r,
      stage_3_end_storage_r => stage_3_end_storage_r,
      \storage_count_r_reg[0]\(1) => stage_3_storage_count_r(0),
      \storage_count_r_reg[0]\(0) => stage_3_storage_count_r(1),
      \storage_count_r_reg[1]\ => stage_3_storage_count_control_i_n_5,
      user_clk => user_clk
    );
stage_3_left_align_datapath_mux_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LEFT_ALIGN_MUX
     port map (
      MUX_SELECT(0) => MUX_SELECT(2),
      Q(31 downto 0) => \^q\(31 downto 0),
      stage_2_data_r(0 to 31) => stage_2_data_r(0 to 31),
      user_clk => user_clk
    );
stage_3_output_switch_control_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_OUTPUT_SWITCH_CONTROL
     port map (
      OUTPUT_SELECT => OUTPUT_SELECT,
      output_select_c(0) => output_select_c(9),
      user_clk => user_clk
    );
stage_3_storage_ce_control_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_CE_CONTROL
     port map (
      D(1) => ce_command_c(0),
      D(0) => ce_command_c(1),
      Q(1) => p_0_in0,
      Q(0) => stage_3_storage_ce_control_i_n_1,
      SS(0) => SS(0),
      user_clk => user_clk
    );
stage_3_storage_count_control_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_COUNT_CONTROL
     port map (
      \COUNT_reg[0]\(1) => stage_2_data_v_count_r(0),
      \COUNT_reg[0]\(0) => stage_2_data_v_count_r(1),
      D(0) => storage_count_c(0),
      EOF_N_reg => stage_3_storage_count_control_i_n_6,
      FRAME_ERR_RESULT0 => FRAME_ERR_RESULT0,
      FRAME_ERR_RESULT_reg => stage_3_storage_count_control_i_n_5,
      Q(1) => stage_3_storage_count_r(0),
      Q(0) => stage_3_storage_count_r(1),
      SR(0) => sideband_output_i_n_1,
      \STORAGE_CE_reg[1]\(0) => ce_command_c(1),
      \STORAGE_SELECT_reg[4]\(0) => storage_select_c0_in(4),
      output_select_c(0) => output_select_c(9),
      pad_storage_r_reg => stage_3_storage_count_control_i_n_7,
      stage_2_end_after_start_r => stage_2_end_after_start_r,
      stage_2_end_before_start_r => stage_2_end_before_start_r,
      stage_2_frame_err_r => stage_2_frame_err_r,
      stage_2_start_with_data_r => stage_2_start_with_data_r,
      stage_3_end_storage_r => stage_3_end_storage_r,
      user_clk => user_clk
    );
stage_3_storage_switch_control_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_SWITCH_CONTROL
     port map (
      D(1) => storage_select_c0_in(4),
      D(0) => storage_select_c0_in(9),
      SS(0) => overwrite_c,
      \STORAGE_DATA_reg[0]\(1 downto 0) => \STORAGE_DATA_reg[0]\(1 downto 0),
      user_clk => user_clk
    );
stage_4_storage_mux_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STORAGE_MUX
     port map (
      E(1) => p_0_in0,
      E(0) => stage_3_storage_ce_control_i_n_1,
      \MUXED_DATA_reg[16]\(31 downto 0) => \MUXED_DATA_reg[16]\(31 downto 0),
      Q(31) => STORAGE_DATA(0),
      Q(30) => STORAGE_DATA(1),
      Q(29) => STORAGE_DATA(2),
      Q(28) => STORAGE_DATA(3),
      Q(27) => STORAGE_DATA(4),
      Q(26) => STORAGE_DATA(5),
      Q(25) => STORAGE_DATA(6),
      Q(24) => STORAGE_DATA(7),
      Q(23) => STORAGE_DATA(8),
      Q(22) => STORAGE_DATA(9),
      Q(21) => STORAGE_DATA(10),
      Q(20) => STORAGE_DATA(11),
      Q(19) => STORAGE_DATA(12),
      Q(18) => STORAGE_DATA(13),
      Q(17) => STORAGE_DATA(14),
      Q(16) => STORAGE_DATA(15),
      Q(15) => STORAGE_DATA(16),
      Q(14) => STORAGE_DATA(17),
      Q(13) => STORAGE_DATA(18),
      Q(12) => STORAGE_DATA(19),
      Q(11) => STORAGE_DATA(20),
      Q(10) => STORAGE_DATA(21),
      Q(9) => STORAGE_DATA(22),
      Q(8) => STORAGE_DATA(23),
      Q(7) => STORAGE_DATA(24),
      Q(6) => STORAGE_DATA(25),
      Q(5) => STORAGE_DATA(26),
      Q(4) => STORAGE_DATA(27),
      Q(3) => STORAGE_DATA(28),
      Q(2) => STORAGE_DATA(29),
      Q(1) => STORAGE_DATA(30),
      Q(0) => STORAGE_DATA(31),
      user_clk => user_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL is
  port (
    gen_cc_i : out STD_LOGIC;
    do_cc_r : out STD_LOGIC;
    s_axi_nfc_tx_tready : out STD_LOGIC;
    tx_dst_rdy : out STD_LOGIC;
    gen_scp_striped_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    gen_ecp_i : out STD_LOGIC;
    gen_snf_striped_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_tx_tready : out STD_LOGIC;
    \tx_pe_data_v_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \gen_pad_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \tx_pe_data_r_reg[0]\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \fc_nb_r_reg[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    user_clk : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    do_nfc_r : in STD_LOGIC;
    Q : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tvalid : in STD_LOGIC;
    do_nfc_r_reg : in STD_LOGIC;
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 3 );
    new_pkt_r_reg : in STD_LOGIC;
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 31 );
    s_axi_nfc_nb : in STD_LOGIC_VECTOR ( 0 to 3 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL : entity is "dnpcie_aurora_2_sim_TX_LL";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL is
  signal \^do_cc_r\ : STD_LOGIC;
  signal pdu_ok_c : STD_LOGIC;
  signal \^s_axi_nfc_tx_tready\ : STD_LOGIC;
  signal storage_pad_r0 : STD_LOGIC;
  signal storage_v_r0 : STD_LOGIC;
  signal \^tx_dst_rdy\ : STD_LOGIC;
  signal tx_ll_control_i_n_12 : STD_LOGIC;
  signal tx_ll_control_i_n_9 : STD_LOGIC;
  signal tx_ll_datapath_i_n_0 : STD_LOGIC;
begin
  do_cc_r <= \^do_cc_r\;
  s_axi_nfc_tx_tready <= \^s_axi_nfc_tx_tready\;
  tx_dst_rdy <= \^tx_dst_rdy\;
tx_ll_control_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL_CONTROL
     port map (
      D(0) => tx_ll_control_i_n_9,
      E(0) => pdu_ok_c,
      Q => Q,
      do_nfc_r => do_nfc_r,
      do_nfc_r_reg_0 => do_nfc_r_reg,
      \fc_nb_r_reg[0]\(3 downto 0) => \fc_nb_r_reg[0]\(3 downto 0),
      gen_cc_flop_0_i_0 => \^do_cc_r\,
      gen_cc_i => gen_cc_i,
      gen_ecp_i => gen_ecp_i,
      gen_scp_striped_i(0) => gen_scp_striped_i(0),
      gen_snf_striped_i(0) => gen_snf_striped_i(0),
      idle_r_reg_0 => \^tx_dst_rdy\,
      in_frame_r_reg => tx_ll_control_i_n_12,
      in_frame_r_reg_0 => tx_ll_datapath_i_n_0,
      new_pkt_r_reg => new_pkt_r_reg,
      p_0_in => p_0_in,
      s_axi_nfc_nb(0 to 3) => s_axi_nfc_nb(0 to 3),
      s_axi_nfc_tx_tready => \^s_axi_nfc_tx_tready\,
      s_axi_tx_tkeep(0 to 3) => s_axi_tx_tkeep(0 to 3),
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tready => s_axi_tx_tready,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      storage_pad_r0 => storage_pad_r0,
      storage_v_r0 => storage_v_r0,
      user_clk => user_clk
    );
tx_ll_datapath_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL_DATAPATH
     port map (
      D(0) => tx_ll_control_i_n_9,
      E(0) => pdu_ok_c,
      TX_DST_RDY_N_reg => tx_ll_control_i_n_12,
      do_cc_r => \^do_cc_r\,
      do_nfc_r_reg => \^s_axi_nfc_tx_tready\,
      \gen_pad_r_reg[0]_0\(1 downto 0) => \gen_pad_r_reg[0]\(1 downto 0),
      new_pkt_r_reg => new_pkt_r_reg,
      p_0_in => p_0_in,
      s_axi_tx_tdata(0 to 31) => s_axi_tx_tdata(0 to 31),
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      storage_pad_r0 => storage_pad_r0,
      storage_v_r0 => storage_v_r0,
      tx_dst_rdy => \^tx_dst_rdy\,
      \tx_pe_data_r_reg[0]_0\(31 downto 0) => \tx_pe_data_r_reg[0]\(31 downto 0),
      \tx_pe_data_v_r_reg[0]_0\(1 downto 0) => \tx_pe_data_v_r_reg[0]\(1 downto 0),
      \tx_pe_data_v_r_reg[1]_0\ => tx_ll_datapath_i_n_0,
      user_clk => user_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gthe3_channel_wrapper is
  port (
    cpllfbclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    cplllock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    cpllrefclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    drprdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    eyescandataerror_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtpowergood_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclkmonitor_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcierategen3_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcierateidle_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pciesynctxsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieusergen3rdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserphystatusrst_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserratestart_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    phystatus_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    resetexception_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbyteisaligned_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbyterealign_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrlock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrphdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanbondseq_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanisaligned_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanrealign_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcominitdet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcommadet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcomsasdet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcomwakedet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlysresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxelecidle_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstarted_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobestarted_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclkfabric_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclkpcs_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxphaligndone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalignerr_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbserr_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbslocked_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprgdivresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxqpisenn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxqpisenp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxratedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxrecclkout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsliderdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipoutclkrdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslippmardy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxvalid_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txcomfinish_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txdlysresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclkfabric_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclkpcs_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txphaligndone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txphinitdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txprgdivresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txqpisenn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txqpisenp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txratedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcsrsvdout_out : out STD_LOGIC_VECTOR ( 11 downto 0 );
    rxdata_out : out STD_LOGIC_VECTOR ( 127 downto 0 );
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rxctrl0_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rxctrl1_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dmonitorout_out : out STD_LOGIC_VECTOR ( 16 downto 0 );
    pcierateqpllpd_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    pcierateqpllreset_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxclkcorcnt_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxdatavalid_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxheadervalid_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxstartofseq_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    bufgtce_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtcemask_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtreset_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtrstmask_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxchbondo_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rxheader_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    pinrsrvdas_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxctrl2_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxctrl3_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxdataextendrsvd_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    bufgtdiv_out : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rst_in0 : out STD_LOGIC;
    cfgreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    clkrsvd0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    clkrsvd1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cplllockdetclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cplllocken_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.cpllpd_ch_int\ : in STD_LOGIC;
    cpllreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    dmonfiforeset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    dmonitorclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpwe_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphicaldone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphicalstart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphidrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphidwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphixrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphixwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescanmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescanreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescantrigger_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtgrefclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxn_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxp_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtresetsel_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.gtrxreset_int\ : in STD_LOGIC;
    gtsouthrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.gttxreset_int\ : in STD_LOGIC;
    lpbkrxtxseren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    lpbktxrxseren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcieeqrxeqadaptdone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcierstidle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pciersttxsyncstart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserratedone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0clk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0refclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1clk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1refclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    resetovrd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rstclkentx_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rx8b10ben_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxbufreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrfreqreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrresetrsv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbonden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbondmaster_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbondslave_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcommadeten_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeagchold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeagcovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelfovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelpmreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap10hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap10ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap11hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap11ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap12hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap12ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap13hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap13ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap14hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap14ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap15hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap15ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap2hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap2ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap3hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap3ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap4hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap4ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap5hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap5ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap6hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap6ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap7hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap7ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap8hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap8ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap9hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap9ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeuthold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeutovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevphold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevpovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevsen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfexyden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlybypass_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlyen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlyovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlysreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxgearboxslip_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlatclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmgchold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmgcovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmhfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmhfovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmlfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmlfklovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmoshold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmosovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxmcommaalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoobreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoscalreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoshold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinten_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinthold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobe_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinttestovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpcommaalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpcsreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalign_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphdlypd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphdlyreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpmareset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpolarity_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbscntreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.rxprogdivreset_int\ : in STD_LOGIC;
    rxqpien_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxratemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslide_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipoutclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslippma_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncallin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.rxuserrdy_int\ : in STD_LOGIC;
    rxusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sigvalidclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx8b10ben_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcominit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcomsas_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcomwake_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdeemph_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdetectrx_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdiffpd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlybypass_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlysreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyupdown_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txelecidle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txinhibit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txlatclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpcsreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpdelecidlemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphalign_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlypd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlyreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlytstclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphinit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmpd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmsel_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpisopd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpmareset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpolarity_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpostcursorinv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txprbsforceerr_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txprecursorinv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.txprogdivreset_int\ : in STD_LOGIC;
    txqpibiasen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txqpistrongpdown_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txqpiweakpup_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txratemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txswing_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncallin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.txuserrdy_int\ : in STD_LOGIC;
    txusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userdata_tx_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gtrsvd_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    pcsrsvdin_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txctrl0_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txctrl1_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rxdfeagcctrl_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxelecidlemode_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxpllclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxsysclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txpllclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txsysclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cpllrefclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxchbondlevel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxoutclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txbufdiffctrl_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txmargin_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txoutclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxosintcfg_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxprbssel_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    txprbssel_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pcsrsvdin2_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    pmarsvdin_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    rxchbondi_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txpippmstepsize_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txheader_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    txmaincursor_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    txsequence_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    tx8b10bbypass_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txctrl2_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txdataextendrsvd_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gthe3_channel_wrapper : entity is "dnpcie_aurora_2_sim_gt_gthe3_channel_wrapper";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gthe3_channel_wrapper;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gthe3_channel_wrapper is
begin
channel_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_gthe3_channel
     port map (
      bufgtce_out(2 downto 0) => bufgtce_out(2 downto 0),
      bufgtcemask_out(2 downto 0) => bufgtcemask_out(2 downto 0),
      bufgtdiv_out(8 downto 0) => bufgtdiv_out(8 downto 0),
      bufgtreset_out(2 downto 0) => bufgtreset_out(2 downto 0),
      bufgtrstmask_out(2 downto 0) => bufgtrstmask_out(2 downto 0),
      cfgreset_in(0) => cfgreset_in(0),
      clkrsvd0_in(0) => clkrsvd0_in(0),
      clkrsvd1_in(0) => clkrsvd1_in(0),
      cpllfbclklost_out(0) => cpllfbclklost_out(0),
      cplllock_out(0) => cplllock_out(0),
      cplllockdetclk_in(0) => cplllockdetclk_in(0),
      cplllocken_in(0) => cplllocken_in(0),
      cpllrefclklost_out(0) => cpllrefclklost_out(0),
      cpllrefclksel_in(2 downto 0) => cpllrefclksel_in(2 downto 0),
      cpllreset_in(0) => cpllreset_in(0),
      dmonfiforeset_in(0) => dmonfiforeset_in(0),
      dmonitorclk_in(0) => dmonitorclk_in(0),
      dmonitorout_out(16 downto 0) => dmonitorout_out(16 downto 0),
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in(0) => drpclk_in(0),
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in(0) => drpen_in(0),
      drprdy_out(0) => drprdy_out(0),
      drpwe_in(0) => drpwe_in(0),
      evoddphicaldone_in(0) => evoddphicaldone_in(0),
      evoddphicalstart_in(0) => evoddphicalstart_in(0),
      evoddphidrden_in(0) => evoddphidrden_in(0),
      evoddphidwren_in(0) => evoddphidwren_in(0),
      evoddphixrden_in(0) => evoddphixrden_in(0),
      evoddphixwren_in(0) => evoddphixwren_in(0),
      eyescandataerror_out(0) => eyescandataerror_out(0),
      eyescanmode_in(0) => eyescanmode_in(0),
      eyescanreset_in(0) => eyescanreset_in(0),
      eyescantrigger_in(0) => eyescantrigger_in(0),
      \gen_gtwizard_gthe3.cpllpd_ch_int\ => \gen_gtwizard_gthe3.cpllpd_ch_int\,
      \gen_gtwizard_gthe3.gtrxreset_int\ => \gen_gtwizard_gthe3.gtrxreset_int\,
      \gen_gtwizard_gthe3.gttxreset_int\ => \gen_gtwizard_gthe3.gttxreset_int\,
      \gen_gtwizard_gthe3.rxprogdivreset_int\ => \gen_gtwizard_gthe3.rxprogdivreset_int\,
      \gen_gtwizard_gthe3.rxuserrdy_int\ => \gen_gtwizard_gthe3.rxuserrdy_int\,
      \gen_gtwizard_gthe3.txprogdivreset_int\ => \gen_gtwizard_gthe3.txprogdivreset_int\,
      \gen_gtwizard_gthe3.txuserrdy_int\ => \gen_gtwizard_gthe3.txuserrdy_int\,
      gtgrefclk_in(0) => gtgrefclk_in(0),
      gthrxn_in(0) => gthrxn_in(0),
      gthrxp_in(0) => gthrxp_in(0),
      gthtxn_out(0) => gthtxn_out(0),
      gthtxp_out(0) => gthtxp_out(0),
      gtnorthrefclk0_in(0) => gtnorthrefclk0_in(0),
      gtnorthrefclk1_in(0) => gtnorthrefclk1_in(0),
      gtpowergood_out(0) => gtpowergood_out(0),
      gtrefclk0_in(0) => gtrefclk0_in(0),
      gtrefclk1_in(0) => gtrefclk1_in(0),
      gtrefclkmonitor_out(0) => gtrefclkmonitor_out(0),
      gtresetsel_in(0) => gtresetsel_in(0),
      gtrsvd_in(15 downto 0) => gtrsvd_in(15 downto 0),
      gtsouthrefclk0_in(0) => gtsouthrefclk0_in(0),
      gtsouthrefclk1_in(0) => gtsouthrefclk1_in(0),
      gtwiz_userdata_tx_in(31 downto 0) => gtwiz_userdata_tx_in(31 downto 0),
      loopback_in(2 downto 0) => loopback_in(2 downto 0),
      lpbkrxtxseren_in(0) => lpbkrxtxseren_in(0),
      lpbktxrxseren_in(0) => lpbktxrxseren_in(0),
      pcieeqrxeqadaptdone_in(0) => pcieeqrxeqadaptdone_in(0),
      pcierategen3_out(0) => pcierategen3_out(0),
      pcierateidle_out(0) => pcierateidle_out(0),
      pcierateqpllpd_out(1 downto 0) => pcierateqpllpd_out(1 downto 0),
      pcierateqpllreset_out(1 downto 0) => pcierateqpllreset_out(1 downto 0),
      pcierstidle_in(0) => pcierstidle_in(0),
      pciersttxsyncstart_in(0) => pciersttxsyncstart_in(0),
      pciesynctxsyncdone_out(0) => pciesynctxsyncdone_out(0),
      pcieusergen3rdy_out(0) => pcieusergen3rdy_out(0),
      pcieuserphystatusrst_out(0) => pcieuserphystatusrst_out(0),
      pcieuserratedone_in(0) => pcieuserratedone_in(0),
      pcieuserratestart_out(0) => pcieuserratestart_out(0),
      pcsrsvdin2_in(4 downto 0) => pcsrsvdin2_in(4 downto 0),
      pcsrsvdin_in(15 downto 0) => pcsrsvdin_in(15 downto 0),
      pcsrsvdout_out(11 downto 0) => pcsrsvdout_out(11 downto 0),
      phystatus_out(0) => phystatus_out(0),
      pinrsrvdas_out(7 downto 0) => pinrsrvdas_out(7 downto 0),
      pmarsvdin_in(4 downto 0) => pmarsvdin_in(4 downto 0),
      qpll0clk_in(0) => qpll0clk_in(0),
      qpll0refclk_in(0) => qpll0refclk_in(0),
      qpll1clk_in(0) => qpll1clk_in(0),
      qpll1refclk_in(0) => qpll1refclk_in(0),
      resetexception_out(0) => resetexception_out(0),
      resetovrd_in(0) => resetovrd_in(0),
      rst_in0 => rst_in0,
      rstclkentx_in(0) => rstclkentx_in(0),
      rx8b10ben_in(0) => rx8b10ben_in(0),
      rxbufreset_in(0) => rxbufreset_in(0),
      rxbufstatus_out(2 downto 0) => rxbufstatus_out(2 downto 0),
      rxbyteisaligned_out(0) => rxbyteisaligned_out(0),
      rxbyterealign_out(0) => rxbyterealign_out(0),
      rxcdrfreqreset_in(0) => rxcdrfreqreset_in(0),
      rxcdrhold_in(0) => rxcdrhold_in(0),
      rxcdrlock_out(0) => rxcdrlock_out(0),
      rxcdrovrden_in(0) => rxcdrovrden_in(0),
      rxcdrphdone_out(0) => rxcdrphdone_out(0),
      rxcdrreset_in(0) => rxcdrreset_in(0),
      rxcdrresetrsv_in(0) => rxcdrresetrsv_in(0),
      rxchanbondseq_out(0) => rxchanbondseq_out(0),
      rxchanisaligned_out(0) => rxchanisaligned_out(0),
      rxchanrealign_out(0) => rxchanrealign_out(0),
      rxchbonden_in(0) => rxchbonden_in(0),
      rxchbondi_in(4 downto 0) => rxchbondi_in(4 downto 0),
      rxchbondlevel_in(2 downto 0) => rxchbondlevel_in(2 downto 0),
      rxchbondmaster_in(0) => rxchbondmaster_in(0),
      rxchbondo_out(4 downto 0) => rxchbondo_out(4 downto 0),
      rxchbondslave_in(0) => rxchbondslave_in(0),
      rxclkcorcnt_out(1 downto 0) => rxclkcorcnt_out(1 downto 0),
      rxcominitdet_out(0) => rxcominitdet_out(0),
      rxcommadet_out(0) => rxcommadet_out(0),
      rxcommadeten_in(0) => rxcommadeten_in(0),
      rxcomsasdet_out(0) => rxcomsasdet_out(0),
      rxcomwakedet_out(0) => rxcomwakedet_out(0),
      rxctrl0_out(15 downto 0) => rxctrl0_out(15 downto 0),
      rxctrl1_out(15 downto 0) => rxctrl1_out(15 downto 0),
      rxctrl2_out(7 downto 0) => rxctrl2_out(7 downto 0),
      rxctrl3_out(7 downto 0) => rxctrl3_out(7 downto 0),
      rxdata_out(127 downto 0) => rxdata_out(127 downto 0),
      rxdataextendrsvd_out(7 downto 0) => rxdataextendrsvd_out(7 downto 0),
      rxdatavalid_out(1 downto 0) => rxdatavalid_out(1 downto 0),
      rxdfeagcctrl_in(1 downto 0) => rxdfeagcctrl_in(1 downto 0),
      rxdfeagchold_in(0) => rxdfeagchold_in(0),
      rxdfeagcovrden_in(0) => rxdfeagcovrden_in(0),
      rxdfelfhold_in(0) => rxdfelfhold_in(0),
      rxdfelfovrden_in(0) => rxdfelfovrden_in(0),
      rxdfelpmreset_in(0) => rxdfelpmreset_in(0),
      rxdfetap10hold_in(0) => rxdfetap10hold_in(0),
      rxdfetap10ovrden_in(0) => rxdfetap10ovrden_in(0),
      rxdfetap11hold_in(0) => rxdfetap11hold_in(0),
      rxdfetap11ovrden_in(0) => rxdfetap11ovrden_in(0),
      rxdfetap12hold_in(0) => rxdfetap12hold_in(0),
      rxdfetap12ovrden_in(0) => rxdfetap12ovrden_in(0),
      rxdfetap13hold_in(0) => rxdfetap13hold_in(0),
      rxdfetap13ovrden_in(0) => rxdfetap13ovrden_in(0),
      rxdfetap14hold_in(0) => rxdfetap14hold_in(0),
      rxdfetap14ovrden_in(0) => rxdfetap14ovrden_in(0),
      rxdfetap15hold_in(0) => rxdfetap15hold_in(0),
      rxdfetap15ovrden_in(0) => rxdfetap15ovrden_in(0),
      rxdfetap2hold_in(0) => rxdfetap2hold_in(0),
      rxdfetap2ovrden_in(0) => rxdfetap2ovrden_in(0),
      rxdfetap3hold_in(0) => rxdfetap3hold_in(0),
      rxdfetap3ovrden_in(0) => rxdfetap3ovrden_in(0),
      rxdfetap4hold_in(0) => rxdfetap4hold_in(0),
      rxdfetap4ovrden_in(0) => rxdfetap4ovrden_in(0),
      rxdfetap5hold_in(0) => rxdfetap5hold_in(0),
      rxdfetap5ovrden_in(0) => rxdfetap5ovrden_in(0),
      rxdfetap6hold_in(0) => rxdfetap6hold_in(0),
      rxdfetap6ovrden_in(0) => rxdfetap6ovrden_in(0),
      rxdfetap7hold_in(0) => rxdfetap7hold_in(0),
      rxdfetap7ovrden_in(0) => rxdfetap7ovrden_in(0),
      rxdfetap8hold_in(0) => rxdfetap8hold_in(0),
      rxdfetap8ovrden_in(0) => rxdfetap8ovrden_in(0),
      rxdfetap9hold_in(0) => rxdfetap9hold_in(0),
      rxdfetap9ovrden_in(0) => rxdfetap9ovrden_in(0),
      rxdfeuthold_in(0) => rxdfeuthold_in(0),
      rxdfeutovrden_in(0) => rxdfeutovrden_in(0),
      rxdfevphold_in(0) => rxdfevphold_in(0),
      rxdfevpovrden_in(0) => rxdfevpovrden_in(0),
      rxdfevsen_in(0) => rxdfevsen_in(0),
      rxdfexyden_in(0) => rxdfexyden_in(0),
      rxdlybypass_in(0) => rxdlybypass_in(0),
      rxdlyen_in(0) => rxdlyen_in(0),
      rxdlyovrden_in(0) => rxdlyovrden_in(0),
      rxdlysreset_in(0) => rxdlysreset_in(0),
      rxdlysresetdone_out(0) => rxdlysresetdone_out(0),
      rxelecidle_out(0) => rxelecidle_out(0),
      rxelecidlemode_in(1 downto 0) => rxelecidlemode_in(1 downto 0),
      rxgearboxslip_in(0) => rxgearboxslip_in(0),
      rxheader_out(5 downto 0) => rxheader_out(5 downto 0),
      rxheadervalid_out(1 downto 0) => rxheadervalid_out(1 downto 0),
      rxlatclk_in(0) => rxlatclk_in(0),
      rxlpmen_in(0) => rxlpmen_in(0),
      rxlpmgchold_in(0) => rxlpmgchold_in(0),
      rxlpmgcovrden_in(0) => rxlpmgcovrden_in(0),
      rxlpmhfhold_in(0) => rxlpmhfhold_in(0),
      rxlpmhfovrden_in(0) => rxlpmhfovrden_in(0),
      rxlpmlfhold_in(0) => rxlpmlfhold_in(0),
      rxlpmlfklovrden_in(0) => rxlpmlfklovrden_in(0),
      rxlpmoshold_in(0) => rxlpmoshold_in(0),
      rxlpmosovrden_in(0) => rxlpmosovrden_in(0),
      rxmcommaalignen_in(0) => rxmcommaalignen_in(0),
      rxmonitorout_out(6 downto 0) => rxmonitorout_out(6 downto 0),
      rxmonitorsel_in(1 downto 0) => rxmonitorsel_in(1 downto 0),
      rxoobreset_in(0) => rxoobreset_in(0),
      rxoscalreset_in(0) => rxoscalreset_in(0),
      rxoshold_in(0) => rxoshold_in(0),
      rxosintcfg_in(3 downto 0) => rxosintcfg_in(3 downto 0),
      rxosintdone_out(0) => rxosintdone_out(0),
      rxosinten_in(0) => rxosinten_in(0),
      rxosinthold_in(0) => rxosinthold_in(0),
      rxosintovrden_in(0) => rxosintovrden_in(0),
      rxosintstarted_out(0) => rxosintstarted_out(0),
      rxosintstrobe_in(0) => rxosintstrobe_in(0),
      rxosintstrobedone_out(0) => rxosintstrobedone_out(0),
      rxosintstrobestarted_out(0) => rxosintstrobestarted_out(0),
      rxosinttestovrden_in(0) => rxosinttestovrden_in(0),
      rxosovrden_in(0) => rxosovrden_in(0),
      rxoutclk_out(0) => rxoutclk_out(0),
      rxoutclkfabric_out(0) => rxoutclkfabric_out(0),
      rxoutclkpcs_out(0) => rxoutclkpcs_out(0),
      rxoutclksel_in(2 downto 0) => rxoutclksel_in(2 downto 0),
      rxpcommaalignen_in(0) => rxpcommaalignen_in(0),
      rxpcsreset_in(0) => rxpcsreset_in(0),
      rxpd_in(1 downto 0) => rxpd_in(1 downto 0),
      rxphalign_in(0) => rxphalign_in(0),
      rxphaligndone_out(0) => rxphaligndone_out(0),
      rxphalignen_in(0) => rxphalignen_in(0),
      rxphalignerr_out(0) => rxphalignerr_out(0),
      rxphdlypd_in(0) => rxphdlypd_in(0),
      rxphdlyreset_in(0) => rxphdlyreset_in(0),
      rxphovrden_in(0) => rxphovrden_in(0),
      rxpllclksel_in(1 downto 0) => rxpllclksel_in(1 downto 0),
      rxpmareset_in(0) => rxpmareset_in(0),
      rxpmaresetdone_out(0) => rxpmaresetdone_out(0),
      rxpolarity_in(0) => rxpolarity_in(0),
      rxprbscntreset_in(0) => rxprbscntreset_in(0),
      rxprbserr_out(0) => rxprbserr_out(0),
      rxprbslocked_out(0) => rxprbslocked_out(0),
      rxprbssel_in(3 downto 0) => rxprbssel_in(3 downto 0),
      rxprgdivresetdone_out(0) => rxprgdivresetdone_out(0),
      rxqpien_in(0) => rxqpien_in(0),
      rxqpisenn_out(0) => rxqpisenn_out(0),
      rxqpisenp_out(0) => rxqpisenp_out(0),
      rxrate_in(2 downto 0) => rxrate_in(2 downto 0),
      rxratedone_out(0) => rxratedone_out(0),
      rxratemode_in(0) => rxratemode_in(0),
      rxrecclkout_out(0) => rxrecclkout_out(0),
      rxresetdone_out(0) => rxresetdone_out(0),
      rxslide_in(0) => rxslide_in(0),
      rxsliderdy_out(0) => rxsliderdy_out(0),
      rxslipdone_out(0) => rxslipdone_out(0),
      rxslipoutclk_in(0) => rxslipoutclk_in(0),
      rxslipoutclkrdy_out(0) => rxslipoutclkrdy_out(0),
      rxslippma_in(0) => rxslippma_in(0),
      rxslippmardy_out(0) => rxslippmardy_out(0),
      rxstartofseq_out(1 downto 0) => rxstartofseq_out(1 downto 0),
      rxstatus_out(2 downto 0) => rxstatus_out(2 downto 0),
      rxsyncallin_in(0) => rxsyncallin_in(0),
      rxsyncdone_out(0) => rxsyncdone_out(0),
      rxsyncin_in(0) => rxsyncin_in(0),
      rxsyncmode_in(0) => rxsyncmode_in(0),
      rxsyncout_out(0) => rxsyncout_out(0),
      rxsysclksel_in(1 downto 0) => rxsysclksel_in(1 downto 0),
      rxusrclk2_in(0) => rxusrclk2_in(0),
      rxusrclk_in(0) => rxusrclk_in(0),
      rxvalid_out(0) => rxvalid_out(0),
      sigvalidclk_in(0) => sigvalidclk_in(0),
      tx8b10bbypass_in(7 downto 0) => tx8b10bbypass_in(7 downto 0),
      tx8b10ben_in(0) => tx8b10ben_in(0),
      txbufdiffctrl_in(2 downto 0) => txbufdiffctrl_in(2 downto 0),
      txbufstatus_out(1 downto 0) => txbufstatus_out(1 downto 0),
      txcomfinish_out(0) => txcomfinish_out(0),
      txcominit_in(0) => txcominit_in(0),
      txcomsas_in(0) => txcomsas_in(0),
      txcomwake_in(0) => txcomwake_in(0),
      txctrl0_in(15 downto 0) => txctrl0_in(15 downto 0),
      txctrl1_in(15 downto 0) => txctrl1_in(15 downto 0),
      txctrl2_in(7 downto 0) => txctrl2_in(7 downto 0),
      txdataextendrsvd_in(7 downto 0) => txdataextendrsvd_in(7 downto 0),
      txdeemph_in(0) => txdeemph_in(0),
      txdetectrx_in(0) => txdetectrx_in(0),
      txdiffctrl_in(3 downto 0) => txdiffctrl_in(3 downto 0),
      txdiffpd_in(0) => txdiffpd_in(0),
      txdlybypass_in(0) => txdlybypass_in(0),
      txdlyen_in(0) => txdlyen_in(0),
      txdlyhold_in(0) => txdlyhold_in(0),
      txdlyovrden_in(0) => txdlyovrden_in(0),
      txdlysreset_in(0) => txdlysreset_in(0),
      txdlysresetdone_out(0) => txdlysresetdone_out(0),
      txdlyupdown_in(0) => txdlyupdown_in(0),
      txelecidle_in(0) => txelecidle_in(0),
      txheader_in(5 downto 0) => txheader_in(5 downto 0),
      txinhibit_in(0) => txinhibit_in(0),
      txlatclk_in(0) => txlatclk_in(0),
      txmaincursor_in(6 downto 0) => txmaincursor_in(6 downto 0),
      txmargin_in(2 downto 0) => txmargin_in(2 downto 0),
      txoutclk_out(0) => txoutclk_out(0),
      txoutclkfabric_out(0) => txoutclkfabric_out(0),
      txoutclkpcs_out(0) => txoutclkpcs_out(0),
      txoutclksel_in(2 downto 0) => txoutclksel_in(2 downto 0),
      txpcsreset_in(0) => txpcsreset_in(0),
      txpd_in(1 downto 0) => txpd_in(1 downto 0),
      txpdelecidlemode_in(0) => txpdelecidlemode_in(0),
      txphalign_in(0) => txphalign_in(0),
      txphaligndone_out(0) => txphaligndone_out(0),
      txphalignen_in(0) => txphalignen_in(0),
      txphdlypd_in(0) => txphdlypd_in(0),
      txphdlyreset_in(0) => txphdlyreset_in(0),
      txphdlytstclk_in(0) => txphdlytstclk_in(0),
      txphinit_in(0) => txphinit_in(0),
      txphinitdone_out(0) => txphinitdone_out(0),
      txphovrden_in(0) => txphovrden_in(0),
      txpippmen_in(0) => txpippmen_in(0),
      txpippmovrden_in(0) => txpippmovrden_in(0),
      txpippmpd_in(0) => txpippmpd_in(0),
      txpippmsel_in(0) => txpippmsel_in(0),
      txpippmstepsize_in(4 downto 0) => txpippmstepsize_in(4 downto 0),
      txpisopd_in(0) => txpisopd_in(0),
      txpllclksel_in(1 downto 0) => txpllclksel_in(1 downto 0),
      txpmareset_in(0) => txpmareset_in(0),
      txpmaresetdone_out(0) => txpmaresetdone_out(0),
      txpolarity_in(0) => txpolarity_in(0),
      txpostcursor_in(4 downto 0) => txpostcursor_in(4 downto 0),
      txpostcursorinv_in(0) => txpostcursorinv_in(0),
      txprbsforceerr_in(0) => txprbsforceerr_in(0),
      txprbssel_in(3 downto 0) => txprbssel_in(3 downto 0),
      txprecursor_in(4 downto 0) => txprecursor_in(4 downto 0),
      txprecursorinv_in(0) => txprecursorinv_in(0),
      txprgdivresetdone_out(0) => txprgdivresetdone_out(0),
      txqpibiasen_in(0) => txqpibiasen_in(0),
      txqpisenn_out(0) => txqpisenn_out(0),
      txqpisenp_out(0) => txqpisenp_out(0),
      txqpistrongpdown_in(0) => txqpistrongpdown_in(0),
      txqpiweakpup_in(0) => txqpiweakpup_in(0),
      txrate_in(2 downto 0) => txrate_in(2 downto 0),
      txratedone_out(0) => txratedone_out(0),
      txratemode_in(0) => txratemode_in(0),
      txresetdone_out(0) => txresetdone_out(0),
      txsequence_in(6 downto 0) => txsequence_in(6 downto 0),
      txswing_in(0) => txswing_in(0),
      txsyncallin_in(0) => txsyncallin_in(0),
      txsyncdone_out(0) => txsyncdone_out(0),
      txsyncin_in(0) => txsyncin_in(0),
      txsyncmode_in(0) => txsyncmode_in(0),
      txsyncout_out(0) => txsyncout_out(0),
      txsysclksel_in(1 downto 0) => txsysclksel_in(1 downto 0),
      txusrclk2_in(0) => txusrclk2_in(0),
      txusrclk_in(0) => txusrclk_in(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_hotplug is
  port (
    link_reset_out : out STD_LOGIC;
    user_clk : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_hotplug : entity is "dnpcie_aurora_2_sim_hotplug";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_hotplug;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_hotplug is
  signal cc_sync : STD_LOGIC;
  signal count_for_reset_r : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal \count_for_reset_r0_carry__0_n_0\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_1\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_10\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_11\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_12\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_13\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_14\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_15\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_2\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_3\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_5\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_6\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_7\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_8\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__0_n_9\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_1\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_10\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_11\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_12\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_13\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_14\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_15\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_2\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_3\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_5\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_6\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_7\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_8\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__1_n_9\ : STD_LOGIC;
  signal \count_for_reset_r0_carry__2_n_15\ : STD_LOGIC;
  signal count_for_reset_r0_carry_n_0 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_1 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_10 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_11 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_12 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_13 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_14 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_15 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_2 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_3 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_5 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_6 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_7 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_8 : STD_LOGIC;
  signal count_for_reset_r0_carry_n_9 : STD_LOGIC;
  signal \count_for_reset_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_for_reset_r[25]_i_2_n_0\ : STD_LOGIC;
  signal \count_for_reset_r[25]_i_3_n_0\ : STD_LOGIC;
  signal \count_for_reset_r[25]_i_4_n_0\ : STD_LOGIC;
  signal \count_for_reset_r[25]_i_5_n_0\ : STD_LOGIC;
  signal \count_for_reset_r[25]_i_6_n_0\ : STD_LOGIC;
  signal count_for_reset_r_0 : STD_LOGIC_VECTOR ( 25 downto 1 );
  signal link_reset_0 : STD_LOGIC;
  signal link_reset_0_i_1_n_0 : STD_LOGIC;
  signal link_reset_0_i_2_n_0 : STD_LOGIC;
  signal link_reset_0_i_3_n_0 : STD_LOGIC;
  signal link_reset_0_i_4_n_0 : STD_LOGIC;
  signal link_reset_0_i_5_n_0 : STD_LOGIC;
  signal link_reset_0_i_6_n_0 : STD_LOGIC;
  signal link_reset_0_i_7_n_0 : STD_LOGIC;
  signal rx_cc_extend_r : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rx_cc_extend_r2 : STD_LOGIC;
  signal rx_cc_extend_r2_i_1_n_0 : STD_LOGIC;
  signal rx_cc_extend_r2_i_2_n_0 : STD_LOGIC;
  signal NLW_count_for_reset_r0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_count_for_reset_r0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_count_for_reset_r0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_count_for_reset_r0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_count_for_reset_r0_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_for_reset_r[25]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of link_reset_0_i_3 : label is "soft_lutpair7";
begin
count_for_reset_r0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => count_for_reset_r(0),
      CI_TOP => '0',
      CO(7) => count_for_reset_r0_carry_n_0,
      CO(6) => count_for_reset_r0_carry_n_1,
      CO(5) => count_for_reset_r0_carry_n_2,
      CO(4) => count_for_reset_r0_carry_n_3,
      CO(3) => NLW_count_for_reset_r0_carry_CO_UNCONNECTED(3),
      CO(2) => count_for_reset_r0_carry_n_5,
      CO(1) => count_for_reset_r0_carry_n_6,
      CO(0) => count_for_reset_r0_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7) => count_for_reset_r0_carry_n_8,
      O(6) => count_for_reset_r0_carry_n_9,
      O(5) => count_for_reset_r0_carry_n_10,
      O(4) => count_for_reset_r0_carry_n_11,
      O(3) => count_for_reset_r0_carry_n_12,
      O(2) => count_for_reset_r0_carry_n_13,
      O(1) => count_for_reset_r0_carry_n_14,
      O(0) => count_for_reset_r0_carry_n_15,
      S(7 downto 0) => count_for_reset_r(8 downto 1)
    );
\count_for_reset_r0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => count_for_reset_r0_carry_n_0,
      CI_TOP => '0',
      CO(7) => \count_for_reset_r0_carry__0_n_0\,
      CO(6) => \count_for_reset_r0_carry__0_n_1\,
      CO(5) => \count_for_reset_r0_carry__0_n_2\,
      CO(4) => \count_for_reset_r0_carry__0_n_3\,
      CO(3) => \NLW_count_for_reset_r0_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \count_for_reset_r0_carry__0_n_5\,
      CO(1) => \count_for_reset_r0_carry__0_n_6\,
      CO(0) => \count_for_reset_r0_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \count_for_reset_r0_carry__0_n_8\,
      O(6) => \count_for_reset_r0_carry__0_n_9\,
      O(5) => \count_for_reset_r0_carry__0_n_10\,
      O(4) => \count_for_reset_r0_carry__0_n_11\,
      O(3) => \count_for_reset_r0_carry__0_n_12\,
      O(2) => \count_for_reset_r0_carry__0_n_13\,
      O(1) => \count_for_reset_r0_carry__0_n_14\,
      O(0) => \count_for_reset_r0_carry__0_n_15\,
      S(7 downto 0) => count_for_reset_r(16 downto 9)
    );
\count_for_reset_r0_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \count_for_reset_r0_carry__0_n_0\,
      CI_TOP => '0',
      CO(7) => \count_for_reset_r0_carry__1_n_0\,
      CO(6) => \count_for_reset_r0_carry__1_n_1\,
      CO(5) => \count_for_reset_r0_carry__1_n_2\,
      CO(4) => \count_for_reset_r0_carry__1_n_3\,
      CO(3) => \NLW_count_for_reset_r0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \count_for_reset_r0_carry__1_n_5\,
      CO(1) => \count_for_reset_r0_carry__1_n_6\,
      CO(0) => \count_for_reset_r0_carry__1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \count_for_reset_r0_carry__1_n_8\,
      O(6) => \count_for_reset_r0_carry__1_n_9\,
      O(5) => \count_for_reset_r0_carry__1_n_10\,
      O(4) => \count_for_reset_r0_carry__1_n_11\,
      O(3) => \count_for_reset_r0_carry__1_n_12\,
      O(2) => \count_for_reset_r0_carry__1_n_13\,
      O(1) => \count_for_reset_r0_carry__1_n_14\,
      O(0) => \count_for_reset_r0_carry__1_n_15\,
      S(7 downto 0) => count_for_reset_r(24 downto 17)
    );
\count_for_reset_r0_carry__2\: unisim.vcomponents.CARRY8
     port map (
      CI => \count_for_reset_r0_carry__1_n_0\,
      CI_TOP => '0',
      CO(7 downto 0) => \NLW_count_for_reset_r0_carry__2_CO_UNCONNECTED\(7 downto 0),
      DI(7 downto 0) => B"00000000",
      O(7 downto 1) => \NLW_count_for_reset_r0_carry__2_O_UNCONNECTED\(7 downto 1),
      O(0) => \count_for_reset_r0_carry__2_n_15\,
      S(7 downto 1) => B"0000000",
      S(0) => count_for_reset_r(25)
    );
\count_for_reset_r[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFEFFF"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => count_for_reset_r(0),
      O => \count_for_reset_r[0]_i_1_n_0\
    );
\count_for_reset_r[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__0_n_14\,
      O => count_for_reset_r_0(10)
    );
\count_for_reset_r[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__0_n_13\,
      O => count_for_reset_r_0(11)
    );
\count_for_reset_r[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__0_n_12\,
      O => count_for_reset_r_0(12)
    );
\count_for_reset_r[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__0_n_11\,
      O => count_for_reset_r_0(13)
    );
\count_for_reset_r[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__0_n_10\,
      O => count_for_reset_r_0(14)
    );
\count_for_reset_r[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__0_n_9\,
      O => count_for_reset_r_0(15)
    );
\count_for_reset_r[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__0_n_8\,
      O => count_for_reset_r_0(16)
    );
\count_for_reset_r[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__1_n_15\,
      O => count_for_reset_r_0(17)
    );
\count_for_reset_r[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__1_n_14\,
      O => count_for_reset_r_0(18)
    );
\count_for_reset_r[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__1_n_13\,
      O => count_for_reset_r_0(19)
    );
\count_for_reset_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => count_for_reset_r0_carry_n_15,
      O => count_for_reset_r_0(1)
    );
\count_for_reset_r[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__1_n_12\,
      O => count_for_reset_r_0(20)
    );
\count_for_reset_r[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__1_n_11\,
      O => count_for_reset_r_0(21)
    );
\count_for_reset_r[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__1_n_10\,
      O => count_for_reset_r_0(22)
    );
\count_for_reset_r[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__1_n_9\,
      O => count_for_reset_r_0(23)
    );
\count_for_reset_r[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__1_n_8\,
      O => count_for_reset_r_0(24)
    );
\count_for_reset_r[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__2_n_15\,
      O => count_for_reset_r_0(25)
    );
\count_for_reset_r[25]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => count_for_reset_r(17),
      I1 => count_for_reset_r(16),
      I2 => count_for_reset_r(19),
      I3 => count_for_reset_r(18),
      O => \count_for_reset_r[25]_i_2_n_0\
    );
\count_for_reset_r[25]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => count_for_reset_r(7),
      I1 => count_for_reset_r(6),
      I2 => count_for_reset_r(9),
      I3 => count_for_reset_r(8),
      O => \count_for_reset_r[25]_i_3_n_0\
    );
\count_for_reset_r[25]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => count_for_reset_r(0),
      I1 => count_for_reset_r(1),
      I2 => count_for_reset_r(2),
      I3 => count_for_reset_r(5),
      I4 => count_for_reset_r(4),
      I5 => count_for_reset_r(3),
      O => \count_for_reset_r[25]_i_4_n_0\
    );
\count_for_reset_r[25]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => count_for_reset_r(12),
      I1 => count_for_reset_r(15),
      I2 => count_for_reset_r(13),
      I3 => count_for_reset_r(14),
      I4 => count_for_reset_r(11),
      I5 => count_for_reset_r(10),
      O => \count_for_reset_r[25]_i_5_n_0\
    );
\count_for_reset_r[25]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => count_for_reset_r(20),
      I1 => count_for_reset_r(24),
      I2 => count_for_reset_r(22),
      I3 => count_for_reset_r(23),
      I4 => count_for_reset_r(21),
      I5 => count_for_reset_r(25),
      O => \count_for_reset_r[25]_i_6_n_0\
    );
\count_for_reset_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => count_for_reset_r0_carry_n_14,
      O => count_for_reset_r_0(2)
    );
\count_for_reset_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => count_for_reset_r0_carry_n_13,
      O => count_for_reset_r_0(3)
    );
\count_for_reset_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => count_for_reset_r0_carry_n_12,
      O => count_for_reset_r_0(4)
    );
\count_for_reset_r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => count_for_reset_r0_carry_n_11,
      O => count_for_reset_r_0(5)
    );
\count_for_reset_r[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => count_for_reset_r0_carry_n_10,
      O => count_for_reset_r_0(6)
    );
\count_for_reset_r[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => count_for_reset_r0_carry_n_9,
      O => count_for_reset_r_0(7)
    );
\count_for_reset_r[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => count_for_reset_r0_carry_n_8,
      O => count_for_reset_r_0(8)
    );
\count_for_reset_r[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFF00000000"
    )
        port map (
      I0 => \count_for_reset_r[25]_i_2_n_0\,
      I1 => \count_for_reset_r[25]_i_3_n_0\,
      I2 => \count_for_reset_r[25]_i_4_n_0\,
      I3 => \count_for_reset_r[25]_i_5_n_0\,
      I4 => \count_for_reset_r[25]_i_6_n_0\,
      I5 => \count_for_reset_r0_carry__0_n_15\,
      O => count_for_reset_r_0(9)
    );
\count_for_reset_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => \count_for_reset_r[0]_i_1_n_0\,
      Q => count_for_reset_r(0),
      R => cc_sync
    );
\count_for_reset_r_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(10),
      Q => count_for_reset_r(10),
      R => cc_sync
    );
\count_for_reset_r_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(11),
      Q => count_for_reset_r(11),
      R => cc_sync
    );
\count_for_reset_r_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(12),
      Q => count_for_reset_r(12),
      R => cc_sync
    );
\count_for_reset_r_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(13),
      Q => count_for_reset_r(13),
      R => cc_sync
    );
\count_for_reset_r_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(14),
      Q => count_for_reset_r(14),
      R => cc_sync
    );
\count_for_reset_r_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(15),
      Q => count_for_reset_r(15),
      R => cc_sync
    );
\count_for_reset_r_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(16),
      Q => count_for_reset_r(16),
      R => cc_sync
    );
\count_for_reset_r_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(17),
      Q => count_for_reset_r(17),
      R => cc_sync
    );
\count_for_reset_r_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(18),
      Q => count_for_reset_r(18),
      R => cc_sync
    );
\count_for_reset_r_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(19),
      Q => count_for_reset_r(19),
      R => cc_sync
    );
\count_for_reset_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(1),
      Q => count_for_reset_r(1),
      R => cc_sync
    );
\count_for_reset_r_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(20),
      Q => count_for_reset_r(20),
      R => cc_sync
    );
\count_for_reset_r_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(21),
      Q => count_for_reset_r(21),
      R => cc_sync
    );
\count_for_reset_r_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(22),
      Q => count_for_reset_r(22),
      R => cc_sync
    );
\count_for_reset_r_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(23),
      Q => count_for_reset_r(23),
      R => cc_sync
    );
\count_for_reset_r_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(24),
      Q => count_for_reset_r(24),
      R => cc_sync
    );
\count_for_reset_r_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(25),
      Q => count_for_reset_r(25),
      R => cc_sync
    );
\count_for_reset_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(2),
      Q => count_for_reset_r(2),
      R => cc_sync
    );
\count_for_reset_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(3),
      Q => count_for_reset_r(3),
      R => cc_sync
    );
\count_for_reset_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(4),
      Q => count_for_reset_r(4),
      R => cc_sync
    );
\count_for_reset_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(5),
      Q => count_for_reset_r(5),
      R => cc_sync
    );
\count_for_reset_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(6),
      Q => count_for_reset_r(6),
      R => cc_sync
    );
\count_for_reset_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(7),
      Q => count_for_reset_r(7),
      R => cc_sync
    );
\count_for_reset_r_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(8),
      Q => count_for_reset_r(8),
      R => cc_sync
    );
\count_for_reset_r_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => init_clk_in,
      CE => '1',
      D => count_for_reset_r_0(9),
      Q => count_for_reset_r(9),
      R => cc_sync
    );
link_reset_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000E000E0000000E"
    )
        port map (
      I0 => count_for_reset_r(11),
      I1 => link_reset_0_i_2_n_0,
      I2 => \count_for_reset_r[25]_i_6_n_0\,
      I3 => link_reset_0_i_3_n_0,
      I4 => \count_for_reset_r[25]_i_5_n_0\,
      I5 => link_reset_0_i_4_n_0,
      O => link_reset_0_i_1_n_0
    );
link_reset_0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA8AAAA"
    )
        port map (
      I0 => count_for_reset_r(10),
      I1 => count_for_reset_r(7),
      I2 => count_for_reset_r(9),
      I3 => count_for_reset_r(8),
      I4 => link_reset_0_i_5_n_0,
      O => link_reset_0_i_2_n_0
    );
link_reset_0_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => count_for_reset_r(18),
      I1 => count_for_reset_r(19),
      I2 => count_for_reset_r(16),
      I3 => count_for_reset_r(17),
      I4 => link_reset_0_i_6_n_0,
      O => link_reset_0_i_3_n_0
    );
link_reset_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF7FFF"
    )
        port map (
      I0 => count_for_reset_r(7),
      I1 => count_for_reset_r(6),
      I2 => count_for_reset_r(9),
      I3 => count_for_reset_r(8),
      I4 => \count_for_reset_r[25]_i_2_n_0\,
      I5 => link_reset_0_i_7_n_0,
      O => link_reset_0_i_4_n_0
    );
link_reset_0_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5557"
    )
        port map (
      I0 => count_for_reset_r(6),
      I1 => count_for_reset_r(3),
      I2 => count_for_reset_r(5),
      I3 => count_for_reset_r(4),
      O => link_reset_0_i_5_n_0
    );
link_reset_0_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => count_for_reset_r(14),
      I1 => count_for_reset_r(13),
      I2 => count_for_reset_r(15),
      I3 => count_for_reset_r(12),
      O => link_reset_0_i_6_n_0
    );
link_reset_0_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F7F7FFF"
    )
        port map (
      I0 => count_for_reset_r(5),
      I1 => count_for_reset_r(4),
      I2 => count_for_reset_r(3),
      I3 => count_for_reset_r(1),
      I4 => count_for_reset_r(2),
      O => link_reset_0_i_7_n_0
    );
link_reset_0_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_0_i_1_n_0,
      Q => link_reset_0,
      R => '0'
    );
\link_reset_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_0,
      Q => link_reset_out,
      R => '0'
    );
rx_cc_cdc_sync: entity work.\dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0_21\
     port map (
      SR(0) => cc_sync,
      init_clk_in => init_clk_in,
      rx_cc_extend_r2 => rx_cc_extend_r2,
      user_clk => user_clk
    );
rx_cc_extend_r2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => rx_cc_extend_r(2),
      I1 => rx_cc_extend_r(3),
      I2 => rx_cc_extend_r(0),
      I3 => rx_cc_extend_r(1),
      I4 => rx_cc_extend_r2_i_2_n_0,
      O => rx_cc_extend_r2_i_1_n_0
    );
rx_cc_extend_r2_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rx_cc_extend_r(5),
      I1 => rx_cc_extend_r(4),
      I2 => rx_cc_extend_r(7),
      I3 => rx_cc_extend_r(6),
      O => rx_cc_extend_r2_i_2_n_0
    );
rx_cc_extend_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => rx_cc_extend_r2_i_1_n_0,
      Q => rx_cc_extend_r2,
      R => '0'
    );
\rx_cc_extend_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => rx_cc_extend_r(1),
      Q => rx_cc_extend_r(0),
      R => SR(0)
    );
\rx_cc_extend_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => rx_cc_extend_r(2),
      Q => rx_cc_extend_r(1),
      R => SR(0)
    );
\rx_cc_extend_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => rx_cc_extend_r(3),
      Q => rx_cc_extend_r(2),
      R => SR(0)
    );
\rx_cc_extend_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => rx_cc_extend_r(4),
      Q => rx_cc_extend_r(3),
      R => SR(0)
    );
\rx_cc_extend_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => rx_cc_extend_r(5),
      Q => rx_cc_extend_r(4),
      R => SR(0)
    );
\rx_cc_extend_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => rx_cc_extend_r(6),
      Q => rx_cc_extend_r(5),
      R => SR(0)
    );
\rx_cc_extend_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => rx_cc_extend_r(7),
      Q => rx_cc_extend_r(6),
      R => SR(0)
    );
\rx_cc_extend_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => user_clk,
      CE => '1',
      D => D(0),
      Q => rx_cc_extend_r(7),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_gtwiz_reset is
  port (
    \gen_gtwizard_gthe3.txprogdivreset_int\ : out STD_LOGIC;
    gtwiz_reset_tx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_cdr_stable_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.gttxreset_int\ : out STD_LOGIC;
    \gen_gtwizard_gthe3.txuserrdy_int\ : out STD_LOGIC;
    \gen_gtwizard_gthe3.rxprogdivreset_int\ : out STD_LOGIC;
    \gen_gtwizard_gthe3.gtrxreset_int\ : out STD_LOGIC;
    \gen_gtwizard_gthe3.rxuserrdy_int\ : out STD_LOGIC;
    \gen_gtwizard_gthe3.cpllpd_ch_int\ : out STD_LOGIC;
    gtpowergood_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_tx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cplllock_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrlock_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_all_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_in0 : in STD_LOGIC;
    txusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\ : in STD_LOGIC;
    gtwiz_reset_tx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_gtwiz_reset : entity is "gtwizard_ultrascale_v1_7_4_gtwiz_reset";
end dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_gtwiz_reset;

architecture STRUCTURE of dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_gtwiz_reset is
  signal \FSM_sequential_sm_reset_all[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_sm_reset_all[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_sm_reset_all[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_sm_reset_all[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_sm_reset_all[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_sm_reset_rx[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_sm_reset_rx[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_sm_reset_rx[2]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_sm_reset_tx[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_sm_reset_tx[2]_i_3_n_0\ : STD_LOGIC;
  signal bit_synchronizer_gtpowergood_inst_n_0 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_rx_pll_and_datapath_dly_inst_n_0 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_rx_pll_and_datapath_dly_inst_n_1 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_rx_pll_and_datapath_dly_inst_n_2 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_tx_datapath_dly_inst_n_0 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_tx_pll_and_datapath_dly_inst_n_1 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_tx_pll_and_datapath_dly_inst_n_2 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_0 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_1 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_2 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_userclk_tx_active_inst_n_1 : STD_LOGIC;
  signal bit_synchronizer_gtwiz_reset_userclk_tx_active_inst_n_2 : STD_LOGIC;
  signal bit_synchronizer_plllock_rx_inst_n_1 : STD_LOGIC;
  signal bit_synchronizer_plllock_rx_inst_n_2 : STD_LOGIC;
  signal bit_synchronizer_plllock_tx_inst_n_1 : STD_LOGIC;
  signal bit_synchronizer_plllock_tx_inst_n_2 : STD_LOGIC;
  signal bit_synchronizer_rxcdrlock_inst_n_1 : STD_LOGIC;
  signal bit_synchronizer_rxcdrlock_inst_n_2 : STD_LOGIC;
  signal bit_synchronizer_rxcdrlock_inst_n_3 : STD_LOGIC;
  signal \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_rx_int\ : STD_LOGIC;
  signal \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_tx_int\ : STD_LOGIC;
  signal \^gen_gtwizard_gthe3.gtrxreset_int\ : STD_LOGIC;
  signal \^gen_gtwizard_gthe3.gttxreset_int\ : STD_LOGIC;
  signal \^gen_gtwizard_gthe3.rxprogdivreset_int\ : STD_LOGIC;
  signal \^gen_gtwizard_gthe3.rxuserrdy_int\ : STD_LOGIC;
  signal \^gen_gtwizard_gthe3.txuserrdy_int\ : STD_LOGIC;
  signal gttxreset_out_i_3_n_0 : STD_LOGIC;
  signal gtwiz_reset_all_sync : STD_LOGIC;
  signal gtwiz_reset_rx_any_sync : STD_LOGIC;
  signal gtwiz_reset_rx_datapath_dly : STD_LOGIC;
  signal gtwiz_reset_rx_datapath_int_i_1_n_0 : STD_LOGIC;
  signal gtwiz_reset_rx_datapath_int_reg_n_0 : STD_LOGIC;
  signal gtwiz_reset_rx_datapath_sync : STD_LOGIC;
  signal gtwiz_reset_rx_done_int_reg_n_0 : STD_LOGIC;
  signal gtwiz_reset_rx_pll_and_datapath_int_i_1_n_0 : STD_LOGIC;
  signal gtwiz_reset_rx_pll_and_datapath_int_reg_n_0 : STD_LOGIC;
  signal gtwiz_reset_rx_pll_and_datapath_sync : STD_LOGIC;
  signal gtwiz_reset_tx_any_sync : STD_LOGIC;
  signal gtwiz_reset_tx_datapath_sync : STD_LOGIC;
  signal gtwiz_reset_tx_done_int_reg_n_0 : STD_LOGIC;
  signal gtwiz_reset_tx_pll_and_datapath_dly : STD_LOGIC;
  signal gtwiz_reset_tx_pll_and_datapath_int_i_1_n_0 : STD_LOGIC;
  signal gtwiz_reset_tx_pll_and_datapath_int_reg_n_0 : STD_LOGIC;
  signal gtwiz_reset_tx_pll_and_datapath_sync : STD_LOGIC;
  signal gtwiz_reset_userclk_tx_active_sync : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal plllock_rx_sync : STD_LOGIC;
  signal plllock_tx_sync : STD_LOGIC;
  signal reset_synchronizer_gtwiz_reset_rx_any_inst_n_1 : STD_LOGIC;
  signal reset_synchronizer_gtwiz_reset_rx_any_inst_n_2 : STD_LOGIC;
  signal reset_synchronizer_gtwiz_reset_rx_any_inst_n_3 : STD_LOGIC;
  signal reset_synchronizer_gtwiz_reset_tx_any_inst_n_1 : STD_LOGIC;
  signal reset_synchronizer_gtwiz_reset_tx_any_inst_n_2 : STD_LOGIC;
  signal reset_synchronizer_gtwiz_reset_tx_any_inst_n_3 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal sm_reset_all : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of sm_reset_all : signal is "yes";
  signal sm_reset_all_timer_clr_i_1_n_0 : STD_LOGIC;
  signal sm_reset_all_timer_clr_i_2_n_0 : STD_LOGIC;
  signal sm_reset_all_timer_clr_reg_n_0 : STD_LOGIC;
  signal sm_reset_all_timer_ctr : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \sm_reset_all_timer_ctr0_inferred__0/i__n_0\ : STD_LOGIC;
  signal \sm_reset_all_timer_ctr[0]_i_1_n_0\ : STD_LOGIC;
  signal \sm_reset_all_timer_ctr[1]_i_1_n_0\ : STD_LOGIC;
  signal \sm_reset_all_timer_ctr[2]_i_1_n_0\ : STD_LOGIC;
  signal sm_reset_all_timer_sat : STD_LOGIC;
  signal sm_reset_all_timer_sat_i_1_n_0 : STD_LOGIC;
  signal sm_reset_rx : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RTL_KEEP of sm_reset_rx : signal is "yes";
  signal sm_reset_rx_cdr_to_clr : STD_LOGIC;
  signal sm_reset_rx_cdr_to_clr_i_3_n_0 : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr[0]_i_3_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr[0]_i_4_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr[0]_i_5_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr[0]_i_6_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr[0]_i_7_n_0\ : STD_LOGIC;
  signal sm_reset_rx_cdr_to_ctr_reg : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_10\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_11\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_12\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_13\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_14\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_15\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_8\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_9\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal sm_reset_rx_cdr_to_sat : STD_LOGIC;
  signal sm_reset_rx_cdr_to_sat_i_1_n_0 : STD_LOGIC;
  signal sm_reset_rx_cdr_to_sat_i_2_n_0 : STD_LOGIC;
  signal sm_reset_rx_cdr_to_sat_i_3_n_0 : STD_LOGIC;
  signal sm_reset_rx_cdr_to_sat_i_4_n_0 : STD_LOGIC;
  signal sm_reset_rx_cdr_to_sat_i_5_n_0 : STD_LOGIC;
  signal sm_reset_rx_cdr_to_sat_i_6_n_0 : STD_LOGIC;
  signal sm_reset_rx_pll_timer_clr_i_1_n_0 : STD_LOGIC;
  signal sm_reset_rx_pll_timer_clr_reg_n_0 : STD_LOGIC;
  signal \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_pll_timer_ctr[9]_i_3_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_pll_timer_ctr[9]_i_4_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_pll_timer_ctr_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal sm_reset_rx_pll_timer_sat : STD_LOGIC;
  signal sm_reset_rx_pll_timer_sat_i_1_n_0 : STD_LOGIC;
  signal sm_reset_rx_pll_timer_sat_i_2_n_0 : STD_LOGIC;
  signal sm_reset_rx_pll_timer_sat_i_3_n_0 : STD_LOGIC;
  signal sm_reset_rx_timer_clr_reg_n_0 : STD_LOGIC;
  signal sm_reset_rx_timer_ctr : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \sm_reset_rx_timer_ctr0_inferred__0/i__n_0\ : STD_LOGIC;
  signal \sm_reset_rx_timer_ctr[0]_i_1_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_timer_ctr[1]_i_1_n_0\ : STD_LOGIC;
  signal \sm_reset_rx_timer_ctr[2]_i_1_n_0\ : STD_LOGIC;
  signal sm_reset_rx_timer_sat : STD_LOGIC;
  signal sm_reset_rx_timer_sat_i_1_n_0 : STD_LOGIC;
  signal sm_reset_tx : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RTL_KEEP of sm_reset_tx : signal is "yes";
  signal sm_reset_tx_pll_timer_clr_i_1_n_0 : STD_LOGIC;
  signal sm_reset_tx_pll_timer_clr_reg_n_0 : STD_LOGIC;
  signal \sm_reset_tx_pll_timer_ctr[9]_i_3_n_0\ : STD_LOGIC;
  signal \sm_reset_tx_pll_timer_ctr[9]_i_4_n_0\ : STD_LOGIC;
  signal \sm_reset_tx_pll_timer_ctr_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal sm_reset_tx_pll_timer_sat : STD_LOGIC;
  signal sm_reset_tx_pll_timer_sat_i_1_n_0 : STD_LOGIC;
  signal sm_reset_tx_pll_timer_sat_i_2_n_0 : STD_LOGIC;
  signal sm_reset_tx_pll_timer_sat_i_3_n_0 : STD_LOGIC;
  signal sm_reset_tx_timer_clr_reg_n_0 : STD_LOGIC;
  signal sm_reset_tx_timer_ctr : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal sm_reset_tx_timer_sat : STD_LOGIC;
  signal sm_reset_tx_timer_sat_i_1_n_0 : STD_LOGIC;
  signal txuserrdy_out_i_3_n_0 : STD_LOGIC;
  signal \NLW_sm_reset_rx_cdr_to_ctr_reg[0]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_sm_reset_rx_cdr_to_ctr_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_sm_reset_rx_cdr_to_ctr_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_sm_reset_rx_cdr_to_ctr_reg[24]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_sm_reset_rx_cdr_to_ctr_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_sm_reset_all[2]_i_3\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \FSM_sequential_sm_reset_all[2]_i_4\ : label is "soft_lutpair114";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_sm_reset_all_reg[0]\ : label is "ST_RESET_ALL_BRANCH:000,ST_RESET_ALL_TX_PLL_WAIT:010,ST_RESET_ALL_RX_WAIT:101,ST_RESET_ALL_TX_PLL:001,ST_RESET_ALL_RX_PLL:100,ST_RESET_ALL_RX_DP:011,ST_RESET_ALL_INIT:111,iSTATE:110";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_sm_reset_all_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_sm_reset_all_reg[1]\ : label is "ST_RESET_ALL_BRANCH:000,ST_RESET_ALL_TX_PLL_WAIT:010,ST_RESET_ALL_RX_WAIT:101,ST_RESET_ALL_TX_PLL:001,ST_RESET_ALL_RX_PLL:100,ST_RESET_ALL_RX_DP:011,ST_RESET_ALL_INIT:111,iSTATE:110";
  attribute KEEP of \FSM_sequential_sm_reset_all_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_sm_reset_all_reg[2]\ : label is "ST_RESET_ALL_BRANCH:000,ST_RESET_ALL_TX_PLL_WAIT:010,ST_RESET_ALL_RX_WAIT:101,ST_RESET_ALL_TX_PLL:001,ST_RESET_ALL_RX_PLL:100,ST_RESET_ALL_RX_DP:011,ST_RESET_ALL_INIT:111,iSTATE:110";
  attribute KEEP of \FSM_sequential_sm_reset_all_reg[2]\ : label is "yes";
  attribute SOFT_HLUTNM of \FSM_sequential_sm_reset_rx[1]_i_2\ : label is "soft_lutpair107";
  attribute FSM_ENCODED_STATES of \FSM_sequential_sm_reset_rx_reg[0]\ : label is "ST_RESET_RX_WAIT_LOCK:011,ST_RESET_RX_WAIT_CDR:100,ST_RESET_RX_WAIT_USERRDY:101,ST_RESET_RX_WAIT_RESETDONE:110,ST_RESET_RX_DATAPATH:010,ST_RESET_RX_PLL:001,ST_RESET_RX_BRANCH:000,ST_RESET_RX_IDLE:111";
  attribute KEEP of \FSM_sequential_sm_reset_rx_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_sm_reset_rx_reg[1]\ : label is "ST_RESET_RX_WAIT_LOCK:011,ST_RESET_RX_WAIT_CDR:100,ST_RESET_RX_WAIT_USERRDY:101,ST_RESET_RX_WAIT_RESETDONE:110,ST_RESET_RX_DATAPATH:010,ST_RESET_RX_PLL:001,ST_RESET_RX_BRANCH:000,ST_RESET_RX_IDLE:111";
  attribute KEEP of \FSM_sequential_sm_reset_rx_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_sm_reset_rx_reg[2]\ : label is "ST_RESET_RX_WAIT_LOCK:011,ST_RESET_RX_WAIT_CDR:100,ST_RESET_RX_WAIT_USERRDY:101,ST_RESET_RX_WAIT_RESETDONE:110,ST_RESET_RX_DATAPATH:010,ST_RESET_RX_PLL:001,ST_RESET_RX_BRANCH:000,ST_RESET_RX_IDLE:111";
  attribute KEEP of \FSM_sequential_sm_reset_rx_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_sm_reset_tx_reg[0]\ : label is "ST_RESET_TX_BRANCH:000,ST_RESET_TX_WAIT_LOCK:011,ST_RESET_TX_WAIT_USERRDY:100,ST_RESET_TX_WAIT_RESETDONE:101,ST_RESET_TX_IDLE:110,ST_RESET_TX_DATAPATH:010,ST_RESET_TX_PLL:001";
  attribute KEEP of \FSM_sequential_sm_reset_tx_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_sm_reset_tx_reg[1]\ : label is "ST_RESET_TX_BRANCH:000,ST_RESET_TX_WAIT_LOCK:011,ST_RESET_TX_WAIT_USERRDY:100,ST_RESET_TX_WAIT_RESETDONE:101,ST_RESET_TX_IDLE:110,ST_RESET_TX_DATAPATH:010,ST_RESET_TX_PLL:001";
  attribute KEEP of \FSM_sequential_sm_reset_tx_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_sm_reset_tx_reg[2]\ : label is "ST_RESET_TX_BRANCH:000,ST_RESET_TX_WAIT_LOCK:011,ST_RESET_TX_WAIT_USERRDY:100,ST_RESET_TX_WAIT_RESETDONE:101,ST_RESET_TX_IDLE:110,ST_RESET_TX_DATAPATH:010,ST_RESET_TX_PLL:001";
  attribute KEEP of \FSM_sequential_sm_reset_tx_reg[2]\ : label is "yes";
  attribute SOFT_HLUTNM of gttxreset_out_i_3 : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \sm_reset_all_timer_ctr[1]_i_1\ : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \sm_reset_all_timer_ctr[2]_i_1\ : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \sm_reset_rx_pll_timer_ctr[1]_i_1\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \sm_reset_rx_pll_timer_ctr[2]_i_1\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \sm_reset_rx_pll_timer_ctr[3]_i_1\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \sm_reset_rx_pll_timer_ctr[4]_i_1\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \sm_reset_rx_pll_timer_ctr[6]_i_1\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \sm_reset_rx_pll_timer_ctr[7]_i_1\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \sm_reset_rx_pll_timer_ctr[8]_i_1\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \sm_reset_rx_pll_timer_ctr[9]_i_2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \sm_reset_rx_pll_timer_ctr[9]_i_3\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of sm_reset_rx_pll_timer_sat_i_2 : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \sm_reset_rx_timer_ctr[1]_i_1\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \sm_reset_rx_timer_ctr[2]_i_1\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of sm_reset_rx_timer_sat_i_1 : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \sm_reset_tx_pll_timer_ctr[1]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \sm_reset_tx_pll_timer_ctr[2]_i_1\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \sm_reset_tx_pll_timer_ctr[3]_i_1\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \sm_reset_tx_pll_timer_ctr[4]_i_1\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \sm_reset_tx_pll_timer_ctr[6]_i_1\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \sm_reset_tx_pll_timer_ctr[7]_i_1\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \sm_reset_tx_pll_timer_ctr[8]_i_1\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \sm_reset_tx_pll_timer_ctr[9]_i_2\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \sm_reset_tx_pll_timer_ctr[9]_i_3\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of sm_reset_tx_pll_timer_sat_i_2 : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \sm_reset_tx_timer_ctr[1]_i_1\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \sm_reset_tx_timer_ctr[2]_i_1\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of sm_reset_tx_timer_sat_i_1 : label is "soft_lutpair108";
begin
  \gen_gtwizard_gthe3.gtrxreset_int\ <= \^gen_gtwizard_gthe3.gtrxreset_int\;
  \gen_gtwizard_gthe3.gttxreset_int\ <= \^gen_gtwizard_gthe3.gttxreset_int\;
  \gen_gtwizard_gthe3.rxprogdivreset_int\ <= \^gen_gtwizard_gthe3.rxprogdivreset_int\;
  \gen_gtwizard_gthe3.rxuserrdy_int\ <= \^gen_gtwizard_gthe3.rxuserrdy_int\;
  \gen_gtwizard_gthe3.txuserrdy_int\ <= \^gen_gtwizard_gthe3.txuserrdy_int\;
\FSM_sequential_sm_reset_all[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFF70000FFFFFF"
    )
        port map (
      I0 => gtwiz_reset_rx_done_int_reg_n_0,
      I1 => sm_reset_all_timer_sat,
      I2 => sm_reset_all_timer_clr_reg_n_0,
      I3 => sm_reset_all(2),
      I4 => sm_reset_all(1),
      I5 => sm_reset_all(0),
      O => \FSM_sequential_sm_reset_all[0]_i_1_n_0\
    );
\FSM_sequential_sm_reset_all[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"34"
    )
        port map (
      I0 => sm_reset_all(2),
      I1 => sm_reset_all(1),
      I2 => sm_reset_all(0),
      O => \FSM_sequential_sm_reset_all[1]_i_1_n_0\
    );
\FSM_sequential_sm_reset_all[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"4A"
    )
        port map (
      I0 => sm_reset_all(2),
      I1 => sm_reset_all(0),
      I2 => sm_reset_all(1),
      O => \FSM_sequential_sm_reset_all[2]_i_2_n_0\
    );
\FSM_sequential_sm_reset_all[2]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => sm_reset_all_timer_sat,
      I1 => gtwiz_reset_rx_done_int_reg_n_0,
      I2 => sm_reset_all_timer_clr_reg_n_0,
      O => \FSM_sequential_sm_reset_all[2]_i_3_n_0\
    );
\FSM_sequential_sm_reset_all[2]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => sm_reset_all_timer_clr_reg_n_0,
      I1 => sm_reset_all_timer_sat,
      I2 => gtwiz_reset_tx_done_int_reg_n_0,
      O => \FSM_sequential_sm_reset_all[2]_i_4_n_0\
    );
\FSM_sequential_sm_reset_all_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => bit_synchronizer_gtpowergood_inst_n_0,
      D => \FSM_sequential_sm_reset_all[0]_i_1_n_0\,
      Q => sm_reset_all(0),
      R => gtwiz_reset_all_sync
    );
\FSM_sequential_sm_reset_all_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => bit_synchronizer_gtpowergood_inst_n_0,
      D => \FSM_sequential_sm_reset_all[1]_i_1_n_0\,
      Q => sm_reset_all(1),
      R => gtwiz_reset_all_sync
    );
\FSM_sequential_sm_reset_all_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => bit_synchronizer_gtpowergood_inst_n_0,
      D => \FSM_sequential_sm_reset_all[2]_i_2_n_0\,
      Q => sm_reset_all(2),
      R => gtwiz_reset_all_sync
    );
\FSM_sequential_sm_reset_rx[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sm_reset_rx_timer_sat,
      I1 => sm_reset_rx_timer_clr_reg_n_0,
      O => \FSM_sequential_sm_reset_rx[1]_i_2_n_0\
    );
\FSM_sequential_sm_reset_rx[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDFD8888DDDD8888"
    )
        port map (
      I0 => sm_reset_rx(1),
      I1 => sm_reset_rx(0),
      I2 => sm_reset_rx_timer_sat,
      I3 => sm_reset_rx_timer_clr_reg_n_0,
      I4 => sm_reset_rx(2),
      I5 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      O => \FSM_sequential_sm_reset_rx[2]_i_2_n_0\
    );
\FSM_sequential_sm_reset_rx[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => sm_reset_rx(0),
      I1 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      I2 => sm_reset_rx(1),
      I3 => sm_reset_rx_timer_sat,
      I4 => sm_reset_rx_timer_clr_reg_n_0,
      O => \FSM_sequential_sm_reset_rx[2]_i_6_n_0\
    );
\FSM_sequential_sm_reset_rx_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_2,
      D => bit_synchronizer_gtwiz_reset_rx_pll_and_datapath_dly_inst_n_1,
      Q => sm_reset_rx(0),
      R => gtwiz_reset_rx_any_sync
    );
\FSM_sequential_sm_reset_rx_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_2,
      D => bit_synchronizer_gtwiz_reset_rx_pll_and_datapath_dly_inst_n_0,
      Q => sm_reset_rx(1),
      R => gtwiz_reset_rx_any_sync
    );
\FSM_sequential_sm_reset_rx_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_2,
      D => \FSM_sequential_sm_reset_rx[2]_i_2_n_0\,
      Q => sm_reset_rx(2),
      R => gtwiz_reset_rx_any_sync
    );
\FSM_sequential_sm_reset_tx[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
        port map (
      I0 => sm_reset_tx(0),
      I1 => sm_reset_tx(1),
      I2 => sm_reset_tx(2),
      O => \FSM_sequential_sm_reset_tx[2]_i_2_n_0\
    );
\FSM_sequential_sm_reset_tx[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => sm_reset_tx(1),
      I1 => sm_reset_tx(2),
      O => \FSM_sequential_sm_reset_tx[2]_i_3_n_0\
    );
\FSM_sequential_sm_reset_tx_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => bit_synchronizer_gtwiz_reset_tx_datapath_dly_inst_n_0,
      D => bit_synchronizer_gtwiz_reset_tx_pll_and_datapath_dly_inst_n_2,
      Q => sm_reset_tx(0),
      R => gtwiz_reset_tx_any_sync
    );
\FSM_sequential_sm_reset_tx_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => bit_synchronizer_gtwiz_reset_tx_datapath_dly_inst_n_0,
      D => bit_synchronizer_gtwiz_reset_tx_pll_and_datapath_dly_inst_n_1,
      Q => sm_reset_tx(1),
      R => gtwiz_reset_tx_any_sync
    );
\FSM_sequential_sm_reset_tx_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => bit_synchronizer_gtwiz_reset_tx_datapath_dly_inst_n_0,
      D => \FSM_sequential_sm_reset_tx[2]_i_2_n_0\,
      Q => sm_reset_tx(2),
      R => gtwiz_reset_tx_any_sync
    );
bit_synchronizer_gtpowergood_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_3
     port map (
      E(0) => bit_synchronizer_gtpowergood_inst_n_0,
      gtpowergood_out(0) => gtpowergood_out(0),
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      \out\(2 downto 0) => sm_reset_all(2 downto 0),
      sm_reset_all_timer_clr_reg => \FSM_sequential_sm_reset_all[2]_i_4_n_0\,
      sm_reset_all_timer_sat_reg => \FSM_sequential_sm_reset_all[2]_i_3_n_0\
    );
bit_synchronizer_gtwiz_reset_rx_datapath_dly_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_4
     port map (
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_rx_datapath_dly => gtwiz_reset_rx_datapath_dly,
      in0 => gtwiz_reset_rx_datapath_sync
    );
bit_synchronizer_gtwiz_reset_rx_pll_and_datapath_dly_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_5
     port map (
      D(1) => bit_synchronizer_gtwiz_reset_rx_pll_and_datapath_dly_inst_n_0,
      D(0) => bit_synchronizer_gtwiz_reset_rx_pll_and_datapath_dly_inst_n_1,
      \FSM_sequential_sm_reset_rx_reg[0]\ => bit_synchronizer_gtwiz_reset_rx_pll_and_datapath_dly_inst_n_2,
      \FSM_sequential_sm_reset_rx_reg[0]_0\ => \FSM_sequential_sm_reset_rx[2]_i_6_n_0\,
      \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\ => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_rx_datapath_dly => gtwiz_reset_rx_datapath_dly,
      in0 => gtwiz_reset_rx_pll_and_datapath_sync,
      \out\(2 downto 0) => sm_reset_rx(2 downto 0),
      sm_reset_rx_timer_sat_reg => \FSM_sequential_sm_reset_rx[1]_i_2_n_0\
    );
bit_synchronizer_gtwiz_reset_tx_datapath_dly_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_6
     port map (
      E(0) => bit_synchronizer_gtwiz_reset_tx_datapath_dly_inst_n_0,
      \FSM_sequential_sm_reset_tx_reg[1]\ => \FSM_sequential_sm_reset_tx[2]_i_3_n_0\,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_tx_pll_and_datapath_dly => gtwiz_reset_tx_pll_and_datapath_dly,
      i_in_out_reg_0 => bit_synchronizer_plllock_tx_inst_n_2,
      i_in_out_reg_1 => bit_synchronizer_gtwiz_reset_userclk_tx_active_inst_n_2,
      in0 => gtwiz_reset_tx_datapath_sync,
      \out\(0) => sm_reset_tx(0)
    );
bit_synchronizer_gtwiz_reset_tx_pll_and_datapath_dly_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_7
     port map (
      D(1) => bit_synchronizer_gtwiz_reset_tx_pll_and_datapath_dly_inst_n_1,
      D(0) => bit_synchronizer_gtwiz_reset_tx_pll_and_datapath_dly_inst_n_2,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_tx_pll_and_datapath_dly => gtwiz_reset_tx_pll_and_datapath_dly,
      in0 => gtwiz_reset_tx_pll_and_datapath_sync,
      \out\(2 downto 0) => sm_reset_tx(2 downto 0)
    );
bit_synchronizer_gtwiz_reset_userclk_rx_active_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_8
     port map (
      E(0) => bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_2,
      \FSM_sequential_sm_reset_rx_reg[1]\ => bit_synchronizer_plllock_rx_inst_n_2,
      \FSM_sequential_sm_reset_rx_reg[1]_0\ => bit_synchronizer_rxcdrlock_inst_n_2,
      \gen_gtwizard_gthe3.rxuserrdy_int\ => \^gen_gtwizard_gthe3.rxuserrdy_int\,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_rx_any_sync => gtwiz_reset_rx_any_sync,
      gtwiz_userclk_rx_active_in(0) => gtwiz_userclk_rx_active_in(0),
      i_in_out_reg_0 => bit_synchronizer_gtwiz_reset_rx_pll_and_datapath_dly_inst_n_2,
      \out\(2 downto 0) => sm_reset_rx(2 downto 0),
      rxuserrdy_out_reg => bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_1,
      sm_reset_rx_pll_timer_clr_reg => sm_reset_rx_pll_timer_clr_reg_n_0,
      sm_reset_rx_pll_timer_sat => sm_reset_rx_pll_timer_sat,
      sm_reset_rx_timer_clr_reg => bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_0,
      sm_reset_rx_timer_clr_reg_0 => sm_reset_rx_timer_clr_reg_n_0,
      sm_reset_rx_timer_sat => sm_reset_rx_timer_sat
    );
bit_synchronizer_gtwiz_reset_userclk_tx_active_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_9
     port map (
      \FSM_sequential_sm_reset_tx_reg[0]\ => bit_synchronizer_gtwiz_reset_userclk_tx_active_inst_n_2,
      \FSM_sequential_sm_reset_tx_reg[1]\ => txuserrdy_out_i_3_n_0,
      \FSM_sequential_sm_reset_tx_reg[1]_0\ => \FSM_sequential_sm_reset_tx[2]_i_3_n_0\,
      \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\ => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_userclk_tx_active_sync => gtwiz_reset_userclk_tx_active_sync,
      gtwiz_userclk_tx_active_in(0) => gtwiz_userclk_tx_active_in(0),
      \out\(2 downto 0) => sm_reset_tx(2 downto 0),
      plllock_tx_sync => plllock_tx_sync,
      sm_reset_tx_pll_timer_clr_reg => sm_reset_tx_pll_timer_clr_reg_n_0,
      sm_reset_tx_pll_timer_sat => sm_reset_tx_pll_timer_sat,
      sm_reset_tx_timer_clr_reg => bit_synchronizer_gtwiz_reset_userclk_tx_active_inst_n_1,
      sm_reset_tx_timer_clr_reg_0 => sm_reset_tx_timer_clr_reg_n_0,
      sm_reset_tx_timer_sat_reg => gttxreset_out_i_3_n_0
    );
bit_synchronizer_plllock_rx_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_10
     port map (
      cplllock_out(0) => cplllock_out(0),
      \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\ => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_rx_done_int_reg => bit_synchronizer_plllock_rx_inst_n_1,
      gtwiz_reset_rx_done_int_reg_0 => gtwiz_reset_rx_done_int_reg_n_0,
      \out\(2 downto 0) => sm_reset_rx(2 downto 0),
      plllock_rx_sync => plllock_rx_sync,
      sm_reset_rx_timer_clr_reg => bit_synchronizer_plllock_rx_inst_n_2,
      sm_reset_rx_timer_sat_reg => \FSM_sequential_sm_reset_rx[1]_i_2_n_0\
    );
bit_synchronizer_plllock_tx_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_11
     port map (
      \FSM_sequential_sm_reset_tx_reg[0]\ => bit_synchronizer_plllock_tx_inst_n_2,
      cplllock_out(0) => cplllock_out(0),
      \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\ => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_tx_done_int_reg => bit_synchronizer_plllock_tx_inst_n_1,
      gtwiz_reset_tx_done_int_reg_0 => gtwiz_reset_tx_done_int_reg_n_0,
      \out\(2 downto 0) => sm_reset_tx(2 downto 0),
      plllock_tx_sync => plllock_tx_sync,
      sm_reset_tx_timer_clr_reg => sm_reset_tx_timer_clr_reg_n_0,
      sm_reset_tx_timer_sat => sm_reset_tx_timer_sat,
      sm_reset_tx_timer_sat_reg => gttxreset_out_i_3_n_0
    );
bit_synchronizer_rxcdrlock_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_12
     port map (
      \FSM_sequential_sm_reset_rx_reg[0]\ => bit_synchronizer_rxcdrlock_inst_n_2,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_rx_cdr_stable_out(0) => gtwiz_reset_rx_cdr_stable_out(0),
      \out\(2 downto 0) => sm_reset_rx(2 downto 0),
      plllock_rx_sync => plllock_rx_sync,
      rxcdrlock_out(0) => rxcdrlock_out(0),
      rxprogdivreset_out_reg => bit_synchronizer_rxcdrlock_inst_n_3,
      sm_reset_rx_cdr_to_clr => sm_reset_rx_cdr_to_clr,
      sm_reset_rx_cdr_to_clr_reg => bit_synchronizer_rxcdrlock_inst_n_1,
      sm_reset_rx_cdr_to_sat => sm_reset_rx_cdr_to_sat,
      sm_reset_rx_timer_clr_reg => sm_reset_rx_cdr_to_clr_i_3_n_0,
      sm_reset_rx_timer_sat_reg => \FSM_sequential_sm_reset_rx[1]_i_2_n_0\
    );
\gthe3_channel_gen.gen_gthe3_channel_inst[0].GTHE3_CHANNEL_PRIM_INST_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_tx_int\,
      I1 => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_rx_int\,
      O => \gen_gtwizard_gthe3.cpllpd_ch_int\
    );
gtrxreset_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => reset_synchronizer_gtwiz_reset_rx_any_inst_n_3,
      Q => \^gen_gtwizard_gthe3.gtrxreset_int\,
      R => '0'
    );
gttxreset_out_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sm_reset_tx_timer_sat,
      I1 => sm_reset_tx_timer_clr_reg_n_0,
      O => gttxreset_out_i_3_n_0
    );
gttxreset_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => reset_synchronizer_gtwiz_reset_tx_any_inst_n_2,
      Q => \^gen_gtwizard_gthe3.gttxreset_int\,
      R => '0'
    );
gtwiz_reset_rx_datapath_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F740"
    )
        port map (
      I0 => sm_reset_all(2),
      I1 => sm_reset_all(0),
      I2 => sm_reset_all(1),
      I3 => gtwiz_reset_rx_datapath_int_reg_n_0,
      O => gtwiz_reset_rx_datapath_int_i_1_n_0
    );
gtwiz_reset_rx_datapath_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => gtwiz_reset_rx_datapath_int_i_1_n_0,
      Q => gtwiz_reset_rx_datapath_int_reg_n_0,
      R => gtwiz_reset_all_sync
    );
gtwiz_reset_rx_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => bit_synchronizer_plllock_rx_inst_n_1,
      Q => gtwiz_reset_rx_done_int_reg_n_0,
      R => gtwiz_reset_rx_any_sync
    );
gtwiz_reset_rx_pll_and_datapath_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F704"
    )
        port map (
      I0 => sm_reset_all(0),
      I1 => sm_reset_all(2),
      I2 => sm_reset_all(1),
      I3 => gtwiz_reset_rx_pll_and_datapath_int_reg_n_0,
      O => gtwiz_reset_rx_pll_and_datapath_int_i_1_n_0
    );
gtwiz_reset_rx_pll_and_datapath_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => gtwiz_reset_rx_pll_and_datapath_int_i_1_n_0,
      Q => gtwiz_reset_rx_pll_and_datapath_int_reg_n_0,
      R => gtwiz_reset_all_sync
    );
gtwiz_reset_tx_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => bit_synchronizer_plllock_tx_inst_n_1,
      Q => gtwiz_reset_tx_done_int_reg_n_0,
      R => gtwiz_reset_tx_any_sync
    );
gtwiz_reset_tx_pll_and_datapath_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB02"
    )
        port map (
      I0 => sm_reset_all(0),
      I1 => sm_reset_all(1),
      I2 => sm_reset_all(2),
      I3 => gtwiz_reset_tx_pll_and_datapath_int_reg_n_0,
      O => gtwiz_reset_tx_pll_and_datapath_int_i_1_n_0
    );
gtwiz_reset_tx_pll_and_datapath_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => gtwiz_reset_tx_pll_and_datapath_int_i_1_n_0,
      Q => gtwiz_reset_tx_pll_and_datapath_int_reg_n_0,
      R => gtwiz_reset_all_sync
    );
pllreset_rx_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => reset_synchronizer_gtwiz_reset_rx_any_inst_n_1,
      Q => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_rx_int\,
      R => '0'
    );
pllreset_tx_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => reset_synchronizer_gtwiz_reset_tx_any_inst_n_1,
      Q => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_tx_int\,
      R => '0'
    );
reset_synchronizer_gtwiz_reset_all_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer
     port map (
      gtwiz_reset_all_in(0) => gtwiz_reset_all_in(0),
      gtwiz_reset_all_sync => gtwiz_reset_all_sync,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0)
    );
reset_synchronizer_gtwiz_reset_rx_any_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_13
     port map (
      \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_rx_int\ => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_rx_int\,
      \gen_gtwizard_gthe3.gtrxreset_int\ => \^gen_gtwizard_gthe3.gtrxreset_int\,
      \gen_gtwizard_gthe3.rxprogdivreset_int\ => \^gen_gtwizard_gthe3.rxprogdivreset_int\,
      gtrxreset_out_reg => reset_synchronizer_gtwiz_reset_rx_any_inst_n_3,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_rx_any_sync => gtwiz_reset_rx_any_sync,
      gtwiz_reset_rx_datapath_in(0) => gtwiz_reset_rx_datapath_in(0),
      gtwiz_reset_rx_datapath_int_reg => gtwiz_reset_rx_datapath_int_reg_n_0,
      gtwiz_reset_rx_pll_and_datapath_in(0) => gtwiz_reset_rx_pll_and_datapath_in(0),
      gtwiz_reset_rx_pll_and_datapath_int_reg => gtwiz_reset_rx_pll_and_datapath_int_reg_n_0,
      \out\(2 downto 0) => sm_reset_rx(2 downto 0),
      plllock_rx_sync => plllock_rx_sync,
      pllreset_rx_out_reg => reset_synchronizer_gtwiz_reset_rx_any_inst_n_1,
      rxprogdivreset_out_reg => reset_synchronizer_gtwiz_reset_rx_any_inst_n_2,
      sm_reset_rx_cdr_to_sat_reg => bit_synchronizer_rxcdrlock_inst_n_3,
      sm_reset_rx_timer_sat_reg => \FSM_sequential_sm_reset_rx[1]_i_2_n_0\
    );
reset_synchronizer_gtwiz_reset_rx_datapath_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_14
     port map (
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_rx_datapath_in(0) => gtwiz_reset_rx_datapath_in(0),
      gtwiz_reset_rx_datapath_int_reg => gtwiz_reset_rx_datapath_int_reg_n_0,
      in0 => gtwiz_reset_rx_datapath_sync
    );
reset_synchronizer_gtwiz_reset_rx_pll_and_datapath_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_15
     port map (
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_rx_pll_and_datapath_in(0) => gtwiz_reset_rx_pll_and_datapath_in(0),
      gtwiz_reset_rx_pll_and_datapath_int_reg => gtwiz_reset_rx_pll_and_datapath_int_reg_n_0,
      in0 => gtwiz_reset_rx_pll_and_datapath_sync
    );
reset_synchronizer_gtwiz_reset_tx_any_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_16
     port map (
      \FSM_sequential_sm_reset_tx_reg[1]\ => txuserrdy_out_i_3_n_0,
      \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_tx_int\ => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_pllreset_tx_int\,
      \gen_gtwizard_gthe3.gttxreset_int\ => \^gen_gtwizard_gthe3.gttxreset_int\,
      \gen_gtwizard_gthe3.txuserrdy_int\ => \^gen_gtwizard_gthe3.txuserrdy_int\,
      gttxreset_out_reg => reset_synchronizer_gtwiz_reset_tx_any_inst_n_2,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_tx_any_sync => gtwiz_reset_tx_any_sync,
      gtwiz_reset_tx_datapath_in(0) => gtwiz_reset_tx_datapath_in(0),
      gtwiz_reset_tx_pll_and_datapath_in(0) => gtwiz_reset_tx_pll_and_datapath_in(0),
      gtwiz_reset_tx_pll_and_datapath_int_reg => gtwiz_reset_tx_pll_and_datapath_int_reg_n_0,
      gtwiz_reset_userclk_tx_active_sync => gtwiz_reset_userclk_tx_active_sync,
      \out\(2 downto 0) => sm_reset_tx(2 downto 0),
      plllock_tx_sync => plllock_tx_sync,
      pllreset_tx_out_reg => reset_synchronizer_gtwiz_reset_tx_any_inst_n_1,
      sm_reset_tx_timer_sat_reg => gttxreset_out_i_3_n_0,
      txuserrdy_out_reg => reset_synchronizer_gtwiz_reset_tx_any_inst_n_3
    );
reset_synchronizer_gtwiz_reset_tx_datapath_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_17
     port map (
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_tx_datapath_in(0) => gtwiz_reset_tx_datapath_in(0),
      in0 => gtwiz_reset_tx_datapath_sync
    );
reset_synchronizer_gtwiz_reset_tx_pll_and_datapath_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_18
     port map (
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_tx_pll_and_datapath_in(0) => gtwiz_reset_tx_pll_and_datapath_in(0),
      gtwiz_reset_tx_pll_and_datapath_int_reg => gtwiz_reset_tx_pll_and_datapath_int_reg_n_0,
      in0 => gtwiz_reset_tx_pll_and_datapath_sync
    );
reset_synchronizer_rx_done_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer
     port map (
      gtwiz_reset_rx_done_int_reg => gtwiz_reset_rx_done_int_reg_n_0,
      gtwiz_reset_rx_done_out(0) => gtwiz_reset_rx_done_out(0),
      rxusrclk2_in(0) => rxusrclk2_in(0)
    );
reset_synchronizer_tx_done_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_inv_synchronizer_19
     port map (
      gtwiz_reset_tx_done_int_reg => gtwiz_reset_tx_done_int_reg_n_0,
      gtwiz_reset_tx_done_out(0) => gtwiz_reset_tx_done_out(0),
      txusrclk2_in(0) => txusrclk2_in(0)
    );
reset_synchronizer_txprogdivreset_inst: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_reset_synchronizer_20
     port map (
      \gen_gtwizard_gthe3.txprogdivreset_int\ => \gen_gtwizard_gthe3.txprogdivreset_int\,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      rst_in0 => rst_in0
    );
rxprogdivreset_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => reset_synchronizer_gtwiz_reset_rx_any_inst_n_2,
      Q => \^gen_gtwizard_gthe3.rxprogdivreset_int\,
      R => '0'
    );
rxuserrdy_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_1,
      Q => \^gen_gtwizard_gthe3.rxuserrdy_int\,
      R => '0'
    );
sm_reset_all_timer_clr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFA200A"
    )
        port map (
      I0 => sm_reset_all_timer_clr_i_2_n_0,
      I1 => sm_reset_all(1),
      I2 => sm_reset_all(2),
      I3 => sm_reset_all(0),
      I4 => sm_reset_all_timer_clr_reg_n_0,
      O => sm_reset_all_timer_clr_i_1_n_0
    );
sm_reset_all_timer_clr_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000B0003333BB33"
    )
        port map (
      I0 => gtwiz_reset_rx_done_int_reg_n_0,
      I1 => sm_reset_all(2),
      I2 => gtwiz_reset_tx_done_int_reg_n_0,
      I3 => sm_reset_all_timer_sat,
      I4 => sm_reset_all_timer_clr_reg_n_0,
      I5 => sm_reset_all(1),
      O => sm_reset_all_timer_clr_i_2_n_0
    );
sm_reset_all_timer_clr_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => sm_reset_all_timer_clr_i_1_n_0,
      Q => sm_reset_all_timer_clr_reg_n_0,
      S => gtwiz_reset_all_sync
    );
\sm_reset_all_timer_ctr0_inferred__0/i_\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => sm_reset_all_timer_ctr(2),
      I1 => sm_reset_all_timer_ctr(0),
      I2 => sm_reset_all_timer_ctr(1),
      O => \sm_reset_all_timer_ctr0_inferred__0/i__n_0\
    );
\sm_reset_all_timer_ctr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sm_reset_all_timer_ctr(0),
      O => \sm_reset_all_timer_ctr[0]_i_1_n_0\
    );
\sm_reset_all_timer_ctr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sm_reset_all_timer_ctr(0),
      I1 => sm_reset_all_timer_ctr(1),
      O => \sm_reset_all_timer_ctr[1]_i_1_n_0\
    );
\sm_reset_all_timer_ctr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => sm_reset_all_timer_ctr(0),
      I1 => sm_reset_all_timer_ctr(1),
      I2 => sm_reset_all_timer_ctr(2),
      O => \sm_reset_all_timer_ctr[2]_i_1_n_0\
    );
\sm_reset_all_timer_ctr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_all_timer_ctr0_inferred__0/i__n_0\,
      D => \sm_reset_all_timer_ctr[0]_i_1_n_0\,
      Q => sm_reset_all_timer_ctr(0),
      R => sm_reset_all_timer_clr_reg_n_0
    );
\sm_reset_all_timer_ctr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_all_timer_ctr0_inferred__0/i__n_0\,
      D => \sm_reset_all_timer_ctr[1]_i_1_n_0\,
      Q => sm_reset_all_timer_ctr(1),
      R => sm_reset_all_timer_clr_reg_n_0
    );
\sm_reset_all_timer_ctr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_all_timer_ctr0_inferred__0/i__n_0\,
      D => \sm_reset_all_timer_ctr[2]_i_1_n_0\,
      Q => sm_reset_all_timer_ctr(2),
      R => sm_reset_all_timer_clr_reg_n_0
    );
sm_reset_all_timer_sat_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF80"
    )
        port map (
      I0 => sm_reset_all_timer_ctr(2),
      I1 => sm_reset_all_timer_ctr(0),
      I2 => sm_reset_all_timer_ctr(1),
      I3 => sm_reset_all_timer_sat,
      I4 => sm_reset_all_timer_clr_reg_n_0,
      O => sm_reset_all_timer_sat_i_1_n_0
    );
sm_reset_all_timer_sat_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => sm_reset_all_timer_sat_i_1_n_0,
      Q => sm_reset_all_timer_sat,
      R => '0'
    );
sm_reset_rx_cdr_to_clr_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => sm_reset_rx_timer_clr_reg_n_0,
      I1 => sm_reset_rx_timer_sat,
      I2 => sm_reset_rx(1),
      O => sm_reset_rx_cdr_to_clr_i_3_n_0
    );
sm_reset_rx_cdr_to_clr_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => bit_synchronizer_rxcdrlock_inst_n_1,
      Q => sm_reset_rx_cdr_to_clr,
      S => gtwiz_reset_rx_any_sync
    );
\sm_reset_rx_cdr_to_ctr[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_ctr_reg(0),
      I1 => sm_reset_rx_cdr_to_ctr_reg(1),
      I2 => \sm_reset_rx_cdr_to_ctr[0]_i_3_n_0\,
      I3 => \sm_reset_rx_cdr_to_ctr[0]_i_4_n_0\,
      I4 => \sm_reset_rx_cdr_to_ctr[0]_i_5_n_0\,
      I5 => \sm_reset_rx_cdr_to_ctr[0]_i_6_n_0\,
      O => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\
    );
\sm_reset_rx_cdr_to_ctr[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF7F"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_ctr_reg(18),
      I1 => sm_reset_rx_cdr_to_ctr_reg(19),
      I2 => sm_reset_rx_cdr_to_ctr_reg(17),
      I3 => sm_reset_rx_cdr_to_ctr_reg(16),
      I4 => sm_reset_rx_cdr_to_ctr_reg(15),
      I5 => sm_reset_rx_cdr_to_ctr_reg(14),
      O => \sm_reset_rx_cdr_to_ctr[0]_i_3_n_0\
    );
\sm_reset_rx_cdr_to_ctr[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_ctr_reg(24),
      I1 => sm_reset_rx_cdr_to_ctr_reg(25),
      I2 => sm_reset_rx_cdr_to_ctr_reg(22),
      I3 => sm_reset_rx_cdr_to_ctr_reg(23),
      I4 => sm_reset_rx_cdr_to_ctr_reg(21),
      I5 => sm_reset_rx_cdr_to_ctr_reg(20),
      O => \sm_reset_rx_cdr_to_ctr[0]_i_4_n_0\
    );
\sm_reset_rx_cdr_to_ctr[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFDFFFFFFFFFFF"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_ctr_reg(12),
      I1 => sm_reset_rx_cdr_to_ctr_reg(13),
      I2 => sm_reset_rx_cdr_to_ctr_reg(10),
      I3 => sm_reset_rx_cdr_to_ctr_reg(11),
      I4 => sm_reset_rx_cdr_to_ctr_reg(9),
      I5 => sm_reset_rx_cdr_to_ctr_reg(8),
      O => \sm_reset_rx_cdr_to_ctr[0]_i_5_n_0\
    );
\sm_reset_rx_cdr_to_ctr[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFDFFFFFFFF"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_ctr_reg(6),
      I1 => sm_reset_rx_cdr_to_ctr_reg(7),
      I2 => sm_reset_rx_cdr_to_ctr_reg(4),
      I3 => sm_reset_rx_cdr_to_ctr_reg(5),
      I4 => sm_reset_rx_cdr_to_ctr_reg(2),
      I5 => sm_reset_rx_cdr_to_ctr_reg(3),
      O => \sm_reset_rx_cdr_to_ctr[0]_i_6_n_0\
    );
\sm_reset_rx_cdr_to_ctr[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_ctr_reg(0),
      O => \sm_reset_rx_cdr_to_ctr[0]_i_7_n_0\
    );
\sm_reset_rx_cdr_to_ctr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_15\,
      Q => sm_reset_rx_cdr_to_ctr_reg(0),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[0]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_0\,
      CO(6) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_1\,
      CO(5) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_2\,
      CO(4) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_3\,
      CO(3) => \NLW_sm_reset_rx_cdr_to_ctr_reg[0]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_5\,
      CO(1) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_6\,
      CO(0) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_8\,
      O(6) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_9\,
      O(5) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_10\,
      O(4) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_11\,
      O(3) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_12\,
      O(2) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_13\,
      O(1) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_14\,
      O(0) => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_15\,
      S(7 downto 1) => sm_reset_rx_cdr_to_ctr_reg(7 downto 1),
      S(0) => \sm_reset_rx_cdr_to_ctr[0]_i_7_n_0\
    );
\sm_reset_rx_cdr_to_ctr_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_13\,
      Q => sm_reset_rx_cdr_to_ctr_reg(10),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_12\,
      Q => sm_reset_rx_cdr_to_ctr_reg(11),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_11\,
      Q => sm_reset_rx_cdr_to_ctr_reg(12),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_10\,
      Q => sm_reset_rx_cdr_to_ctr_reg(13),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_9\,
      Q => sm_reset_rx_cdr_to_ctr_reg(14),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_8\,
      Q => sm_reset_rx_cdr_to_ctr_reg(15),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_15\,
      Q => sm_reset_rx_cdr_to_ctr_reg(16),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_0\,
      CO(6) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_1\,
      CO(5) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_2\,
      CO(4) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_3\,
      CO(3) => \NLW_sm_reset_rx_cdr_to_ctr_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_5\,
      CO(1) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_6\,
      CO(0) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_8\,
      O(6) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_9\,
      O(5) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_10\,
      O(4) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_11\,
      O(3) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_12\,
      O(2) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_13\,
      O(1) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_14\,
      O(0) => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_15\,
      S(7 downto 0) => sm_reset_rx_cdr_to_ctr_reg(23 downto 16)
    );
\sm_reset_rx_cdr_to_ctr_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_14\,
      Q => sm_reset_rx_cdr_to_ctr_reg(17),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_13\,
      Q => sm_reset_rx_cdr_to_ctr_reg(18),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_12\,
      Q => sm_reset_rx_cdr_to_ctr_reg(19),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_14\,
      Q => sm_reset_rx_cdr_to_ctr_reg(1),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_11\,
      Q => sm_reset_rx_cdr_to_ctr_reg(20),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_10\,
      Q => sm_reset_rx_cdr_to_ctr_reg(21),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_9\,
      Q => sm_reset_rx_cdr_to_ctr_reg(22),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_8\,
      Q => sm_reset_rx_cdr_to_ctr_reg(23),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[24]_i_1_n_15\,
      Q => sm_reset_rx_cdr_to_ctr_reg(24),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sm_reset_rx_cdr_to_ctr_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_sm_reset_rx_cdr_to_ctr_reg[24]_i_1_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \sm_reset_rx_cdr_to_ctr_reg[24]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 2) => \NLW_sm_reset_rx_cdr_to_ctr_reg[24]_i_1_O_UNCONNECTED\(7 downto 2),
      O(1) => \sm_reset_rx_cdr_to_ctr_reg[24]_i_1_n_14\,
      O(0) => \sm_reset_rx_cdr_to_ctr_reg[24]_i_1_n_15\,
      S(7 downto 2) => B"000000",
      S(1 downto 0) => sm_reset_rx_cdr_to_ctr_reg(25 downto 24)
    );
\sm_reset_rx_cdr_to_ctr_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[24]_i_1_n_14\,
      Q => sm_reset_rx_cdr_to_ctr_reg(25),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_13\,
      Q => sm_reset_rx_cdr_to_ctr_reg(2),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_12\,
      Q => sm_reset_rx_cdr_to_ctr_reg(3),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_11\,
      Q => sm_reset_rx_cdr_to_ctr_reg(4),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_10\,
      Q => sm_reset_rx_cdr_to_ctr_reg(5),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_9\,
      Q => sm_reset_rx_cdr_to_ctr_reg(6),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_8\,
      Q => sm_reset_rx_cdr_to_ctr_reg(7),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_15\,
      Q => sm_reset_rx_cdr_to_ctr_reg(8),
      R => sm_reset_rx_cdr_to_clr
    );
\sm_reset_rx_cdr_to_ctr_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \sm_reset_rx_cdr_to_ctr_reg[0]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_0\,
      CO(6) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_1\,
      CO(5) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_2\,
      CO(4) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_3\,
      CO(3) => \NLW_sm_reset_rx_cdr_to_ctr_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_5\,
      CO(1) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_6\,
      CO(0) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_8\,
      O(6) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_9\,
      O(5) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_10\,
      O(4) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_11\,
      O(3) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_12\,
      O(2) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_13\,
      O(1) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_14\,
      O(0) => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_15\,
      S(7 downto 0) => sm_reset_rx_cdr_to_ctr_reg(15 downto 8)
    );
\sm_reset_rx_cdr_to_ctr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_cdr_to_ctr[0]_i_1_n_0\,
      D => \sm_reset_rx_cdr_to_ctr_reg[8]_i_1_n_14\,
      Q => sm_reset_rx_cdr_to_ctr_reg(9),
      R => sm_reset_rx_cdr_to_clr
    );
sm_reset_rx_cdr_to_sat_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_sat,
      I1 => sm_reset_rx_cdr_to_sat_i_2_n_0,
      I2 => sm_reset_rx_cdr_to_clr,
      O => sm_reset_rx_cdr_to_sat_i_1_n_0
    );
sm_reset_rx_cdr_to_sat_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_sat_i_3_n_0,
      I1 => sm_reset_rx_cdr_to_sat_i_4_n_0,
      I2 => sm_reset_rx_cdr_to_sat_i_5_n_0,
      I3 => sm_reset_rx_cdr_to_sat_i_6_n_0,
      I4 => sm_reset_rx_cdr_to_ctr_reg(0),
      I5 => sm_reset_rx_cdr_to_ctr_reg(1),
      O => sm_reset_rx_cdr_to_sat_i_2_n_0
    );
sm_reset_rx_cdr_to_sat_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_ctr_reg(4),
      I1 => sm_reset_rx_cdr_to_ctr_reg(5),
      I2 => sm_reset_rx_cdr_to_ctr_reg(3),
      I3 => sm_reset_rx_cdr_to_ctr_reg(2),
      I4 => sm_reset_rx_cdr_to_ctr_reg(7),
      I5 => sm_reset_rx_cdr_to_ctr_reg(6),
      O => sm_reset_rx_cdr_to_sat_i_3_n_0
    );
sm_reset_rx_cdr_to_sat_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_ctr_reg(22),
      I1 => sm_reset_rx_cdr_to_ctr_reg(23),
      I2 => sm_reset_rx_cdr_to_ctr_reg(20),
      I3 => sm_reset_rx_cdr_to_ctr_reg(21),
      I4 => sm_reset_rx_cdr_to_ctr_reg(25),
      I5 => sm_reset_rx_cdr_to_ctr_reg(24),
      O => sm_reset_rx_cdr_to_sat_i_4_n_0
    );
sm_reset_rx_cdr_to_sat_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000000000000"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_ctr_reg(17),
      I1 => sm_reset_rx_cdr_to_ctr_reg(16),
      I2 => sm_reset_rx_cdr_to_ctr_reg(14),
      I3 => sm_reset_rx_cdr_to_ctr_reg(15),
      I4 => sm_reset_rx_cdr_to_ctr_reg(19),
      I5 => sm_reset_rx_cdr_to_ctr_reg(18),
      O => sm_reset_rx_cdr_to_sat_i_5_n_0
    );
sm_reset_rx_cdr_to_sat_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => sm_reset_rx_cdr_to_ctr_reg(10),
      I1 => sm_reset_rx_cdr_to_ctr_reg(11),
      I2 => sm_reset_rx_cdr_to_ctr_reg(8),
      I3 => sm_reset_rx_cdr_to_ctr_reg(9),
      I4 => sm_reset_rx_cdr_to_ctr_reg(13),
      I5 => sm_reset_rx_cdr_to_ctr_reg(12),
      O => sm_reset_rx_cdr_to_sat_i_6_n_0
    );
sm_reset_rx_cdr_to_sat_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => sm_reset_rx_cdr_to_sat_i_1_n_0,
      Q => sm_reset_rx_cdr_to_sat,
      R => '0'
    );
sm_reset_rx_pll_timer_clr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF3000B"
    )
        port map (
      I0 => sm_reset_rx_pll_timer_sat,
      I1 => sm_reset_rx(0),
      I2 => sm_reset_rx(1),
      I3 => sm_reset_rx(2),
      I4 => sm_reset_rx_pll_timer_clr_reg_n_0,
      O => sm_reset_rx_pll_timer_clr_i_1_n_0
    );
sm_reset_rx_pll_timer_clr_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => sm_reset_rx_pll_timer_clr_i_1_n_0,
      Q => sm_reset_rx_pll_timer_clr_reg_n_0,
      S => gtwiz_reset_rx_any_sync
    );
\sm_reset_rx_pll_timer_ctr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(0),
      O => \p_0_in__1\(0)
    );
\sm_reset_rx_pll_timer_ctr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(1),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(0),
      O => \p_0_in__1\(1)
    );
\sm_reset_rx_pll_timer_ctr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(1),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(0),
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(2),
      O => \p_0_in__1\(2)
    );
\sm_reset_rx_pll_timer_ctr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(2),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(0),
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(1),
      I3 => \sm_reset_rx_pll_timer_ctr_reg__0\(3),
      O => \p_0_in__1\(3)
    );
\sm_reset_rx_pll_timer_ctr[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(3),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(1),
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(0),
      I3 => \sm_reset_rx_pll_timer_ctr_reg__0\(2),
      I4 => \sm_reset_rx_pll_timer_ctr_reg__0\(4),
      O => \p_0_in__1\(4)
    );
\sm_reset_rx_pll_timer_ctr[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(4),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(2),
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(0),
      I3 => \sm_reset_rx_pll_timer_ctr_reg__0\(1),
      I4 => \sm_reset_rx_pll_timer_ctr_reg__0\(3),
      I5 => \sm_reset_rx_pll_timer_ctr_reg__0\(5),
      O => \p_0_in__1\(5)
    );
\sm_reset_rx_pll_timer_ctr[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr[9]_i_4_n_0\,
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(6),
      O => \p_0_in__1\(6)
    );
\sm_reset_rx_pll_timer_ctr[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(6),
      I1 => \sm_reset_rx_pll_timer_ctr[9]_i_4_n_0\,
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(7),
      O => \p_0_in__1\(7)
    );
\sm_reset_rx_pll_timer_ctr[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(7),
      I1 => \sm_reset_rx_pll_timer_ctr[9]_i_4_n_0\,
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(6),
      I3 => \sm_reset_rx_pll_timer_ctr_reg__0\(8),
      O => \p_0_in__1\(8)
    );
\sm_reset_rx_pll_timer_ctr[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(2),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(0),
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(1),
      I3 => \sm_reset_rx_pll_timer_ctr_reg__0\(3),
      I4 => \sm_reset_rx_pll_timer_ctr_reg__0\(4),
      I5 => \sm_reset_rx_pll_timer_ctr[9]_i_3_n_0\,
      O => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\
    );
\sm_reset_rx_pll_timer_ctr[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CC6CCCCC"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(8),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(9),
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(6),
      I3 => \sm_reset_rx_pll_timer_ctr[9]_i_4_n_0\,
      I4 => \sm_reset_rx_pll_timer_ctr_reg__0\(7),
      O => \p_0_in__1\(9)
    );
\sm_reset_rx_pll_timer_ctr[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFDFF"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(6),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(5),
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(9),
      I3 => \sm_reset_rx_pll_timer_ctr_reg__0\(8),
      I4 => \sm_reset_rx_pll_timer_ctr_reg__0\(7),
      O => \sm_reset_rx_pll_timer_ctr[9]_i_3_n_0\
    );
\sm_reset_rx_pll_timer_ctr[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(4),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(2),
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(0),
      I3 => \sm_reset_rx_pll_timer_ctr_reg__0\(1),
      I4 => \sm_reset_rx_pll_timer_ctr_reg__0\(3),
      I5 => \sm_reset_rx_pll_timer_ctr_reg__0\(5),
      O => \sm_reset_rx_pll_timer_ctr[9]_i_4_n_0\
    );
\sm_reset_rx_pll_timer_ctr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\,
      D => \p_0_in__1\(0),
      Q => \sm_reset_rx_pll_timer_ctr_reg__0\(0),
      R => sm_reset_rx_pll_timer_clr_reg_n_0
    );
\sm_reset_rx_pll_timer_ctr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\,
      D => \p_0_in__1\(1),
      Q => \sm_reset_rx_pll_timer_ctr_reg__0\(1),
      R => sm_reset_rx_pll_timer_clr_reg_n_0
    );
\sm_reset_rx_pll_timer_ctr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\,
      D => \p_0_in__1\(2),
      Q => \sm_reset_rx_pll_timer_ctr_reg__0\(2),
      R => sm_reset_rx_pll_timer_clr_reg_n_0
    );
\sm_reset_rx_pll_timer_ctr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\,
      D => \p_0_in__1\(3),
      Q => \sm_reset_rx_pll_timer_ctr_reg__0\(3),
      R => sm_reset_rx_pll_timer_clr_reg_n_0
    );
\sm_reset_rx_pll_timer_ctr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\,
      D => \p_0_in__1\(4),
      Q => \sm_reset_rx_pll_timer_ctr_reg__0\(4),
      R => sm_reset_rx_pll_timer_clr_reg_n_0
    );
\sm_reset_rx_pll_timer_ctr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\,
      D => \p_0_in__1\(5),
      Q => \sm_reset_rx_pll_timer_ctr_reg__0\(5),
      R => sm_reset_rx_pll_timer_clr_reg_n_0
    );
\sm_reset_rx_pll_timer_ctr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\,
      D => \p_0_in__1\(6),
      Q => \sm_reset_rx_pll_timer_ctr_reg__0\(6),
      R => sm_reset_rx_pll_timer_clr_reg_n_0
    );
\sm_reset_rx_pll_timer_ctr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\,
      D => \p_0_in__1\(7),
      Q => \sm_reset_rx_pll_timer_ctr_reg__0\(7),
      R => sm_reset_rx_pll_timer_clr_reg_n_0
    );
\sm_reset_rx_pll_timer_ctr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\,
      D => \p_0_in__1\(8),
      Q => \sm_reset_rx_pll_timer_ctr_reg__0\(8),
      R => sm_reset_rx_pll_timer_clr_reg_n_0
    );
\sm_reset_rx_pll_timer_ctr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_pll_timer_ctr[9]_i_1_n_0\,
      D => \p_0_in__1\(9),
      Q => \sm_reset_rx_pll_timer_ctr_reg__0\(9),
      R => sm_reset_rx_pll_timer_clr_reg_n_0
    );
sm_reset_rx_pll_timer_sat_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000ABAAAAAA"
    )
        port map (
      I0 => sm_reset_rx_pll_timer_sat,
      I1 => sm_reset_rx_pll_timer_sat_i_2_n_0,
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(0),
      I3 => \sm_reset_rx_pll_timer_ctr_reg__0\(1),
      I4 => sm_reset_rx_pll_timer_sat_i_3_n_0,
      I5 => sm_reset_rx_pll_timer_clr_reg_n_0,
      O => sm_reset_rx_pll_timer_sat_i_1_n_0
    );
sm_reset_rx_pll_timer_sat_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(9),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(8),
      O => sm_reset_rx_pll_timer_sat_i_2_n_0
    );
sm_reset_rx_pll_timer_sat_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => \sm_reset_rx_pll_timer_ctr_reg__0\(4),
      I1 => \sm_reset_rx_pll_timer_ctr_reg__0\(5),
      I2 => \sm_reset_rx_pll_timer_ctr_reg__0\(2),
      I3 => \sm_reset_rx_pll_timer_ctr_reg__0\(3),
      I4 => \sm_reset_rx_pll_timer_ctr_reg__0\(7),
      I5 => \sm_reset_rx_pll_timer_ctr_reg__0\(6),
      O => sm_reset_rx_pll_timer_sat_i_3_n_0
    );
sm_reset_rx_pll_timer_sat_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => sm_reset_rx_pll_timer_sat_i_1_n_0,
      Q => sm_reset_rx_pll_timer_sat,
      R => '0'
    );
sm_reset_rx_timer_clr_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => bit_synchronizer_gtwiz_reset_userclk_rx_active_inst_n_0,
      Q => sm_reset_rx_timer_clr_reg_n_0,
      S => gtwiz_reset_rx_any_sync
    );
\sm_reset_rx_timer_ctr0_inferred__0/i_\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => sm_reset_rx_timer_ctr(2),
      I1 => sm_reset_rx_timer_ctr(0),
      I2 => sm_reset_rx_timer_ctr(1),
      O => \sm_reset_rx_timer_ctr0_inferred__0/i__n_0\
    );
\sm_reset_rx_timer_ctr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sm_reset_rx_timer_ctr(0),
      O => \sm_reset_rx_timer_ctr[0]_i_1_n_0\
    );
\sm_reset_rx_timer_ctr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sm_reset_rx_timer_ctr(0),
      I1 => sm_reset_rx_timer_ctr(1),
      O => \sm_reset_rx_timer_ctr[1]_i_1_n_0\
    );
\sm_reset_rx_timer_ctr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => sm_reset_rx_timer_ctr(0),
      I1 => sm_reset_rx_timer_ctr(1),
      I2 => sm_reset_rx_timer_ctr(2),
      O => \sm_reset_rx_timer_ctr[2]_i_1_n_0\
    );
\sm_reset_rx_timer_ctr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_timer_ctr0_inferred__0/i__n_0\,
      D => \sm_reset_rx_timer_ctr[0]_i_1_n_0\,
      Q => sm_reset_rx_timer_ctr(0),
      R => sm_reset_rx_timer_clr_reg_n_0
    );
\sm_reset_rx_timer_ctr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_timer_ctr0_inferred__0/i__n_0\,
      D => \sm_reset_rx_timer_ctr[1]_i_1_n_0\,
      Q => sm_reset_rx_timer_ctr(1),
      R => sm_reset_rx_timer_clr_reg_n_0
    );
\sm_reset_rx_timer_ctr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => \sm_reset_rx_timer_ctr0_inferred__0/i__n_0\,
      D => \sm_reset_rx_timer_ctr[2]_i_1_n_0\,
      Q => sm_reset_rx_timer_ctr(2),
      R => sm_reset_rx_timer_clr_reg_n_0
    );
sm_reset_rx_timer_sat_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF80"
    )
        port map (
      I0 => sm_reset_rx_timer_ctr(2),
      I1 => sm_reset_rx_timer_ctr(0),
      I2 => sm_reset_rx_timer_ctr(1),
      I3 => sm_reset_rx_timer_sat,
      I4 => sm_reset_rx_timer_clr_reg_n_0,
      O => sm_reset_rx_timer_sat_i_1_n_0
    );
sm_reset_rx_timer_sat_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => sm_reset_rx_timer_sat_i_1_n_0,
      Q => sm_reset_rx_timer_sat,
      R => '0'
    );
sm_reset_tx_pll_timer_clr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFEF1101"
    )
        port map (
      I0 => sm_reset_tx(1),
      I1 => sm_reset_tx(2),
      I2 => sm_reset_tx(0),
      I3 => sm_reset_tx_pll_timer_sat,
      I4 => sm_reset_tx_pll_timer_clr_reg_n_0,
      O => sm_reset_tx_pll_timer_clr_i_1_n_0
    );
sm_reset_tx_pll_timer_clr_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => sm_reset_tx_pll_timer_clr_i_1_n_0,
      Q => sm_reset_tx_pll_timer_clr_reg_n_0,
      S => gtwiz_reset_tx_any_sync
    );
\sm_reset_tx_pll_timer_ctr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(0),
      O => \p_0_in__0\(0)
    );
\sm_reset_tx_pll_timer_ctr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(1),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(0),
      O => \p_0_in__0\(1)
    );
\sm_reset_tx_pll_timer_ctr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(1),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(0),
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(2),
      O => \p_0_in__0\(2)
    );
\sm_reset_tx_pll_timer_ctr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(2),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(0),
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(1),
      I3 => \sm_reset_tx_pll_timer_ctr_reg__0\(3),
      O => \p_0_in__0\(3)
    );
\sm_reset_tx_pll_timer_ctr[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(3),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(1),
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(0),
      I3 => \sm_reset_tx_pll_timer_ctr_reg__0\(2),
      I4 => \sm_reset_tx_pll_timer_ctr_reg__0\(4),
      O => \p_0_in__0\(4)
    );
\sm_reset_tx_pll_timer_ctr[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(4),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(2),
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(0),
      I3 => \sm_reset_tx_pll_timer_ctr_reg__0\(1),
      I4 => \sm_reset_tx_pll_timer_ctr_reg__0\(3),
      I5 => \sm_reset_tx_pll_timer_ctr_reg__0\(5),
      O => \p_0_in__0\(5)
    );
\sm_reset_tx_pll_timer_ctr[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr[9]_i_4_n_0\,
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(6),
      O => \p_0_in__0\(6)
    );
\sm_reset_tx_pll_timer_ctr[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(6),
      I1 => \sm_reset_tx_pll_timer_ctr[9]_i_4_n_0\,
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(7),
      O => \p_0_in__0\(7)
    );
\sm_reset_tx_pll_timer_ctr[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(7),
      I1 => \sm_reset_tx_pll_timer_ctr[9]_i_4_n_0\,
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(6),
      I3 => \sm_reset_tx_pll_timer_ctr_reg__0\(8),
      O => \p_0_in__0\(8)
    );
\sm_reset_tx_pll_timer_ctr[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFEF"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(2),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(0),
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(1),
      I3 => \sm_reset_tx_pll_timer_ctr_reg__0\(3),
      I4 => \sm_reset_tx_pll_timer_ctr_reg__0\(4),
      I5 => \sm_reset_tx_pll_timer_ctr[9]_i_3_n_0\,
      O => sel
    );
\sm_reset_tx_pll_timer_ctr[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CC6CCCCC"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(8),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(9),
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(6),
      I3 => \sm_reset_tx_pll_timer_ctr[9]_i_4_n_0\,
      I4 => \sm_reset_tx_pll_timer_ctr_reg__0\(7),
      O => \p_0_in__0\(9)
    );
\sm_reset_tx_pll_timer_ctr[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFDFF"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(6),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(5),
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(9),
      I3 => \sm_reset_tx_pll_timer_ctr_reg__0\(8),
      I4 => \sm_reset_tx_pll_timer_ctr_reg__0\(7),
      O => \sm_reset_tx_pll_timer_ctr[9]_i_3_n_0\
    );
\sm_reset_tx_pll_timer_ctr[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(4),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(2),
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(0),
      I3 => \sm_reset_tx_pll_timer_ctr_reg__0\(1),
      I4 => \sm_reset_tx_pll_timer_ctr_reg__0\(3),
      I5 => \sm_reset_tx_pll_timer_ctr_reg__0\(5),
      O => \sm_reset_tx_pll_timer_ctr[9]_i_4_n_0\
    );
\sm_reset_tx_pll_timer_ctr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => sel,
      D => \p_0_in__0\(0),
      Q => \sm_reset_tx_pll_timer_ctr_reg__0\(0),
      R => sm_reset_tx_pll_timer_clr_reg_n_0
    );
\sm_reset_tx_pll_timer_ctr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => sel,
      D => \p_0_in__0\(1),
      Q => \sm_reset_tx_pll_timer_ctr_reg__0\(1),
      R => sm_reset_tx_pll_timer_clr_reg_n_0
    );
\sm_reset_tx_pll_timer_ctr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => sel,
      D => \p_0_in__0\(2),
      Q => \sm_reset_tx_pll_timer_ctr_reg__0\(2),
      R => sm_reset_tx_pll_timer_clr_reg_n_0
    );
\sm_reset_tx_pll_timer_ctr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => sel,
      D => \p_0_in__0\(3),
      Q => \sm_reset_tx_pll_timer_ctr_reg__0\(3),
      R => sm_reset_tx_pll_timer_clr_reg_n_0
    );
\sm_reset_tx_pll_timer_ctr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => sel,
      D => \p_0_in__0\(4),
      Q => \sm_reset_tx_pll_timer_ctr_reg__0\(4),
      R => sm_reset_tx_pll_timer_clr_reg_n_0
    );
\sm_reset_tx_pll_timer_ctr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => sel,
      D => \p_0_in__0\(5),
      Q => \sm_reset_tx_pll_timer_ctr_reg__0\(5),
      R => sm_reset_tx_pll_timer_clr_reg_n_0
    );
\sm_reset_tx_pll_timer_ctr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => sel,
      D => \p_0_in__0\(6),
      Q => \sm_reset_tx_pll_timer_ctr_reg__0\(6),
      R => sm_reset_tx_pll_timer_clr_reg_n_0
    );
\sm_reset_tx_pll_timer_ctr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => sel,
      D => \p_0_in__0\(7),
      Q => \sm_reset_tx_pll_timer_ctr_reg__0\(7),
      R => sm_reset_tx_pll_timer_clr_reg_n_0
    );
\sm_reset_tx_pll_timer_ctr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => sel,
      D => \p_0_in__0\(8),
      Q => \sm_reset_tx_pll_timer_ctr_reg__0\(8),
      R => sm_reset_tx_pll_timer_clr_reg_n_0
    );
\sm_reset_tx_pll_timer_ctr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => sel,
      D => \p_0_in__0\(9),
      Q => \sm_reset_tx_pll_timer_ctr_reg__0\(9),
      R => sm_reset_tx_pll_timer_clr_reg_n_0
    );
sm_reset_tx_pll_timer_sat_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000ABAAAAAA"
    )
        port map (
      I0 => sm_reset_tx_pll_timer_sat,
      I1 => sm_reset_tx_pll_timer_sat_i_2_n_0,
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(0),
      I3 => \sm_reset_tx_pll_timer_ctr_reg__0\(1),
      I4 => sm_reset_tx_pll_timer_sat_i_3_n_0,
      I5 => sm_reset_tx_pll_timer_clr_reg_n_0,
      O => sm_reset_tx_pll_timer_sat_i_1_n_0
    );
sm_reset_tx_pll_timer_sat_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(9),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(8),
      O => sm_reset_tx_pll_timer_sat_i_2_n_0
    );
sm_reset_tx_pll_timer_sat_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
        port map (
      I0 => \sm_reset_tx_pll_timer_ctr_reg__0\(4),
      I1 => \sm_reset_tx_pll_timer_ctr_reg__0\(5),
      I2 => \sm_reset_tx_pll_timer_ctr_reg__0\(2),
      I3 => \sm_reset_tx_pll_timer_ctr_reg__0\(3),
      I4 => \sm_reset_tx_pll_timer_ctr_reg__0\(7),
      I5 => \sm_reset_tx_pll_timer_ctr_reg__0\(6),
      O => sm_reset_tx_pll_timer_sat_i_3_n_0
    );
sm_reset_tx_pll_timer_sat_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => sm_reset_tx_pll_timer_sat_i_1_n_0,
      Q => sm_reset_tx_pll_timer_sat,
      R => '0'
    );
sm_reset_tx_timer_clr_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => bit_synchronizer_gtwiz_reset_userclk_tx_active_inst_n_1,
      Q => sm_reset_tx_timer_clr_reg_n_0,
      S => gtwiz_reset_tx_any_sync
    );
\sm_reset_tx_timer_ctr0_inferred__0/i_\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => sm_reset_tx_timer_ctr(2),
      I1 => sm_reset_tx_timer_ctr(0),
      I2 => sm_reset_tx_timer_ctr(1),
      O => p_0_in
    );
\sm_reset_tx_timer_ctr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sm_reset_tx_timer_ctr(0),
      O => p_1_in(0)
    );
\sm_reset_tx_timer_ctr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => sm_reset_tx_timer_ctr(0),
      I1 => sm_reset_tx_timer_ctr(1),
      O => p_1_in(1)
    );
\sm_reset_tx_timer_ctr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => sm_reset_tx_timer_ctr(0),
      I1 => sm_reset_tx_timer_ctr(1),
      I2 => sm_reset_tx_timer_ctr(2),
      O => p_1_in(2)
    );
\sm_reset_tx_timer_ctr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => p_0_in,
      D => p_1_in(0),
      Q => sm_reset_tx_timer_ctr(0),
      R => sm_reset_tx_timer_clr_reg_n_0
    );
\sm_reset_tx_timer_ctr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => p_0_in,
      D => p_1_in(1),
      Q => sm_reset_tx_timer_ctr(1),
      R => sm_reset_tx_timer_clr_reg_n_0
    );
\sm_reset_tx_timer_ctr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => p_0_in,
      D => p_1_in(2),
      Q => sm_reset_tx_timer_ctr(2),
      R => sm_reset_tx_timer_clr_reg_n_0
    );
sm_reset_tx_timer_sat_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FF80"
    )
        port map (
      I0 => sm_reset_tx_timer_ctr(2),
      I1 => sm_reset_tx_timer_ctr(0),
      I2 => sm_reset_tx_timer_ctr(1),
      I3 => sm_reset_tx_timer_sat,
      I4 => sm_reset_tx_timer_clr_reg_n_0,
      O => sm_reset_tx_timer_sat_i_1_n_0
    );
sm_reset_tx_timer_sat_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => sm_reset_tx_timer_sat_i_1_n_0,
      Q => sm_reset_tx_timer_sat,
      R => '0'
    );
txuserrdy_out_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => sm_reset_tx(1),
      I1 => sm_reset_tx(2),
      I2 => sm_reset_tx_timer_clr_reg_n_0,
      I3 => sm_reset_tx_timer_sat,
      O => txuserrdy_out_i_3_n_0
    );
txuserrdy_out_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => gtwiz_reset_clk_freerun_in(0),
      CE => '1',
      D => reset_synchronizer_gtwiz_reset_tx_any_inst_n_3,
      Q => \^gen_gtwizard_gthe3.txuserrdy_int\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_AURORA_LANE_4BYTE is
  port (
    lane_up : out STD_LOGIC;
    ena_comma_align_i : out STD_LOGIC;
    consecutive_commas_r : out STD_LOGIC;
    begin_r : out STD_LOGIC;
    enable_err_detect_i : out STD_LOGIC;
    txctrl2_in : out STD_LOGIC_VECTOR ( 3 downto 0 );
    got_v_i : out STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    m_axi_rx_fc_nb : out STD_LOGIC_VECTOR ( 0 to 3 );
    rxpolarity_in : out STD_LOGIC_VECTOR ( 0 to 0 );
    \channel_fcnb_r_reg[7]\ : out STD_LOGIC;
    \channel_fcnb_r_reg[6]\ : out STD_LOGIC;
    \channel_fcnb_r_reg[5]\ : out STD_LOGIC;
    \channel_fcnb_r_reg[4]\ : out STD_LOGIC;
    hard_err_i : out STD_LOGIC;
    \left_align_select_r_reg[1]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \word_aligned_data_r_reg[9]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \word_aligned_control_bits_r_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    stage_1_load_nfc_r_reg : out STD_LOGIC;
    m_axi_nfc_rx_tvalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stage_1_pad_r_reg : out STD_LOGIC;
    \rx_spa_r_reg[4]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    in_frame_r_reg : out STD_LOGIC;
    \stage_1_ecp_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \stage_1_scp_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \IN_FRAME_reg[1]\ : out STD_LOGIC;
    gtwiz_userdata_tx_in : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \rx_ecp_d_r_reg[7]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \rx_sp_neg_d_r_reg[1]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \rx_snf_d_r_reg[0]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \DEFRAMED_DATA_V_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \soft_err_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    after_scp_select_c_0 : out STD_LOGIC;
    after_scp_select_c_1 : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk : in STD_LOGIC;
    gen_cc_i : in STD_LOGIC;
    gen_snf_striped_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gen_ecp_i : in STD_LOGIC;
    gen_scp_striped_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    gen_a_i : in STD_LOGIC;
    \left_align_select_r_reg[1]_0\ : in STD_LOGIC;
    \previous_cycle_control_r_reg[0]\ : in STD_LOGIC;
    hard_err_gt0 : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    rxbyterealign_out : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrxreset_out_reg : in STD_LOGIC;
    consecutive_commas_r_reg : in STD_LOGIC;
    rxctrl0_out : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gtwiz_userdata_rx_out : in STD_LOGIC_VECTOR ( 31 downto 0 );
    D : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gen_v_flop_1_i : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \GEN_PAD_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \TX_PE_DATA_V_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gen_r_flop_0_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gen_k_flop_0_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \TX_PE_DATA_reg[0]\ : in STD_LOGIC_VECTOR ( 31 downto 0 );
    \FC_NB_reg[0]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrxreset_out_reg_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \left_align_select_r_reg[1]_1\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \previous_cycle_data_r_reg[6]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ENABLE_ERR_DETECT_reg : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_AURORA_LANE_4BYTE : entity is "dnpcie_aurora_2_sim_AURORA_LANE_4BYTE";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_AURORA_LANE_4BYTE;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_AURORA_LANE_4BYTE is
  signal GEN_SP : STD_LOGIC;
  signal RX_CC : STD_LOGIC;
  signal RX_NEG : STD_LOGIC;
  signal counter3_r0 : STD_LOGIC;
  signal counter4_r0 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_lane_init_sm_4byte_i_n_9 : STD_LOGIC;
  signal \^enable_err_detect_i\ : STD_LOGIC;
  signal first_v_received_r : STD_LOGIC;
  signal gen_spa_i : STD_LOGIC;
  signal gen_spa_r : STD_LOGIC;
  signal \^lane_up\ : STD_LOGIC;
  signal ready_r : STD_LOGIC;
  signal ready_r_reg0 : STD_LOGIC;
begin
  enable_err_detect_i <= \^enable_err_detect_i\;
  lane_up <= \^lane_up\;
dnpcie_aurora_2_sim_err_detect_4byte_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_ERR_DETECT_4BYTE
     port map (
      ENABLE_ERR_DETECT_reg(3 downto 0) => ENABLE_ERR_DETECT_reg(3 downto 0),
      SR(0) => dnpcie_aurora_2_sim_lane_init_sm_4byte_i_n_9,
      enable_err_detect_i => \^enable_err_detect_i\,
      hard_err_gt0 => hard_err_gt0,
      hard_err_i => hard_err_i,
      ready_r_reg0 => ready_r_reg0,
      reset_lanes_flop_i(0) => SR(0),
      \soft_err_r_reg[0]_0\(1 downto 0) => \soft_err_r_reg[0]\(1 downto 0),
      user_clk => user_clk
    );
dnpcie_aurora_2_sim_hotplug_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_hotplug
     port map (
      D(0) => RX_CC,
      SR(0) => SR(0),
      init_clk_in => init_clk_in,
      link_reset_out => link_reset_out,
      user_clk => user_clk
    );
dnpcie_aurora_2_sim_lane_init_sm_4byte_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LANE_INIT_SM_4BYTE
     port map (
      D(3 downto 0) => D(3 downto 0),
      GEN_SP => GEN_SP,
      RX_NEG => RX_NEG,
      SR(0) => SR(0),
      align_r_reg_0 => ena_comma_align_i,
      begin_r => begin_r,
      consecutive_commas_r => consecutive_commas_r,
      consecutive_commas_r_reg_0 => consecutive_commas_r_reg,
      counter3_r0 => counter3_r0,
      counter4_r0 => counter4_r0,
      enable_err_detect_i => \^enable_err_detect_i\,
      first_v_received_r => first_v_received_r,
      gen_spa_i => gen_spa_i,
      gen_spa_r => gen_spa_r,
      gtrxreset_out_reg => gtrxreset_out_reg,
      hard_err_frm_soft_err_reg(0) => dnpcie_aurora_2_sim_lane_init_sm_4byte_i_n_9,
      lane_up => \^lane_up\,
      \left_align_select_r_reg[1]\ => \left_align_select_r_reg[1]\,
      ready_r => ready_r,
      ready_r_reg0 => ready_r_reg0,
      rxbyterealign_out(0) => rxbyterealign_out(0),
      rxctrl0_out(1 downto 0) => rxctrl0_out(3 downto 2),
      rxpolarity_in(0) => rxpolarity_in(0),
      user_clk => user_clk
    );
dnpcie_aurora_2_sim_sym_dec_4byte_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SYM_DEC_4BYTE
     port map (
      D(0) => RX_CC,
      \DEFRAMED_DATA_V_reg[0]\(1 downto 0) => \DEFRAMED_DATA_V_reg[0]\(1 downto 0),
      E(0) => E(0),
      \IN_FRAME_reg[1]\ => \IN_FRAME_reg[1]\,
      Q(1 downto 0) => Q(1 downto 0),
      RX_NEG => RX_NEG,
      after_scp_select_c_0 => after_scp_select_c_0,
      after_scp_select_c_1 => after_scp_select_c_1,
      \channel_fcnb_r_reg[4]\ => \channel_fcnb_r_reg[4]\,
      \channel_fcnb_r_reg[5]\ => \channel_fcnb_r_reg[5]\,
      \channel_fcnb_r_reg[6]\ => \channel_fcnb_r_reg[6]\,
      \channel_fcnb_r_reg[7]\ => \channel_fcnb_r_reg[7]\,
      counter3_r0 => counter3_r0,
      counter4_r0 => counter4_r0,
      first_v_received_r => first_v_received_r,
      gen_spa_i => gen_spa_i,
      got_v_i => got_v_i,
      gtrxreset_out_reg(1 downto 0) => gtrxreset_out_reg_0(1 downto 0),
      gtwiz_userdata_rx_out(31 downto 0) => gtwiz_userdata_rx_out(31 downto 0),
      in_frame_r_reg => in_frame_r_reg,
      lane_up => \^lane_up\,
      \left_align_select_r_reg[1]_0\ => \left_align_select_r_reg[1]_0\,
      \left_align_select_r_reg[1]_1\(7 downto 0) => \left_align_select_r_reg[1]_1\(7 downto 0),
      m_axi_nfc_rx_tvalid(1 downto 0) => m_axi_nfc_rx_tvalid(1 downto 0),
      m_axi_rx_fc_nb(0 to 3) => m_axi_rx_fc_nb(0 to 3),
      \previous_cycle_control_r_reg[0]_0\ => \previous_cycle_control_r_reg[0]\,
      \previous_cycle_data_r_reg[6]_0\(3 downto 0) => \previous_cycle_data_r_reg[6]\(3 downto 0),
      ready_r => ready_r,
      \rx_ecp_d_r_reg[7]_0\(3 downto 0) => \rx_ecp_d_r_reg[7]\(3 downto 0),
      \rx_snf_d_r_reg[0]_0\(7 downto 0) => \rx_snf_d_r_reg[0]\(7 downto 0),
      \rx_sp_neg_d_r_reg[1]_0\(3 downto 0) => \rx_sp_neg_d_r_reg[1]\(3 downto 0),
      \rx_spa_r_reg[4]_0\(7 downto 0) => \rx_spa_r_reg[4]\(7 downto 0),
      rxctrl0_out(3 downto 0) => rxctrl0_out(3 downto 0),
      \stage_1_ecp_r_reg[0]\(1 downto 0) => \stage_1_ecp_r_reg[0]\(1 downto 0),
      stage_1_load_nfc_r_reg => stage_1_load_nfc_r_reg,
      stage_1_pad_r_reg => stage_1_pad_r_reg,
      \stage_1_scp_r_reg[0]\(1 downto 0) => \stage_1_scp_r_reg[0]\(1 downto 0),
      user_clk => user_clk,
      \word_aligned_control_bits_r_reg[1]_0\(0) => \word_aligned_control_bits_r_reg[1]\(0),
      \word_aligned_data_r_reg[9]_0\(3 downto 0) => \word_aligned_data_r_reg[9]\(3 downto 0)
    );
dnpcie_aurora_2_sim_sym_gen_4byte_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_SYM_GEN_4BYTE
     port map (
      \FC_NB_reg[0]\(3 downto 0) => \FC_NB_reg[0]\(3 downto 0),
      \GEN_PAD_reg[0]\(1 downto 0) => \GEN_PAD_reg[0]\(1 downto 0),
      GEN_SP => GEN_SP,
      \TX_PE_DATA_V_reg[0]\(1 downto 0) => \TX_PE_DATA_V_reg[0]\(1 downto 0),
      \TX_PE_DATA_reg[0]\(31 downto 0) => \TX_PE_DATA_reg[0]\(31 downto 0),
      gen_a_i => gen_a_i,
      gen_cc_i => gen_cc_i,
      gen_ecp_i => gen_ecp_i,
      gen_k_flop_0_i(3 downto 0) => gen_k_flop_0_i(3 downto 0),
      gen_r_flop_0_i(3 downto 0) => gen_r_flop_0_i(3 downto 0),
      gen_scp_striped_i(0) => gen_scp_striped_i(0),
      gen_snf_striped_i(0) => gen_snf_striped_i(0),
      gen_spa_i => gen_spa_i,
      gen_spa_r => gen_spa_r,
      gen_v_flop_1_i(2 downto 0) => gen_v_flop_1_i(2 downto 0),
      gtwiz_userdata_tx_in(31 downto 0) => gtwiz_userdata_tx_in(31 downto 0),
      txctrl2_in(3 downto 0) => txctrl2_in(3 downto 0),
      user_clk => user_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL is
  port (
    rx_eof : out STD_LOGIC;
    frame_err : out STD_LOGIC;
    m_axi_rx_tlast : out STD_LOGIC;
    m_axi_rx_tvalid : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \m_axi_rx_tkeep[2]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 31 );
    \RX_ECP_reg[0]\ : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \RX_ECP_reg[1]\ : in STD_LOGIC;
    after_scp_select_c_1 : in STD_LOGIC;
    after_scp_select_c_0 : in STD_LOGIC;
    \RX_SNF_reg[0]\ : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    SS : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RX_SNF_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \RX_PAD_reg[1]\ : in STD_LOGIC;
    m_axi_rx_fc_nb : in STD_LOGIC_VECTOR ( 0 to 3 );
    \word_aligned_data_r_reg[0]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \word_aligned_data_r_reg[12]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \word_aligned_data_r_reg[16]\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \word_aligned_data_r_reg[28]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \word_aligned_data_r_reg[27]\ : in STD_LOGIC;
    \word_aligned_data_r_reg[26]\ : in STD_LOGIC;
    \word_aligned_data_r_reg[25]\ : in STD_LOGIC;
    \word_aligned_data_r_reg[24]\ : in STD_LOGIC;
    tx_dst_rdy : in STD_LOGIC;
    do_cc_r : in STD_LOGIC;
    start_rx_i : in STD_LOGIC;
    \RX_PE_DATA_V_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \RX_ECP_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL : entity is "dnpcie_aurora_2_sim_RX_LL";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL is
  signal \STORAGE_DATA[0]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[10]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[11]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[12]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[13]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[14]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[15]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[16]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[17]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[18]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[19]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[1]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[20]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[21]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[22]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[23]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[24]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[25]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[26]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[27]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[28]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[29]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[2]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[30]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[31]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[3]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[4]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[5]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[6]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[7]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[8]_i_1_n_0\ : STD_LOGIC;
  signal \STORAGE_DATA[9]_i_1_n_0\ : STD_LOGIC;
  signal STORAGE_SELECT : STD_LOGIC_VECTOR ( 4 to 9 );
  signal channel_fcnb_r : STD_LOGIC_VECTOR ( 0 to 7 );
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rx_ll_pdu_datapath_i_n_22 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_23 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_24 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_25 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_26 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_27 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_28 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_29 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_30 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_31 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_32 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_33 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_34 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_35 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_36 : STD_LOGIC;
  signal rx_ll_pdu_datapath_i_n_37 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \STORAGE_DATA[0]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \STORAGE_DATA[10]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \STORAGE_DATA[11]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \STORAGE_DATA[12]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \STORAGE_DATA[13]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \STORAGE_DATA[14]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \STORAGE_DATA[15]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \STORAGE_DATA[16]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \STORAGE_DATA[17]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \STORAGE_DATA[18]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \STORAGE_DATA[19]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \STORAGE_DATA[1]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \STORAGE_DATA[20]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \STORAGE_DATA[21]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \STORAGE_DATA[22]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \STORAGE_DATA[23]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \STORAGE_DATA[24]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \STORAGE_DATA[25]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \STORAGE_DATA[26]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \STORAGE_DATA[27]_i_1\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \STORAGE_DATA[28]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \STORAGE_DATA[29]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \STORAGE_DATA[2]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \STORAGE_DATA[30]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \STORAGE_DATA[31]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \STORAGE_DATA[3]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \STORAGE_DATA[4]_i_1\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \STORAGE_DATA[5]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \STORAGE_DATA[6]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \STORAGE_DATA[7]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \STORAGE_DATA[8]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \STORAGE_DATA[9]_i_1\ : label is "soft_lutpair87";
begin
\STORAGE_DATA[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_22,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(15),
      O => \STORAGE_DATA[0]_i_1_n_0\
    );
\STORAGE_DATA[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_32,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(5),
      O => \STORAGE_DATA[10]_i_1_n_0\
    );
\STORAGE_DATA[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_33,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(4),
      O => \STORAGE_DATA[11]_i_1_n_0\
    );
\STORAGE_DATA[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_34,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(3),
      O => \STORAGE_DATA[12]_i_1_n_0\
    );
\STORAGE_DATA[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_35,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(2),
      O => \STORAGE_DATA[13]_i_1_n_0\
    );
\STORAGE_DATA[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_36,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(1),
      O => \STORAGE_DATA[14]_i_1_n_0\
    );
\STORAGE_DATA[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_37,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(0),
      O => \STORAGE_DATA[15]_i_1_n_0\
    );
\STORAGE_DATA[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_22,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(15),
      O => \STORAGE_DATA[16]_i_1_n_0\
    );
\STORAGE_DATA[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_23,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(14),
      O => \STORAGE_DATA[17]_i_1_n_0\
    );
\STORAGE_DATA[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_24,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(13),
      O => \STORAGE_DATA[18]_i_1_n_0\
    );
\STORAGE_DATA[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_25,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(12),
      O => \STORAGE_DATA[19]_i_1_n_0\
    );
\STORAGE_DATA[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_23,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(14),
      O => \STORAGE_DATA[1]_i_1_n_0\
    );
\STORAGE_DATA[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_26,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(11),
      O => \STORAGE_DATA[20]_i_1_n_0\
    );
\STORAGE_DATA[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_27,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(10),
      O => \STORAGE_DATA[21]_i_1_n_0\
    );
\STORAGE_DATA[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_28,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(9),
      O => \STORAGE_DATA[22]_i_1_n_0\
    );
\STORAGE_DATA[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_29,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(8),
      O => \STORAGE_DATA[23]_i_1_n_0\
    );
\STORAGE_DATA[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_30,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(7),
      O => \STORAGE_DATA[24]_i_1_n_0\
    );
\STORAGE_DATA[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_31,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(6),
      O => \STORAGE_DATA[25]_i_1_n_0\
    );
\STORAGE_DATA[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_32,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(5),
      O => \STORAGE_DATA[26]_i_1_n_0\
    );
\STORAGE_DATA[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_33,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(4),
      O => \STORAGE_DATA[27]_i_1_n_0\
    );
\STORAGE_DATA[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_34,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(3),
      O => \STORAGE_DATA[28]_i_1_n_0\
    );
\STORAGE_DATA[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_35,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(2),
      O => \STORAGE_DATA[29]_i_1_n_0\
    );
\STORAGE_DATA[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_24,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(13),
      O => \STORAGE_DATA[2]_i_1_n_0\
    );
\STORAGE_DATA[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_36,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(1),
      O => \STORAGE_DATA[30]_i_1_n_0\
    );
\STORAGE_DATA[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_37,
      I1 => STORAGE_SELECT(9),
      I2 => p_1_in(0),
      O => \STORAGE_DATA[31]_i_1_n_0\
    );
\STORAGE_DATA[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_25,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(12),
      O => \STORAGE_DATA[3]_i_1_n_0\
    );
\STORAGE_DATA[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_26,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(11),
      O => \STORAGE_DATA[4]_i_1_n_0\
    );
\STORAGE_DATA[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_27,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(10),
      O => \STORAGE_DATA[5]_i_1_n_0\
    );
\STORAGE_DATA[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_28,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(9),
      O => \STORAGE_DATA[6]_i_1_n_0\
    );
\STORAGE_DATA[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_29,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(8),
      O => \STORAGE_DATA[7]_i_1_n_0\
    );
\STORAGE_DATA[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_30,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(7),
      O => \STORAGE_DATA[8]_i_1_n_0\
    );
\STORAGE_DATA[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_ll_pdu_datapath_i_n_31,
      I1 => STORAGE_SELECT(4),
      I2 => p_1_in(6),
      O => \STORAGE_DATA[9]_i_1_n_0\
    );
nfc_module_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_NFC
     port map (
      D(7) => channel_fcnb_r(0),
      D(6) => channel_fcnb_r(1),
      D(5) => channel_fcnb_r(2),
      D(4) => channel_fcnb_r(3),
      D(3) => channel_fcnb_r(4),
      D(2) => channel_fcnb_r(5),
      D(1) => channel_fcnb_r(6),
      D(0) => channel_fcnb_r(7),
      Q(0) => Q(0),
      \RX_SNF_reg[0]\ => \RX_SNF_reg[0]\,
      \RX_SNF_reg[1]\(0) => \RX_SNF_reg[1]\(0),
      SS(0) => SS(0),
      do_cc_r => do_cc_r,
      m_axi_rx_fc_nb(0 to 3) => m_axi_rx_fc_nb(0 to 3),
      tx_dst_rdy => tx_dst_rdy,
      user_clk => user_clk,
      \word_aligned_data_r_reg[24]\ => \word_aligned_data_r_reg[24]\,
      \word_aligned_data_r_reg[25]\ => \word_aligned_data_r_reg[25]\,
      \word_aligned_data_r_reg[26]\ => \word_aligned_data_r_reg[26]\,
      \word_aligned_data_r_reg[27]\ => \word_aligned_data_r_reg[27]\
    );
rx_ll_pdu_datapath_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL_PDU_DATAPATH
     port map (
      D(1 downto 0) => D(1 downto 0),
      \MUXED_DATA_reg[16]\(31) => \STORAGE_DATA[0]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(30) => \STORAGE_DATA[1]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(29) => \STORAGE_DATA[2]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(28) => \STORAGE_DATA[3]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(27) => \STORAGE_DATA[4]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(26) => \STORAGE_DATA[5]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(25) => \STORAGE_DATA[6]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(24) => \STORAGE_DATA[7]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(23) => \STORAGE_DATA[8]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(22) => \STORAGE_DATA[9]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(21) => \STORAGE_DATA[10]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(20) => \STORAGE_DATA[11]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(19) => \STORAGE_DATA[12]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(18) => \STORAGE_DATA[13]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(17) => \STORAGE_DATA[14]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(16) => \STORAGE_DATA[15]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(15) => \STORAGE_DATA[16]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(14) => \STORAGE_DATA[17]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(13) => \STORAGE_DATA[18]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(12) => \STORAGE_DATA[19]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(11) => \STORAGE_DATA[20]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(10) => \STORAGE_DATA[21]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(9) => \STORAGE_DATA[22]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(8) => \STORAGE_DATA[23]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(7) => \STORAGE_DATA[24]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(6) => \STORAGE_DATA[25]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(5) => \STORAGE_DATA[26]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(4) => \STORAGE_DATA[27]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(3) => \STORAGE_DATA[28]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(2) => \STORAGE_DATA[29]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(1) => \STORAGE_DATA[30]_i_1_n_0\,
      \MUXED_DATA_reg[16]\(0) => \STORAGE_DATA[31]_i_1_n_0\,
      Q(31 downto 16) => p_1_in(15 downto 0),
      Q(15) => rx_ll_pdu_datapath_i_n_22,
      Q(14) => rx_ll_pdu_datapath_i_n_23,
      Q(13) => rx_ll_pdu_datapath_i_n_24,
      Q(12) => rx_ll_pdu_datapath_i_n_25,
      Q(11) => rx_ll_pdu_datapath_i_n_26,
      Q(10) => rx_ll_pdu_datapath_i_n_27,
      Q(9) => rx_ll_pdu_datapath_i_n_28,
      Q(8) => rx_ll_pdu_datapath_i_n_29,
      Q(7) => rx_ll_pdu_datapath_i_n_30,
      Q(6) => rx_ll_pdu_datapath_i_n_31,
      Q(5) => rx_ll_pdu_datapath_i_n_32,
      Q(4) => rx_ll_pdu_datapath_i_n_33,
      Q(3) => rx_ll_pdu_datapath_i_n_34,
      Q(2) => rx_ll_pdu_datapath_i_n_35,
      Q(1) => rx_ll_pdu_datapath_i_n_36,
      Q(0) => rx_ll_pdu_datapath_i_n_37,
      \RX_ECP_reg[0]\ => \RX_ECP_reg[0]\,
      \RX_ECP_reg[0]_0\(1 downto 0) => \RX_ECP_reg[0]_0\(1 downto 0),
      \RX_ECP_reg[1]\ => \RX_ECP_reg[1]\,
      \RX_PAD_reg[1]\ => \RX_PAD_reg[1]\,
      \RX_PE_DATA_V_reg[0]\(1 downto 0) => \RX_PE_DATA_V_reg[0]\(1 downto 0),
      SS(0) => SS(0),
      \STORAGE_DATA_reg[0]\(1) => STORAGE_SELECT(4),
      \STORAGE_DATA_reg[0]\(0) => STORAGE_SELECT(9),
      after_scp_select_c_0 => after_scp_select_c_0,
      after_scp_select_c_1 => after_scp_select_c_1,
      \channel_fcnb_r_reg[0]\(7) => channel_fcnb_r(0),
      \channel_fcnb_r_reg[0]\(6) => channel_fcnb_r(1),
      \channel_fcnb_r_reg[0]\(5) => channel_fcnb_r(2),
      \channel_fcnb_r_reg[0]\(4) => channel_fcnb_r(3),
      \channel_fcnb_r_reg[0]\(3) => channel_fcnb_r(4),
      \channel_fcnb_r_reg[0]\(2) => channel_fcnb_r(5),
      \channel_fcnb_r_reg[0]\(1) => channel_fcnb_r(6),
      \channel_fcnb_r_reg[0]\(0) => channel_fcnb_r(7),
      frame_err => frame_err,
      m_axi_rx_tdata(0 to 31) => m_axi_rx_tdata(0 to 31),
      \m_axi_rx_tkeep[2]\(1 downto 0) => \m_axi_rx_tkeep[2]\(1 downto 0),
      m_axi_rx_tlast => m_axi_rx_tlast,
      m_axi_rx_tvalid => m_axi_rx_tvalid,
      rx_eof => rx_eof,
      start_rx_i => start_rx_i,
      user_clk => user_clk,
      \word_aligned_data_r_reg[0]\(7 downto 0) => \word_aligned_data_r_reg[0]\(7 downto 0),
      \word_aligned_data_r_reg[12]\(3 downto 0) => \word_aligned_data_r_reg[12]\(3 downto 0),
      \word_aligned_data_r_reg[16]\(7 downto 0) => \word_aligned_data_r_reg[16]\(7 downto 0),
      \word_aligned_data_r_reg[28]\(3 downto 0) => \word_aligned_data_r_reg[28]\(3 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_gthe3 is
  port (
    gtpowergood_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    cplllock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrlock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    cpllfbclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    cpllrefclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    drprdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    eyescandataerror_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclkmonitor_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcierategen3_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcierateidle_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pciesynctxsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieusergen3rdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserphystatusrst_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserratestart_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    phystatus_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    resetexception_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbyteisaligned_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbyterealign_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrphdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanbondseq_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanisaligned_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanrealign_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcominitdet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcommadet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcomsasdet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcomwakedet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlysresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxelecidle_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstarted_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobestarted_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclkfabric_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclkpcs_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxphaligndone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalignerr_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbserr_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbslocked_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprgdivresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxqpisenn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxqpisenp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxratedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxrecclkout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsliderdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipoutclkrdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslippmardy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxvalid_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txcomfinish_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txdlysresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclkfabric_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclkpcs_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txphaligndone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txphinitdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txprgdivresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txqpisenn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txqpisenp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txratedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcsrsvdout_out : out STD_LOGIC_VECTOR ( 11 downto 0 );
    rxdata_out : out STD_LOGIC_VECTOR ( 127 downto 0 );
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rxctrl0_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rxctrl1_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dmonitorout_out : out STD_LOGIC_VECTOR ( 16 downto 0 );
    pcierateqpllpd_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    pcierateqpllreset_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxclkcorcnt_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxdatavalid_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxheadervalid_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxstartofseq_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    bufgtce_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtcemask_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtreset_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtrstmask_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxchbondo_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rxheader_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    pinrsrvdas_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxctrl2_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxctrl3_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxdataextendrsvd_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    bufgtdiv_out : out STD_LOGIC_VECTOR ( 8 downto 0 );
    gtwiz_reset_tx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_cdr_stable_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_tx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cfgreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    clkrsvd0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    clkrsvd1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cplllockdetclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cplllocken_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cpllreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    dmonfiforeset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    dmonitorclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpwe_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphicaldone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphicalstart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphidrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphidwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphixrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphixwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescanmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescanreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescantrigger_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtgrefclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxn_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxp_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtresetsel_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    lpbkrxtxseren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    lpbktxrxseren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcieeqrxeqadaptdone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcierstidle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pciersttxsyncstart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserratedone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0clk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0refclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1clk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1refclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    resetovrd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rstclkentx_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rx8b10ben_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxbufreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrfreqreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrresetrsv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbonden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbondmaster_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbondslave_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcommadeten_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeagchold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeagcovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelfovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelpmreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap10hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap10ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap11hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap11ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap12hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap12ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap13hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap13ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap14hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap14ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap15hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap15ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap2hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap2ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap3hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap3ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap4hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap4ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap5hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap5ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap6hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap6ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap7hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap7ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap8hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap8ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap9hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap9ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeuthold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeutovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevphold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevpovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevsen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfexyden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlybypass_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlyen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlyovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlysreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxgearboxslip_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlatclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmgchold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmgcovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmhfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmhfovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmlfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmlfklovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmoshold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmosovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxmcommaalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoobreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoscalreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoshold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinten_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinthold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobe_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinttestovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpcommaalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpcsreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalign_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphdlypd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphdlyreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpmareset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpolarity_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbscntreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxqpien_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxratemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslide_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipoutclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslippma_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncallin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sigvalidclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx8b10ben_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcominit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcomsas_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcomwake_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdeemph_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdetectrx_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdiffpd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlybypass_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlysreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyupdown_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txelecidle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txinhibit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txlatclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpcsreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpdelecidlemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphalign_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlypd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlyreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlytstclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphinit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmpd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmsel_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpisopd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpmareset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpolarity_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpostcursorinv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txprbsforceerr_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txprecursorinv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txqpibiasen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txqpistrongpdown_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txqpiweakpup_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txratemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txswing_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncallin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userdata_tx_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gtrsvd_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    pcsrsvdin_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txctrl0_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txctrl1_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rxdfeagcctrl_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxelecidlemode_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxpllclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxsysclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txpllclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txsysclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cpllrefclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxchbondlevel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxoutclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txbufdiffctrl_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txmargin_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txoutclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxosintcfg_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxprbssel_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    txprbssel_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pcsrsvdin2_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    pmarsvdin_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    rxchbondi_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txpippmstepsize_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txheader_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    txmaincursor_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    txsequence_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    tx8b10bbypass_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txctrl2_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txdataextendrsvd_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gtwiz_reset_all_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_gthe3 : entity is "dnpcie_aurora_2_sim_gt_gtwizard_gthe3";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_gthe3;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_gthe3 is
  signal \^cplllock_out\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \gen_gtwizard_gthe3.cpllpd_ch_int\ : STD_LOGIC;
  signal \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\ : STD_LOGIC;
  signal \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\ : STD_LOGIC;
  signal \gen_gtwizard_gthe3.gtrxreset_int\ : STD_LOGIC;
  signal \gen_gtwizard_gthe3.gttxreset_int\ : STD_LOGIC;
  signal \gen_gtwizard_gthe3.rxprogdivreset_int\ : STD_LOGIC;
  signal \gen_gtwizard_gthe3.rxuserrdy_int\ : STD_LOGIC;
  signal \gen_gtwizard_gthe3.txprogdivreset_int\ : STD_LOGIC;
  signal \gen_gtwizard_gthe3.txuserrdy_int\ : STD_LOGIC;
  signal \^gtpowergood_out\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rst_in0 : STD_LOGIC;
  signal \^rxcdrlock_out\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^rxresetdone_out\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^txresetdone_out\ : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  cplllock_out(0) <= \^cplllock_out\(0);
  gtpowergood_out(0) <= \^gtpowergood_out\(0);
  rxcdrlock_out(0) <= \^rxcdrlock_out\(0);
  rxresetdone_out(0) <= \^rxresetdone_out\(0);
  txresetdone_out(0) <= \^txresetdone_out\(0);
\gen_gtwizard_gthe3.gen_channel_container[0].gen_enabled_channel.gthe3_channel_wrapper_inst\: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gthe3_channel_wrapper
     port map (
      bufgtce_out(2 downto 0) => bufgtce_out(2 downto 0),
      bufgtcemask_out(2 downto 0) => bufgtcemask_out(2 downto 0),
      bufgtdiv_out(8 downto 0) => bufgtdiv_out(8 downto 0),
      bufgtreset_out(2 downto 0) => bufgtreset_out(2 downto 0),
      bufgtrstmask_out(2 downto 0) => bufgtrstmask_out(2 downto 0),
      cfgreset_in(0) => cfgreset_in(0),
      clkrsvd0_in(0) => clkrsvd0_in(0),
      clkrsvd1_in(0) => clkrsvd1_in(0),
      cpllfbclklost_out(0) => cpllfbclklost_out(0),
      cplllock_out(0) => \^cplllock_out\(0),
      cplllockdetclk_in(0) => cplllockdetclk_in(0),
      cplllocken_in(0) => cplllocken_in(0),
      cpllrefclklost_out(0) => cpllrefclklost_out(0),
      cpllrefclksel_in(2 downto 0) => cpllrefclksel_in(2 downto 0),
      cpllreset_in(0) => cpllreset_in(0),
      dmonfiforeset_in(0) => dmonfiforeset_in(0),
      dmonitorclk_in(0) => dmonitorclk_in(0),
      dmonitorout_out(16 downto 0) => dmonitorout_out(16 downto 0),
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in(0) => drpclk_in(0),
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in(0) => drpen_in(0),
      drprdy_out(0) => drprdy_out(0),
      drpwe_in(0) => drpwe_in(0),
      evoddphicaldone_in(0) => evoddphicaldone_in(0),
      evoddphicalstart_in(0) => evoddphicalstart_in(0),
      evoddphidrden_in(0) => evoddphidrden_in(0),
      evoddphidwren_in(0) => evoddphidwren_in(0),
      evoddphixrden_in(0) => evoddphixrden_in(0),
      evoddphixwren_in(0) => evoddphixwren_in(0),
      eyescandataerror_out(0) => eyescandataerror_out(0),
      eyescanmode_in(0) => eyescanmode_in(0),
      eyescanreset_in(0) => eyescanreset_in(0),
      eyescantrigger_in(0) => eyescantrigger_in(0),
      \gen_gtwizard_gthe3.cpllpd_ch_int\ => \gen_gtwizard_gthe3.cpllpd_ch_int\,
      \gen_gtwizard_gthe3.gtrxreset_int\ => \gen_gtwizard_gthe3.gtrxreset_int\,
      \gen_gtwizard_gthe3.gttxreset_int\ => \gen_gtwizard_gthe3.gttxreset_int\,
      \gen_gtwizard_gthe3.rxprogdivreset_int\ => \gen_gtwizard_gthe3.rxprogdivreset_int\,
      \gen_gtwizard_gthe3.rxuserrdy_int\ => \gen_gtwizard_gthe3.rxuserrdy_int\,
      \gen_gtwizard_gthe3.txprogdivreset_int\ => \gen_gtwizard_gthe3.txprogdivreset_int\,
      \gen_gtwizard_gthe3.txuserrdy_int\ => \gen_gtwizard_gthe3.txuserrdy_int\,
      gtgrefclk_in(0) => gtgrefclk_in(0),
      gthrxn_in(0) => gthrxn_in(0),
      gthrxp_in(0) => gthrxp_in(0),
      gthtxn_out(0) => gthtxn_out(0),
      gthtxp_out(0) => gthtxp_out(0),
      gtnorthrefclk0_in(0) => gtnorthrefclk0_in(0),
      gtnorthrefclk1_in(0) => gtnorthrefclk1_in(0),
      gtpowergood_out(0) => \^gtpowergood_out\(0),
      gtrefclk0_in(0) => gtrefclk0_in(0),
      gtrefclk1_in(0) => gtrefclk1_in(0),
      gtrefclkmonitor_out(0) => gtrefclkmonitor_out(0),
      gtresetsel_in(0) => gtresetsel_in(0),
      gtrsvd_in(15 downto 0) => gtrsvd_in(15 downto 0),
      gtsouthrefclk0_in(0) => gtsouthrefclk0_in(0),
      gtsouthrefclk1_in(0) => gtsouthrefclk1_in(0),
      gtwiz_userdata_tx_in(31 downto 0) => gtwiz_userdata_tx_in(31 downto 0),
      loopback_in(2 downto 0) => loopback_in(2 downto 0),
      lpbkrxtxseren_in(0) => lpbkrxtxseren_in(0),
      lpbktxrxseren_in(0) => lpbktxrxseren_in(0),
      pcieeqrxeqadaptdone_in(0) => pcieeqrxeqadaptdone_in(0),
      pcierategen3_out(0) => pcierategen3_out(0),
      pcierateidle_out(0) => pcierateidle_out(0),
      pcierateqpllpd_out(1 downto 0) => pcierateqpllpd_out(1 downto 0),
      pcierateqpllreset_out(1 downto 0) => pcierateqpllreset_out(1 downto 0),
      pcierstidle_in(0) => pcierstidle_in(0),
      pciersttxsyncstart_in(0) => pciersttxsyncstart_in(0),
      pciesynctxsyncdone_out(0) => pciesynctxsyncdone_out(0),
      pcieusergen3rdy_out(0) => pcieusergen3rdy_out(0),
      pcieuserphystatusrst_out(0) => pcieuserphystatusrst_out(0),
      pcieuserratedone_in(0) => pcieuserratedone_in(0),
      pcieuserratestart_out(0) => pcieuserratestart_out(0),
      pcsrsvdin2_in(4 downto 0) => pcsrsvdin2_in(4 downto 0),
      pcsrsvdin_in(15 downto 0) => pcsrsvdin_in(15 downto 0),
      pcsrsvdout_out(11 downto 0) => pcsrsvdout_out(11 downto 0),
      phystatus_out(0) => phystatus_out(0),
      pinrsrvdas_out(7 downto 0) => pinrsrvdas_out(7 downto 0),
      pmarsvdin_in(4 downto 0) => pmarsvdin_in(4 downto 0),
      qpll0clk_in(0) => qpll0clk_in(0),
      qpll0refclk_in(0) => qpll0refclk_in(0),
      qpll1clk_in(0) => qpll1clk_in(0),
      qpll1refclk_in(0) => qpll1refclk_in(0),
      resetexception_out(0) => resetexception_out(0),
      resetovrd_in(0) => resetovrd_in(0),
      rst_in0 => rst_in0,
      rstclkentx_in(0) => rstclkentx_in(0),
      rx8b10ben_in(0) => rx8b10ben_in(0),
      rxbufreset_in(0) => rxbufreset_in(0),
      rxbufstatus_out(2 downto 0) => rxbufstatus_out(2 downto 0),
      rxbyteisaligned_out(0) => rxbyteisaligned_out(0),
      rxbyterealign_out(0) => rxbyterealign_out(0),
      rxcdrfreqreset_in(0) => rxcdrfreqreset_in(0),
      rxcdrhold_in(0) => rxcdrhold_in(0),
      rxcdrlock_out(0) => \^rxcdrlock_out\(0),
      rxcdrovrden_in(0) => rxcdrovrden_in(0),
      rxcdrphdone_out(0) => rxcdrphdone_out(0),
      rxcdrreset_in(0) => rxcdrreset_in(0),
      rxcdrresetrsv_in(0) => rxcdrresetrsv_in(0),
      rxchanbondseq_out(0) => rxchanbondseq_out(0),
      rxchanisaligned_out(0) => rxchanisaligned_out(0),
      rxchanrealign_out(0) => rxchanrealign_out(0),
      rxchbonden_in(0) => rxchbonden_in(0),
      rxchbondi_in(4 downto 0) => rxchbondi_in(4 downto 0),
      rxchbondlevel_in(2 downto 0) => rxchbondlevel_in(2 downto 0),
      rxchbondmaster_in(0) => rxchbondmaster_in(0),
      rxchbondo_out(4 downto 0) => rxchbondo_out(4 downto 0),
      rxchbondslave_in(0) => rxchbondslave_in(0),
      rxclkcorcnt_out(1 downto 0) => rxclkcorcnt_out(1 downto 0),
      rxcominitdet_out(0) => rxcominitdet_out(0),
      rxcommadet_out(0) => rxcommadet_out(0),
      rxcommadeten_in(0) => rxcommadeten_in(0),
      rxcomsasdet_out(0) => rxcomsasdet_out(0),
      rxcomwakedet_out(0) => rxcomwakedet_out(0),
      rxctrl0_out(15 downto 0) => rxctrl0_out(15 downto 0),
      rxctrl1_out(15 downto 0) => rxctrl1_out(15 downto 0),
      rxctrl2_out(7 downto 0) => rxctrl2_out(7 downto 0),
      rxctrl3_out(7 downto 0) => rxctrl3_out(7 downto 0),
      rxdata_out(127 downto 0) => rxdata_out(127 downto 0),
      rxdataextendrsvd_out(7 downto 0) => rxdataextendrsvd_out(7 downto 0),
      rxdatavalid_out(1 downto 0) => rxdatavalid_out(1 downto 0),
      rxdfeagcctrl_in(1 downto 0) => rxdfeagcctrl_in(1 downto 0),
      rxdfeagchold_in(0) => rxdfeagchold_in(0),
      rxdfeagcovrden_in(0) => rxdfeagcovrden_in(0),
      rxdfelfhold_in(0) => rxdfelfhold_in(0),
      rxdfelfovrden_in(0) => rxdfelfovrden_in(0),
      rxdfelpmreset_in(0) => rxdfelpmreset_in(0),
      rxdfetap10hold_in(0) => rxdfetap10hold_in(0),
      rxdfetap10ovrden_in(0) => rxdfetap10ovrden_in(0),
      rxdfetap11hold_in(0) => rxdfetap11hold_in(0),
      rxdfetap11ovrden_in(0) => rxdfetap11ovrden_in(0),
      rxdfetap12hold_in(0) => rxdfetap12hold_in(0),
      rxdfetap12ovrden_in(0) => rxdfetap12ovrden_in(0),
      rxdfetap13hold_in(0) => rxdfetap13hold_in(0),
      rxdfetap13ovrden_in(0) => rxdfetap13ovrden_in(0),
      rxdfetap14hold_in(0) => rxdfetap14hold_in(0),
      rxdfetap14ovrden_in(0) => rxdfetap14ovrden_in(0),
      rxdfetap15hold_in(0) => rxdfetap15hold_in(0),
      rxdfetap15ovrden_in(0) => rxdfetap15ovrden_in(0),
      rxdfetap2hold_in(0) => rxdfetap2hold_in(0),
      rxdfetap2ovrden_in(0) => rxdfetap2ovrden_in(0),
      rxdfetap3hold_in(0) => rxdfetap3hold_in(0),
      rxdfetap3ovrden_in(0) => rxdfetap3ovrden_in(0),
      rxdfetap4hold_in(0) => rxdfetap4hold_in(0),
      rxdfetap4ovrden_in(0) => rxdfetap4ovrden_in(0),
      rxdfetap5hold_in(0) => rxdfetap5hold_in(0),
      rxdfetap5ovrden_in(0) => rxdfetap5ovrden_in(0),
      rxdfetap6hold_in(0) => rxdfetap6hold_in(0),
      rxdfetap6ovrden_in(0) => rxdfetap6ovrden_in(0),
      rxdfetap7hold_in(0) => rxdfetap7hold_in(0),
      rxdfetap7ovrden_in(0) => rxdfetap7ovrden_in(0),
      rxdfetap8hold_in(0) => rxdfetap8hold_in(0),
      rxdfetap8ovrden_in(0) => rxdfetap8ovrden_in(0),
      rxdfetap9hold_in(0) => rxdfetap9hold_in(0),
      rxdfetap9ovrden_in(0) => rxdfetap9ovrden_in(0),
      rxdfeuthold_in(0) => rxdfeuthold_in(0),
      rxdfeutovrden_in(0) => rxdfeutovrden_in(0),
      rxdfevphold_in(0) => rxdfevphold_in(0),
      rxdfevpovrden_in(0) => rxdfevpovrden_in(0),
      rxdfevsen_in(0) => rxdfevsen_in(0),
      rxdfexyden_in(0) => rxdfexyden_in(0),
      rxdlybypass_in(0) => rxdlybypass_in(0),
      rxdlyen_in(0) => rxdlyen_in(0),
      rxdlyovrden_in(0) => rxdlyovrden_in(0),
      rxdlysreset_in(0) => rxdlysreset_in(0),
      rxdlysresetdone_out(0) => rxdlysresetdone_out(0),
      rxelecidle_out(0) => rxelecidle_out(0),
      rxelecidlemode_in(1 downto 0) => rxelecidlemode_in(1 downto 0),
      rxgearboxslip_in(0) => rxgearboxslip_in(0),
      rxheader_out(5 downto 0) => rxheader_out(5 downto 0),
      rxheadervalid_out(1 downto 0) => rxheadervalid_out(1 downto 0),
      rxlatclk_in(0) => rxlatclk_in(0),
      rxlpmen_in(0) => rxlpmen_in(0),
      rxlpmgchold_in(0) => rxlpmgchold_in(0),
      rxlpmgcovrden_in(0) => rxlpmgcovrden_in(0),
      rxlpmhfhold_in(0) => rxlpmhfhold_in(0),
      rxlpmhfovrden_in(0) => rxlpmhfovrden_in(0),
      rxlpmlfhold_in(0) => rxlpmlfhold_in(0),
      rxlpmlfklovrden_in(0) => rxlpmlfklovrden_in(0),
      rxlpmoshold_in(0) => rxlpmoshold_in(0),
      rxlpmosovrden_in(0) => rxlpmosovrden_in(0),
      rxmcommaalignen_in(0) => rxmcommaalignen_in(0),
      rxmonitorout_out(6 downto 0) => rxmonitorout_out(6 downto 0),
      rxmonitorsel_in(1 downto 0) => rxmonitorsel_in(1 downto 0),
      rxoobreset_in(0) => rxoobreset_in(0),
      rxoscalreset_in(0) => rxoscalreset_in(0),
      rxoshold_in(0) => rxoshold_in(0),
      rxosintcfg_in(3 downto 0) => rxosintcfg_in(3 downto 0),
      rxosintdone_out(0) => rxosintdone_out(0),
      rxosinten_in(0) => rxosinten_in(0),
      rxosinthold_in(0) => rxosinthold_in(0),
      rxosintovrden_in(0) => rxosintovrden_in(0),
      rxosintstarted_out(0) => rxosintstarted_out(0),
      rxosintstrobe_in(0) => rxosintstrobe_in(0),
      rxosintstrobedone_out(0) => rxosintstrobedone_out(0),
      rxosintstrobestarted_out(0) => rxosintstrobestarted_out(0),
      rxosinttestovrden_in(0) => rxosinttestovrden_in(0),
      rxosovrden_in(0) => rxosovrden_in(0),
      rxoutclk_out(0) => rxoutclk_out(0),
      rxoutclkfabric_out(0) => rxoutclkfabric_out(0),
      rxoutclkpcs_out(0) => rxoutclkpcs_out(0),
      rxoutclksel_in(2 downto 0) => rxoutclksel_in(2 downto 0),
      rxpcommaalignen_in(0) => rxpcommaalignen_in(0),
      rxpcsreset_in(0) => rxpcsreset_in(0),
      rxpd_in(1 downto 0) => rxpd_in(1 downto 0),
      rxphalign_in(0) => rxphalign_in(0),
      rxphaligndone_out(0) => rxphaligndone_out(0),
      rxphalignen_in(0) => rxphalignen_in(0),
      rxphalignerr_out(0) => rxphalignerr_out(0),
      rxphdlypd_in(0) => rxphdlypd_in(0),
      rxphdlyreset_in(0) => rxphdlyreset_in(0),
      rxphovrden_in(0) => rxphovrden_in(0),
      rxpllclksel_in(1 downto 0) => rxpllclksel_in(1 downto 0),
      rxpmareset_in(0) => rxpmareset_in(0),
      rxpmaresetdone_out(0) => rxpmaresetdone_out(0),
      rxpolarity_in(0) => rxpolarity_in(0),
      rxprbscntreset_in(0) => rxprbscntreset_in(0),
      rxprbserr_out(0) => rxprbserr_out(0),
      rxprbslocked_out(0) => rxprbslocked_out(0),
      rxprbssel_in(3 downto 0) => rxprbssel_in(3 downto 0),
      rxprgdivresetdone_out(0) => rxprgdivresetdone_out(0),
      rxqpien_in(0) => rxqpien_in(0),
      rxqpisenn_out(0) => rxqpisenn_out(0),
      rxqpisenp_out(0) => rxqpisenp_out(0),
      rxrate_in(2 downto 0) => rxrate_in(2 downto 0),
      rxratedone_out(0) => rxratedone_out(0),
      rxratemode_in(0) => rxratemode_in(0),
      rxrecclkout_out(0) => rxrecclkout_out(0),
      rxresetdone_out(0) => \^rxresetdone_out\(0),
      rxslide_in(0) => rxslide_in(0),
      rxsliderdy_out(0) => rxsliderdy_out(0),
      rxslipdone_out(0) => rxslipdone_out(0),
      rxslipoutclk_in(0) => rxslipoutclk_in(0),
      rxslipoutclkrdy_out(0) => rxslipoutclkrdy_out(0),
      rxslippma_in(0) => rxslippma_in(0),
      rxslippmardy_out(0) => rxslippmardy_out(0),
      rxstartofseq_out(1 downto 0) => rxstartofseq_out(1 downto 0),
      rxstatus_out(2 downto 0) => rxstatus_out(2 downto 0),
      rxsyncallin_in(0) => rxsyncallin_in(0),
      rxsyncdone_out(0) => rxsyncdone_out(0),
      rxsyncin_in(0) => rxsyncin_in(0),
      rxsyncmode_in(0) => rxsyncmode_in(0),
      rxsyncout_out(0) => rxsyncout_out(0),
      rxsysclksel_in(1 downto 0) => rxsysclksel_in(1 downto 0),
      rxusrclk2_in(0) => rxusrclk2_in(0),
      rxusrclk_in(0) => rxusrclk_in(0),
      rxvalid_out(0) => rxvalid_out(0),
      sigvalidclk_in(0) => sigvalidclk_in(0),
      tx8b10bbypass_in(7 downto 0) => tx8b10bbypass_in(7 downto 0),
      tx8b10ben_in(0) => tx8b10ben_in(0),
      txbufdiffctrl_in(2 downto 0) => txbufdiffctrl_in(2 downto 0),
      txbufstatus_out(1 downto 0) => txbufstatus_out(1 downto 0),
      txcomfinish_out(0) => txcomfinish_out(0),
      txcominit_in(0) => txcominit_in(0),
      txcomsas_in(0) => txcomsas_in(0),
      txcomwake_in(0) => txcomwake_in(0),
      txctrl0_in(15 downto 0) => txctrl0_in(15 downto 0),
      txctrl1_in(15 downto 0) => txctrl1_in(15 downto 0),
      txctrl2_in(7 downto 0) => txctrl2_in(7 downto 0),
      txdataextendrsvd_in(7 downto 0) => txdataextendrsvd_in(7 downto 0),
      txdeemph_in(0) => txdeemph_in(0),
      txdetectrx_in(0) => txdetectrx_in(0),
      txdiffctrl_in(3 downto 0) => txdiffctrl_in(3 downto 0),
      txdiffpd_in(0) => txdiffpd_in(0),
      txdlybypass_in(0) => txdlybypass_in(0),
      txdlyen_in(0) => txdlyen_in(0),
      txdlyhold_in(0) => txdlyhold_in(0),
      txdlyovrden_in(0) => txdlyovrden_in(0),
      txdlysreset_in(0) => txdlysreset_in(0),
      txdlysresetdone_out(0) => txdlysresetdone_out(0),
      txdlyupdown_in(0) => txdlyupdown_in(0),
      txelecidle_in(0) => txelecidle_in(0),
      txheader_in(5 downto 0) => txheader_in(5 downto 0),
      txinhibit_in(0) => txinhibit_in(0),
      txlatclk_in(0) => txlatclk_in(0),
      txmaincursor_in(6 downto 0) => txmaincursor_in(6 downto 0),
      txmargin_in(2 downto 0) => txmargin_in(2 downto 0),
      txoutclk_out(0) => txoutclk_out(0),
      txoutclkfabric_out(0) => txoutclkfabric_out(0),
      txoutclkpcs_out(0) => txoutclkpcs_out(0),
      txoutclksel_in(2 downto 0) => txoutclksel_in(2 downto 0),
      txpcsreset_in(0) => txpcsreset_in(0),
      txpd_in(1 downto 0) => txpd_in(1 downto 0),
      txpdelecidlemode_in(0) => txpdelecidlemode_in(0),
      txphalign_in(0) => txphalign_in(0),
      txphaligndone_out(0) => txphaligndone_out(0),
      txphalignen_in(0) => txphalignen_in(0),
      txphdlypd_in(0) => txphdlypd_in(0),
      txphdlyreset_in(0) => txphdlyreset_in(0),
      txphdlytstclk_in(0) => txphdlytstclk_in(0),
      txphinit_in(0) => txphinit_in(0),
      txphinitdone_out(0) => txphinitdone_out(0),
      txphovrden_in(0) => txphovrden_in(0),
      txpippmen_in(0) => txpippmen_in(0),
      txpippmovrden_in(0) => txpippmovrden_in(0),
      txpippmpd_in(0) => txpippmpd_in(0),
      txpippmsel_in(0) => txpippmsel_in(0),
      txpippmstepsize_in(4 downto 0) => txpippmstepsize_in(4 downto 0),
      txpisopd_in(0) => txpisopd_in(0),
      txpllclksel_in(1 downto 0) => txpllclksel_in(1 downto 0),
      txpmareset_in(0) => txpmareset_in(0),
      txpmaresetdone_out(0) => txpmaresetdone_out(0),
      txpolarity_in(0) => txpolarity_in(0),
      txpostcursor_in(4 downto 0) => txpostcursor_in(4 downto 0),
      txpostcursorinv_in(0) => txpostcursorinv_in(0),
      txprbsforceerr_in(0) => txprbsforceerr_in(0),
      txprbssel_in(3 downto 0) => txprbssel_in(3 downto 0),
      txprecursor_in(4 downto 0) => txprecursor_in(4 downto 0),
      txprecursorinv_in(0) => txprecursorinv_in(0),
      txprgdivresetdone_out(0) => txprgdivresetdone_out(0),
      txqpibiasen_in(0) => txqpibiasen_in(0),
      txqpisenn_out(0) => txqpisenn_out(0),
      txqpisenp_out(0) => txqpisenp_out(0),
      txqpistrongpdown_in(0) => txqpistrongpdown_in(0),
      txqpiweakpup_in(0) => txqpiweakpup_in(0),
      txrate_in(2 downto 0) => txrate_in(2 downto 0),
      txratedone_out(0) => txratedone_out(0),
      txratemode_in(0) => txratemode_in(0),
      txresetdone_out(0) => \^txresetdone_out\(0),
      txsequence_in(6 downto 0) => txsequence_in(6 downto 0),
      txswing_in(0) => txswing_in(0),
      txsyncallin_in(0) => txsyncallin_in(0),
      txsyncdone_out(0) => txsyncdone_out(0),
      txsyncin_in(0) => txsyncin_in(0),
      txsyncmode_in(0) => txsyncmode_in(0),
      txsyncout_out(0) => txsyncout_out(0),
      txsysclksel_in(1 downto 0) => txsysclksel_in(1 downto 0),
      txusrclk2_in(0) => txusrclk2_in(0),
      txusrclk_in(0) => txusrclk_in(0)
    );
\gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gen_ch_xrd[0].bit_synchronizer_rxresetdone_inst\: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer
     port map (
      \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\ => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      rxresetdone_out(0) => \^rxresetdone_out\(0)
    );
\gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gen_ch_xrd[0].bit_synchronizer_txresetdone_inst\: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_bit_synchronizer_2
     port map (
      \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\ => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\,
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      txresetdone_out(0) => \^txresetdone_out\(0)
    );
\gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.gtwiz_reset_inst\: entity work.dnpcie_aurora_2_sim_gtwizard_ultrascale_v1_7_4_gtwiz_reset
     port map (
      cplllock_out(0) => \^cplllock_out\(0),
      \gen_gtwizard_gthe3.cpllpd_ch_int\ => \gen_gtwizard_gthe3.cpllpd_ch_int\,
      \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\ => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.rxresetdone_sync\,
      \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\ => \gen_gtwizard_gthe3.gen_reset_controller_internal.gen_single_instance.txresetdone_sync\,
      \gen_gtwizard_gthe3.gtrxreset_int\ => \gen_gtwizard_gthe3.gtrxreset_int\,
      \gen_gtwizard_gthe3.gttxreset_int\ => \gen_gtwizard_gthe3.gttxreset_int\,
      \gen_gtwizard_gthe3.rxprogdivreset_int\ => \gen_gtwizard_gthe3.rxprogdivreset_int\,
      \gen_gtwizard_gthe3.rxuserrdy_int\ => \gen_gtwizard_gthe3.rxuserrdy_int\,
      \gen_gtwizard_gthe3.txprogdivreset_int\ => \gen_gtwizard_gthe3.txprogdivreset_int\,
      \gen_gtwizard_gthe3.txuserrdy_int\ => \gen_gtwizard_gthe3.txuserrdy_int\,
      gtpowergood_out(0) => \^gtpowergood_out\(0),
      gtwiz_reset_all_in(0) => gtwiz_reset_all_in(0),
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_rx_cdr_stable_out(0) => gtwiz_reset_rx_cdr_stable_out(0),
      gtwiz_reset_rx_datapath_in(0) => gtwiz_reset_rx_datapath_in(0),
      gtwiz_reset_rx_done_out(0) => gtwiz_reset_rx_done_out(0),
      gtwiz_reset_rx_pll_and_datapath_in(0) => gtwiz_reset_rx_pll_and_datapath_in(0),
      gtwiz_reset_tx_datapath_in(0) => gtwiz_reset_tx_datapath_in(0),
      gtwiz_reset_tx_done_out(0) => gtwiz_reset_tx_done_out(0),
      gtwiz_reset_tx_pll_and_datapath_in(0) => gtwiz_reset_tx_pll_and_datapath_in(0),
      gtwiz_userclk_rx_active_in(0) => gtwiz_userclk_rx_active_in(0),
      gtwiz_userclk_tx_active_in(0) => gtwiz_userclk_tx_active_in(0),
      rst_in0 => rst_in0,
      rxcdrlock_out(0) => \^rxcdrlock_out\(0),
      rxusrclk2_in(0) => rxusrclk2_in(0),
      txusrclk2_in(0) => txusrclk2_in(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top is
  port (
    gtwiz_userclk_tx_reset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_tx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_tx_srcclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_tx_usrclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_tx_usrclk2_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_tx_active_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_reset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_srcclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_usrclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_usrclk2_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_active_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_buffbypass_tx_reset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_buffbypass_tx_start_user_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_buffbypass_tx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_buffbypass_tx_error_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_buffbypass_rx_reset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_buffbypass_rx_start_user_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_buffbypass_rx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_buffbypass_rx_error_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_all_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_done_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_done_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_qpll0lock_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_qpll1lock_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_cdr_stable_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_qpll0reset_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_qpll1reset_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_gthe3_cpll_cal_txoutclk_period_in : in STD_LOGIC_VECTOR ( 17 downto 0 );
    gtwiz_gthe3_cpll_cal_cnt_tol_in : in STD_LOGIC_VECTOR ( 17 downto 0 );
    gtwiz_gthe3_cpll_cal_bufg_ce_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_gthe4_cpll_cal_txoutclk_period_in : in STD_LOGIC_VECTOR ( 17 downto 0 );
    gtwiz_gthe4_cpll_cal_cnt_tol_in : in STD_LOGIC_VECTOR ( 17 downto 0 );
    gtwiz_gthe4_cpll_cal_bufg_ce_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_gtye4_cpll_cal_txoutclk_period_in : in STD_LOGIC_VECTOR ( 17 downto 0 );
    gtwiz_gtye4_cpll_cal_cnt_tol_in : in STD_LOGIC_VECTOR ( 17 downto 0 );
    gtwiz_gtye4_cpll_cal_bufg_ce_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userdata_tx_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gtwiz_userdata_rx_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bgbypassb_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    bgmonitorenb_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    bgpdb_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    bgrcalovrd_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    bgrcalovrdenb_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpaddr_common_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    drpclk_common_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpdi_common_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drpen_common_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpwe_common_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtgrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtgrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk00_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk01_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk10_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk11_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk00_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk01_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk10_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk11_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk00_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk01_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk10_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk11_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcierateqpll0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcierateqpll1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pmarsvd0_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pmarsvd1_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    qpll0clkrsvd0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0clkrsvd1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0fbdiv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0lockdetclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0locken_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0pd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0refclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    qpll0reset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1clkrsvd0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1clkrsvd1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1fbdiv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1lockdetclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1locken_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1pd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1refclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    qpll1reset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpllrsvd1_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    qpllrsvd2_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    qpllrsvd3_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    qpllrsvd4_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rcalenb_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sdm0data_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sdm0reset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sdm0toggle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sdm0width_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sdm1data_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sdm1reset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sdm1toggle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sdm1width_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    tcongpi_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    tconpowerup_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    tconreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    tconrsvdin1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubcfgstreamen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubdo_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubdrdy_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubenable_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubgpi_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubintr_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubiolmbrst_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubmbrst_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubmdmcapture_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubmdmdbgrst_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubmdmdbgupdate_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubmdmregen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubmdmshift_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubmdmsysrst_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubmdmtck_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    ubmdmtdi_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpdo_common_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drprdy_common_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pmarsvdout0_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    pmarsvdout1_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qpll0fbclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0lock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0outclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0outrefclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0refclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1fbclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1lock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1outclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1outrefclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1refclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    qplldmonitor0_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    qplldmonitor1_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    refclkoutmonitor0_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    refclkoutmonitor1_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxrecclk0_sel_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxrecclk1_sel_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxrecclk0sel_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxrecclk1sel_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    sdm0finalout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    sdm0testdata_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    sdm1finalout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    sdm1testdata_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    tcongpo_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    tconrsvdout0_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    ubdaddr_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    ubden_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    ubdi_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    ubdwe_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    ubmdmtdo_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    ubrsvdout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    ubtxuart_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    cdrstepdir_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cdrstepsq_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cdrstepsx_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cfgreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    clkrsvd0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    clkrsvd1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cpllfreqlock_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cplllockdetclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cplllocken_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cpllpd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cpllrefclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    cpllreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    dmonfiforeset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    dmonitorclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    drpclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drpen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drprst_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpwe_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    elpcaldvorwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    elpcalpaorwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphicaldone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphicalstart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphidrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphidwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphixrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    evoddphixwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescanmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescanreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    eyescantrigger_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    freqos_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtgrefclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxn_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxp_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtnorthrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtresetsel_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrsvd_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gtrxreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrxresetsel_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtsouthrefclk1_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gttxreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gttxresetsel_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    incpctrl_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtyrxn_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtyrxp_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    looprsvd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    lpbkrxtxseren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    lpbktxrxseren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcieeqrxeqadaptdone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcierstidle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pciersttxsyncstart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserratedone_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    pcsrsvdin_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    pcsrsvdin2_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    pmarsvdin_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    qpll0clk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0freqlock_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll0refclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1clk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1freqlock_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    qpll1refclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    resetovrd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rstclkentx_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rx8b10ben_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxafecfoken_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxbufreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrfreqreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrresetrsv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbonden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbondi_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    rxchbondlevel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxchbondmaster_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbondslave_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxckcalreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxckcalstart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcommadeten_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeagcctrl_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxdccforcestart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeagchold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeagcovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfecfokfcnum_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfecfokfen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfecfokfpulse_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfecfokhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfecfokovren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfekhhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfekhovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelfovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfelpmreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap10hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap10ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap11hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap11ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap12hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap12ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap13hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap13ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap14hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap14ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap15hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap15ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap2hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap2ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap3hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap3ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap4hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap4ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap5hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap5ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap6hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap6ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap7hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap7ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap8hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap8ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap9hold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfetap9ovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeuthold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfeutovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevphold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevpovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfevsen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdfexyden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlybypass_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlyen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlyovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxdlysreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxelecidlemode_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxeqtraining_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxgearboxslip_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlatclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmgchold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmgcovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmhfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmhfovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmlfhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmlfklovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmoshold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxlpmosovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxmcommaalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxoobreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoscalreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoshold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintcfg_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxosinten_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinthold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobe_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosinttestovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxosovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxpcommaalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpcsreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxphalign_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphdlypd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphdlyreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxphovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpllclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxpmareset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpolarity_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbscntreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbssel_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rxprogdivreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxqpien_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rxratemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslide_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipoutclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxslippma_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncallin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxsysclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxtermination_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxuserrdy_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sigvalidclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    tstin_in : in STD_LOGIC_VECTOR ( 19 downto 0 );
    tx8b10bbypass_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx8b10ben_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txbufdiffctrl_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txcominit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcomsas_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txcomwake_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txctrl0_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txctrl1_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txctrl2_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txdata_in : in STD_LOGIC_VECTOR ( 127 downto 0 );
    txdataextendrsvd_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txdccforcestart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdccreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdeemph_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdetectrx_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    txdiffpd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlybypass_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlysreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txdlyupdown_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txelecidle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txelforcestart_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txheader_in : in STD_LOGIC_VECTOR ( 5 downto 0 );
    txinhibit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txlatclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txlfpstreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txlfpsu2lpexit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txlfpsu3wake_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txmaincursor_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    txmargin_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txmuxdcdexhold_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txmuxdcdorwren_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txoneszeros_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclksel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txpcsreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txpdelecidlemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphalign_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlypd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlyreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphdlytstclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphinit_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txphovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmovrden_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmpd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmsel_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpippmstepsize_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txpisopd_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpllclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txpmareset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpolarity_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txpostcursorinv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txprbsforceerr_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txprbssel_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    txprecursorinv_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txprogdivreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txqpibiasen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txqpistrongpdown_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txqpiweakpup_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txrate_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    txratemode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsequence_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    txswing_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncallin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncin_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncmode_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txsysclksel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txuserrdy_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    bufgtce_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtcemask_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtdiv_out : out STD_LOGIC_VECTOR ( 8 downto 0 );
    bufgtreset_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    bufgtrstmask_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    cpllfbclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    cplllock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    cpllrefclklost_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    dmonitorout_out : out STD_LOGIC_VECTOR ( 16 downto 0 );
    dmonitoroutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drprdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    eyescandataerror_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtpowergood_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclkmonitor_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtytxn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtytxp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcierategen3_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcierateidle_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcierateqpllpd_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    pcierateqpllreset_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    pciesynctxsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieusergen3rdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserphystatusrst_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcieuserratestart_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pcsrsvdout_out : out STD_LOGIC_VECTOR ( 11 downto 0 );
    phystatus_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    pinrsrvdas_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    powerpresent_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    resetexception_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxbyteisaligned_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbyterealign_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrlock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcdrphdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanbondseq_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanisaligned_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchanrealign_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxchbondo_out : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rxckcaldone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxclkcorcnt_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxcominitdet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcommadet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcomsasdet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxcomwakedet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxctrl0_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rxctrl1_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rxctrl2_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxctrl3_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxdata_out : out STD_LOGIC_VECTOR ( 127 downto 0 );
    rxdataextendrsvd_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxdatavalid_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxdlysresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxelecidle_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxheader_out : out STD_LOGIC_VECTOR ( 5 downto 0 );
    rxheadervalid_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxlfpstresetdet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxlfpsu2lpexitdet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxlfpsu3wakedet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    rxosintdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstarted_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxosintstrobestarted_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclkfabric_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxoutclkpcs_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxphaligndone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxphalignerr_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbserr_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprbslocked_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxprgdivresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxqpisenn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxqpisenp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxratedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxrecclkout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsliderdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslipoutclkrdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxslippmardy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxstartofseq_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxsyncout_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxvalid_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    txcomfinish_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txdccdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txdlysresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclkfabric_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txoutclkpcs_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txphaligndone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txphinitdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txprgdivresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txqpisenn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txqpisenp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txratedone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txsyncout_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute C_CHANNEL_ENABLE : string;
  attribute C_CHANNEL_ENABLE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "192'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
  attribute C_COMMON_SCALING_FACTOR : integer;
  attribute C_COMMON_SCALING_FACTOR of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_CPLL_VCO_FREQUENCY : string;
  attribute C_CPLL_VCO_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "3200.000000";
  attribute C_ENABLE_COMMON_USRCLK : integer;
  attribute C_ENABLE_COMMON_USRCLK of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_FORCE_COMMONS : integer;
  attribute C_FORCE_COMMONS of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_FREERUN_FREQUENCY : string;
  attribute C_FREERUN_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "160.000000";
  attribute C_GT_REV : integer;
  attribute C_GT_REV of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 17;
  attribute C_GT_TYPE : integer;
  attribute C_GT_TYPE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_INCLUDE_CPLL_CAL : integer;
  attribute C_INCLUDE_CPLL_CAL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 2;
  attribute C_LOCATE_COMMON : integer;
  attribute C_LOCATE_COMMON of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_LOCATE_IN_SYSTEM_IBERT_CORE : integer;
  attribute C_LOCATE_IN_SYSTEM_IBERT_CORE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 2;
  attribute C_LOCATE_RESET_CONTROLLER : integer;
  attribute C_LOCATE_RESET_CONTROLLER of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_LOCATE_RX_BUFFER_BYPASS_CONTROLLER : integer;
  attribute C_LOCATE_RX_BUFFER_BYPASS_CONTROLLER of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_LOCATE_RX_USER_CLOCKING : integer;
  attribute C_LOCATE_RX_USER_CLOCKING of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_LOCATE_TX_BUFFER_BYPASS_CONTROLLER : integer;
  attribute C_LOCATE_TX_BUFFER_BYPASS_CONTROLLER of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_LOCATE_TX_USER_CLOCKING : integer;
  attribute C_LOCATE_TX_USER_CLOCKING of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_LOCATE_USER_DATA_WIDTH_SIZING : integer;
  attribute C_LOCATE_USER_DATA_WIDTH_SIZING of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_PCIE_CORECLK_FREQ : integer;
  attribute C_PCIE_CORECLK_FREQ of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 250;
  attribute C_PCIE_ENABLE : integer;
  attribute C_PCIE_ENABLE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RESET_CONTROLLER_INSTANCE_CTRL : integer;
  attribute C_RESET_CONTROLLER_INSTANCE_CTRL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RESET_SEQUENCE_INTERVAL : integer;
  attribute C_RESET_SEQUENCE_INTERVAL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RX_BUFFBYPASS_MODE : integer;
  attribute C_RX_BUFFBYPASS_MODE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RX_BUFFER_BYPASS_INSTANCE_CTRL : integer;
  attribute C_RX_BUFFER_BYPASS_INSTANCE_CTRL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RX_BUFFER_MODE : integer;
  attribute C_RX_BUFFER_MODE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_CB_DISP : string;
  attribute C_RX_CB_DISP of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "8'b00000000";
  attribute C_RX_CB_K : string;
  attribute C_RX_CB_K of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "8'b00000000";
  attribute C_RX_CB_LEN_SEQ : integer;
  attribute C_RX_CB_LEN_SEQ of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_CB_MAX_LEVEL : integer;
  attribute C_RX_CB_MAX_LEVEL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_CB_NUM_SEQ : integer;
  attribute C_RX_CB_NUM_SEQ of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RX_CB_VAL : string;
  attribute C_RX_CB_VAL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "80'b00000000000000000000000000000000000000000000000000000000000000000000000000000000";
  attribute C_RX_CC_DISP : string;
  attribute C_RX_CC_DISP of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "8'b00000000";
  attribute C_RX_CC_ENABLE : integer;
  attribute C_RX_CC_ENABLE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_CC_K : string;
  attribute C_RX_CC_K of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "8'b00001111";
  attribute C_RX_CC_LEN_SEQ : integer;
  attribute C_RX_CC_LEN_SEQ of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 4;
  attribute C_RX_CC_NUM_SEQ : integer;
  attribute C_RX_CC_NUM_SEQ of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_CC_PERIODICITY : integer;
  attribute C_RX_CC_PERIODICITY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 2500;
  attribute C_RX_CC_VAL : string;
  attribute C_RX_CC_VAL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "80'b00000000000000000000000000000000000000000011110111001111011100111101110011110111";
  attribute C_RX_COMMA_M_ENABLE : integer;
  attribute C_RX_COMMA_M_ENABLE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_COMMA_M_VAL : string;
  attribute C_RX_COMMA_M_VAL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "10'b1010000011";
  attribute C_RX_COMMA_P_ENABLE : integer;
  attribute C_RX_COMMA_P_ENABLE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_COMMA_P_VAL : string;
  attribute C_RX_COMMA_P_VAL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "10'b0101111100";
  attribute C_RX_DATA_DECODING : integer;
  attribute C_RX_DATA_DECODING of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_ENABLE : integer;
  attribute C_RX_ENABLE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_INT_DATA_WIDTH : integer;
  attribute C_RX_INT_DATA_WIDTH of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 40;
  attribute C_RX_LINE_RATE : string;
  attribute C_RX_LINE_RATE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "6.400000";
  attribute C_RX_MASTER_CHANNEL_IDX : integer;
  attribute C_RX_MASTER_CHANNEL_IDX of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RX_OUTCLK_BUFG_GT_DIV : integer;
  attribute C_RX_OUTCLK_BUFG_GT_DIV of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_OUTCLK_FREQUENCY : string;
  attribute C_RX_OUTCLK_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "160.000000";
  attribute C_RX_OUTCLK_SOURCE : integer;
  attribute C_RX_OUTCLK_SOURCE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_PLL_TYPE : integer;
  attribute C_RX_PLL_TYPE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 2;
  attribute C_RX_RECCLK_OUTPUT : string;
  attribute C_RX_RECCLK_OUTPUT of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "192'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  attribute C_RX_REFCLK_FREQUENCY : string;
  attribute C_RX_REFCLK_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "200.000000";
  attribute C_RX_SLIDE_MODE : integer;
  attribute C_RX_SLIDE_MODE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RX_USER_CLOCKING_CONTENTS : integer;
  attribute C_RX_USER_CLOCKING_CONTENTS of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RX_USER_CLOCKING_INSTANCE_CTRL : integer;
  attribute C_RX_USER_CLOCKING_INSTANCE_CTRL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RX_USER_CLOCKING_RATIO_FSRC_FUSRCLK : integer;
  attribute C_RX_USER_CLOCKING_RATIO_FSRC_FUSRCLK of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2 : integer;
  attribute C_RX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2 of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_RX_USER_CLOCKING_SOURCE : integer;
  attribute C_RX_USER_CLOCKING_SOURCE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_RX_USER_DATA_WIDTH : integer;
  attribute C_RX_USER_DATA_WIDTH of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 32;
  attribute C_RX_USRCLK2_FREQUENCY : string;
  attribute C_RX_USRCLK2_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "160.000000";
  attribute C_RX_USRCLK_FREQUENCY : string;
  attribute C_RX_USRCLK_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "160.000000";
  attribute C_SECONDARY_QPLL_ENABLE : integer;
  attribute C_SECONDARY_QPLL_ENABLE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_SECONDARY_QPLL_REFCLK_FREQUENCY : string;
  attribute C_SECONDARY_QPLL_REFCLK_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "257.812500";
  attribute C_SIM_CPLL_CAL_BYPASS : integer;
  attribute C_SIM_CPLL_CAL_BYPASS of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_TOTAL_NUM_CHANNELS : integer;
  attribute C_TOTAL_NUM_CHANNELS of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_TOTAL_NUM_COMMONS : integer;
  attribute C_TOTAL_NUM_COMMONS of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_TOTAL_NUM_COMMONS_EXAMPLE : integer;
  attribute C_TOTAL_NUM_COMMONS_EXAMPLE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_TXPROGDIV_FREQ_ENABLE : integer;
  attribute C_TXPROGDIV_FREQ_ENABLE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_TXPROGDIV_FREQ_SOURCE : integer;
  attribute C_TXPROGDIV_FREQ_SOURCE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 2;
  attribute C_TXPROGDIV_FREQ_VAL : string;
  attribute C_TXPROGDIV_FREQ_VAL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "160.000000";
  attribute C_TX_BUFFBYPASS_MODE : integer;
  attribute C_TX_BUFFBYPASS_MODE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_TX_BUFFER_BYPASS_INSTANCE_CTRL : integer;
  attribute C_TX_BUFFER_BYPASS_INSTANCE_CTRL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_TX_BUFFER_MODE : integer;
  attribute C_TX_BUFFER_MODE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_TX_DATA_ENCODING : integer;
  attribute C_TX_DATA_ENCODING of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_TX_ENABLE : integer;
  attribute C_TX_ENABLE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_TX_INT_DATA_WIDTH : integer;
  attribute C_TX_INT_DATA_WIDTH of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 40;
  attribute C_TX_LINE_RATE : string;
  attribute C_TX_LINE_RATE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "6.400000";
  attribute C_TX_MASTER_CHANNEL_IDX : integer;
  attribute C_TX_MASTER_CHANNEL_IDX of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_TX_OUTCLK_BUFG_GT_DIV : integer;
  attribute C_TX_OUTCLK_BUFG_GT_DIV of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_TX_OUTCLK_FREQUENCY : string;
  attribute C_TX_OUTCLK_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "160.000000";
  attribute C_TX_OUTCLK_SOURCE : integer;
  attribute C_TX_OUTCLK_SOURCE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_TX_PLL_TYPE : integer;
  attribute C_TX_PLL_TYPE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 2;
  attribute C_TX_REFCLK_FREQUENCY : string;
  attribute C_TX_REFCLK_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "200.000000";
  attribute C_TX_USER_CLOCKING_CONTENTS : integer;
  attribute C_TX_USER_CLOCKING_CONTENTS of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_TX_USER_CLOCKING_INSTANCE_CTRL : integer;
  attribute C_TX_USER_CLOCKING_INSTANCE_CTRL of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_TX_USER_CLOCKING_RATIO_FSRC_FUSRCLK : integer;
  attribute C_TX_USER_CLOCKING_RATIO_FSRC_FUSRCLK of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_TX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2 : integer;
  attribute C_TX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2 of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 1;
  attribute C_TX_USER_CLOCKING_SOURCE : integer;
  attribute C_TX_USER_CLOCKING_SOURCE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute C_TX_USER_DATA_WIDTH : integer;
  attribute C_TX_USER_DATA_WIDTH of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 32;
  attribute C_TX_USRCLK2_FREQUENCY : string;
  attribute C_TX_USRCLK2_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "160.000000";
  attribute C_TX_USRCLK_FREQUENCY : string;
  attribute C_TX_USRCLK_FREQUENCY of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "160.000000";
  attribute C_USER_GTPOWERGOOD_DELAY_EN : integer;
  attribute C_USER_GTPOWERGOOD_DELAY_EN of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top : entity is "dnpcie_aurora_2_sim_gt_gtwizard_top";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top is
  signal \<const0>\ : STD_LOGIC;
  signal \^gtwiz_reset_qpll0lock_in\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^gtwiz_reset_qpll1lock_in\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^gtwiz_userclk_rx_active_in\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^gtwiz_userclk_tx_active_in\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^qpll0reset_in\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^qpll1reset_in\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^rxdata_out\ : STD_LOGIC_VECTOR ( 127 downto 0 );
begin
  \^gtwiz_reset_qpll0lock_in\(0) <= gtwiz_reset_qpll0lock_in(0);
  \^gtwiz_reset_qpll1lock_in\(0) <= gtwiz_reset_qpll1lock_in(0);
  \^gtwiz_userclk_rx_active_in\(0) <= gtwiz_userclk_rx_active_in(0);
  \^gtwiz_userclk_tx_active_in\(0) <= gtwiz_userclk_tx_active_in(0);
  \^qpll0reset_in\(0) <= qpll0reset_in(0);
  \^qpll1reset_in\(0) <= qpll1reset_in(0);
  dmonitoroutclk_out(0) <= \<const0>\;
  drpdo_common_out(15) <= \<const0>\;
  drpdo_common_out(14) <= \<const0>\;
  drpdo_common_out(13) <= \<const0>\;
  drpdo_common_out(12) <= \<const0>\;
  drpdo_common_out(11) <= \<const0>\;
  drpdo_common_out(10) <= \<const0>\;
  drpdo_common_out(9) <= \<const0>\;
  drpdo_common_out(8) <= \<const0>\;
  drpdo_common_out(7) <= \<const0>\;
  drpdo_common_out(6) <= \<const0>\;
  drpdo_common_out(5) <= \<const0>\;
  drpdo_common_out(4) <= \<const0>\;
  drpdo_common_out(3) <= \<const0>\;
  drpdo_common_out(2) <= \<const0>\;
  drpdo_common_out(1) <= \<const0>\;
  drpdo_common_out(0) <= \<const0>\;
  drprdy_common_out(0) <= \<const0>\;
  gtwiz_buffbypass_rx_done_out(0) <= \<const0>\;
  gtwiz_buffbypass_rx_error_out(0) <= \<const0>\;
  gtwiz_buffbypass_tx_done_out(0) <= \<const0>\;
  gtwiz_buffbypass_tx_error_out(0) <= \<const0>\;
  gtwiz_reset_qpll0reset_out(0) <= \^qpll0reset_in\(0);
  gtwiz_reset_qpll1reset_out(0) <= \^qpll1reset_in\(0);
  gtwiz_userclk_rx_active_out(0) <= \^gtwiz_userclk_rx_active_in\(0);
  gtwiz_userclk_rx_srcclk_out(0) <= \<const0>\;
  gtwiz_userclk_rx_usrclk2_out(0) <= \<const0>\;
  gtwiz_userclk_rx_usrclk_out(0) <= \<const0>\;
  gtwiz_userclk_tx_active_out(0) <= \^gtwiz_userclk_tx_active_in\(0);
  gtwiz_userclk_tx_srcclk_out(0) <= \<const0>\;
  gtwiz_userclk_tx_usrclk2_out(0) <= \<const0>\;
  gtwiz_userclk_tx_usrclk_out(0) <= \<const0>\;
  gtwiz_userdata_rx_out(31 downto 0) <= \^rxdata_out\(31 downto 0);
  gtytxn_out(0) <= \<const0>\;
  gtytxp_out(0) <= \<const0>\;
  pmarsvdout0_out(7) <= \<const0>\;
  pmarsvdout0_out(6) <= \<const0>\;
  pmarsvdout0_out(5) <= \<const0>\;
  pmarsvdout0_out(4) <= \<const0>\;
  pmarsvdout0_out(3) <= \<const0>\;
  pmarsvdout0_out(2) <= \<const0>\;
  pmarsvdout0_out(1) <= \<const0>\;
  pmarsvdout0_out(0) <= \<const0>\;
  pmarsvdout1_out(7) <= \<const0>\;
  pmarsvdout1_out(6) <= \<const0>\;
  pmarsvdout1_out(5) <= \<const0>\;
  pmarsvdout1_out(4) <= \<const0>\;
  pmarsvdout1_out(3) <= \<const0>\;
  pmarsvdout1_out(2) <= \<const0>\;
  pmarsvdout1_out(1) <= \<const0>\;
  pmarsvdout1_out(0) <= \<const0>\;
  powerpresent_out(0) <= \<const0>\;
  qpll0fbclklost_out(0) <= \<const0>\;
  qpll0lock_out(0) <= \^gtwiz_reset_qpll0lock_in\(0);
  qpll0outclk_out(0) <= \<const0>\;
  qpll0outrefclk_out(0) <= \<const0>\;
  qpll0refclklost_out(0) <= \<const0>\;
  qpll1fbclklost_out(0) <= \<const0>\;
  qpll1lock_out(0) <= \^gtwiz_reset_qpll1lock_in\(0);
  qpll1outclk_out(0) <= \<const0>\;
  qpll1outrefclk_out(0) <= \<const0>\;
  qpll1refclklost_out(0) <= \<const0>\;
  qplldmonitor0_out(7) <= \<const0>\;
  qplldmonitor0_out(6) <= \<const0>\;
  qplldmonitor0_out(5) <= \<const0>\;
  qplldmonitor0_out(4) <= \<const0>\;
  qplldmonitor0_out(3) <= \<const0>\;
  qplldmonitor0_out(2) <= \<const0>\;
  qplldmonitor0_out(1) <= \<const0>\;
  qplldmonitor0_out(0) <= \<const0>\;
  qplldmonitor1_out(7) <= \<const0>\;
  qplldmonitor1_out(6) <= \<const0>\;
  qplldmonitor1_out(5) <= \<const0>\;
  qplldmonitor1_out(4) <= \<const0>\;
  qplldmonitor1_out(3) <= \<const0>\;
  qplldmonitor1_out(2) <= \<const0>\;
  qplldmonitor1_out(1) <= \<const0>\;
  qplldmonitor1_out(0) <= \<const0>\;
  refclkoutmonitor0_out(0) <= \<const0>\;
  refclkoutmonitor1_out(0) <= \<const0>\;
  rxckcaldone_out(0) <= \<const0>\;
  rxdata_out(127 downto 0) <= \^rxdata_out\(127 downto 0);
  rxlfpstresetdet_out(0) <= \<const0>\;
  rxlfpsu2lpexitdet_out(0) <= \<const0>\;
  rxlfpsu3wakedet_out(0) <= \<const0>\;
  rxrecclk0_sel_out(1) <= \<const0>\;
  rxrecclk0_sel_out(0) <= \<const0>\;
  rxrecclk0sel_out(0) <= \<const0>\;
  rxrecclk1_sel_out(1) <= \<const0>\;
  rxrecclk1_sel_out(0) <= \<const0>\;
  rxrecclk1sel_out(0) <= \<const0>\;
  sdm0finalout_out(0) <= \<const0>\;
  sdm0testdata_out(0) <= \<const0>\;
  sdm1finalout_out(0) <= \<const0>\;
  sdm1testdata_out(0) <= \<const0>\;
  tcongpo_out(0) <= \<const0>\;
  tconrsvdout0_out(0) <= \<const0>\;
  txdccdone_out(0) <= \<const0>\;
  ubdaddr_out(0) <= \<const0>\;
  ubden_out(0) <= \<const0>\;
  ubdi_out(0) <= \<const0>\;
  ubdwe_out(0) <= \<const0>\;
  ubmdmtdo_out(0) <= \<const0>\;
  ubrsvdout_out(0) <= \<const0>\;
  ubtxuart_out(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_gtwizard_gthe3_top.dnpcie_aurora_2_sim_gt_gtwizard_gthe3_inst\: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_gthe3
     port map (
      bufgtce_out(2 downto 0) => bufgtce_out(2 downto 0),
      bufgtcemask_out(2 downto 0) => bufgtcemask_out(2 downto 0),
      bufgtdiv_out(8 downto 0) => bufgtdiv_out(8 downto 0),
      bufgtreset_out(2 downto 0) => bufgtreset_out(2 downto 0),
      bufgtrstmask_out(2 downto 0) => bufgtrstmask_out(2 downto 0),
      cfgreset_in(0) => cfgreset_in(0),
      clkrsvd0_in(0) => clkrsvd0_in(0),
      clkrsvd1_in(0) => clkrsvd1_in(0),
      cpllfbclklost_out(0) => cpllfbclklost_out(0),
      cplllock_out(0) => cplllock_out(0),
      cplllockdetclk_in(0) => cplllockdetclk_in(0),
      cplllocken_in(0) => cplllocken_in(0),
      cpllrefclklost_out(0) => cpllrefclklost_out(0),
      cpllrefclksel_in(2 downto 0) => cpllrefclksel_in(2 downto 0),
      cpllreset_in(0) => cpllreset_in(0),
      dmonfiforeset_in(0) => dmonfiforeset_in(0),
      dmonitorclk_in(0) => dmonitorclk_in(0),
      dmonitorout_out(16 downto 0) => dmonitorout_out(16 downto 0),
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_in(0) => drpclk_in(0),
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_in(0) => drpen_in(0),
      drprdy_out(0) => drprdy_out(0),
      drpwe_in(0) => drpwe_in(0),
      evoddphicaldone_in(0) => evoddphicaldone_in(0),
      evoddphicalstart_in(0) => evoddphicalstart_in(0),
      evoddphidrden_in(0) => evoddphidrden_in(0),
      evoddphidwren_in(0) => evoddphidwren_in(0),
      evoddphixrden_in(0) => evoddphixrden_in(0),
      evoddphixwren_in(0) => evoddphixwren_in(0),
      eyescandataerror_out(0) => eyescandataerror_out(0),
      eyescanmode_in(0) => eyescanmode_in(0),
      eyescanreset_in(0) => eyescanreset_in(0),
      eyescantrigger_in(0) => eyescantrigger_in(0),
      gtgrefclk_in(0) => gtgrefclk_in(0),
      gthrxn_in(0) => gthrxn_in(0),
      gthrxp_in(0) => gthrxp_in(0),
      gthtxn_out(0) => gthtxn_out(0),
      gthtxp_out(0) => gthtxp_out(0),
      gtnorthrefclk0_in(0) => gtnorthrefclk0_in(0),
      gtnorthrefclk1_in(0) => gtnorthrefclk1_in(0),
      gtpowergood_out(0) => gtpowergood_out(0),
      gtrefclk0_in(0) => gtrefclk0_in(0),
      gtrefclk1_in(0) => gtrefclk1_in(0),
      gtrefclkmonitor_out(0) => gtrefclkmonitor_out(0),
      gtresetsel_in(0) => gtresetsel_in(0),
      gtrsvd_in(15 downto 0) => gtrsvd_in(15 downto 0),
      gtsouthrefclk0_in(0) => gtsouthrefclk0_in(0),
      gtsouthrefclk1_in(0) => gtsouthrefclk1_in(0),
      gtwiz_reset_all_in(0) => gtwiz_reset_all_in(0),
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_rx_cdr_stable_out(0) => gtwiz_reset_rx_cdr_stable_out(0),
      gtwiz_reset_rx_datapath_in(0) => gtwiz_reset_rx_datapath_in(0),
      gtwiz_reset_rx_done_out(0) => gtwiz_reset_rx_done_out(0),
      gtwiz_reset_rx_pll_and_datapath_in(0) => gtwiz_reset_rx_pll_and_datapath_in(0),
      gtwiz_reset_tx_datapath_in(0) => gtwiz_reset_tx_datapath_in(0),
      gtwiz_reset_tx_done_out(0) => gtwiz_reset_tx_done_out(0),
      gtwiz_reset_tx_pll_and_datapath_in(0) => gtwiz_reset_tx_pll_and_datapath_in(0),
      gtwiz_userclk_rx_active_in(0) => \^gtwiz_userclk_rx_active_in\(0),
      gtwiz_userclk_tx_active_in(0) => \^gtwiz_userclk_tx_active_in\(0),
      gtwiz_userdata_tx_in(31 downto 0) => gtwiz_userdata_tx_in(31 downto 0),
      loopback_in(2 downto 0) => loopback_in(2 downto 0),
      lpbkrxtxseren_in(0) => lpbkrxtxseren_in(0),
      lpbktxrxseren_in(0) => lpbktxrxseren_in(0),
      pcieeqrxeqadaptdone_in(0) => pcieeqrxeqadaptdone_in(0),
      pcierategen3_out(0) => pcierategen3_out(0),
      pcierateidle_out(0) => pcierateidle_out(0),
      pcierateqpllpd_out(1 downto 0) => pcierateqpllpd_out(1 downto 0),
      pcierateqpllreset_out(1 downto 0) => pcierateqpllreset_out(1 downto 0),
      pcierstidle_in(0) => pcierstidle_in(0),
      pciersttxsyncstart_in(0) => pciersttxsyncstart_in(0),
      pciesynctxsyncdone_out(0) => pciesynctxsyncdone_out(0),
      pcieusergen3rdy_out(0) => pcieusergen3rdy_out(0),
      pcieuserphystatusrst_out(0) => pcieuserphystatusrst_out(0),
      pcieuserratedone_in(0) => pcieuserratedone_in(0),
      pcieuserratestart_out(0) => pcieuserratestart_out(0),
      pcsrsvdin2_in(4 downto 0) => pcsrsvdin2_in(4 downto 0),
      pcsrsvdin_in(15 downto 0) => pcsrsvdin_in(15 downto 0),
      pcsrsvdout_out(11 downto 0) => pcsrsvdout_out(11 downto 0),
      phystatus_out(0) => phystatus_out(0),
      pinrsrvdas_out(7 downto 0) => pinrsrvdas_out(7 downto 0),
      pmarsvdin_in(4 downto 0) => pmarsvdin_in(4 downto 0),
      qpll0clk_in(0) => qpll0clk_in(0),
      qpll0refclk_in(0) => qpll0refclk_in(0),
      qpll1clk_in(0) => qpll1clk_in(0),
      qpll1refclk_in(0) => qpll1refclk_in(0),
      resetexception_out(0) => resetexception_out(0),
      resetovrd_in(0) => resetovrd_in(0),
      rstclkentx_in(0) => rstclkentx_in(0),
      rx8b10ben_in(0) => rx8b10ben_in(0),
      rxbufreset_in(0) => rxbufreset_in(0),
      rxbufstatus_out(2 downto 0) => rxbufstatus_out(2 downto 0),
      rxbyteisaligned_out(0) => rxbyteisaligned_out(0),
      rxbyterealign_out(0) => rxbyterealign_out(0),
      rxcdrfreqreset_in(0) => rxcdrfreqreset_in(0),
      rxcdrhold_in(0) => rxcdrhold_in(0),
      rxcdrlock_out(0) => rxcdrlock_out(0),
      rxcdrovrden_in(0) => rxcdrovrden_in(0),
      rxcdrphdone_out(0) => rxcdrphdone_out(0),
      rxcdrreset_in(0) => rxcdrreset_in(0),
      rxcdrresetrsv_in(0) => rxcdrresetrsv_in(0),
      rxchanbondseq_out(0) => rxchanbondseq_out(0),
      rxchanisaligned_out(0) => rxchanisaligned_out(0),
      rxchanrealign_out(0) => rxchanrealign_out(0),
      rxchbonden_in(0) => rxchbonden_in(0),
      rxchbondi_in(4 downto 0) => rxchbondi_in(4 downto 0),
      rxchbondlevel_in(2 downto 0) => rxchbondlevel_in(2 downto 0),
      rxchbondmaster_in(0) => rxchbondmaster_in(0),
      rxchbondo_out(4 downto 0) => rxchbondo_out(4 downto 0),
      rxchbondslave_in(0) => rxchbondslave_in(0),
      rxclkcorcnt_out(1 downto 0) => rxclkcorcnt_out(1 downto 0),
      rxcominitdet_out(0) => rxcominitdet_out(0),
      rxcommadet_out(0) => rxcommadet_out(0),
      rxcommadeten_in(0) => rxcommadeten_in(0),
      rxcomsasdet_out(0) => rxcomsasdet_out(0),
      rxcomwakedet_out(0) => rxcomwakedet_out(0),
      rxctrl0_out(15 downto 0) => rxctrl0_out(15 downto 0),
      rxctrl1_out(15 downto 0) => rxctrl1_out(15 downto 0),
      rxctrl2_out(7 downto 0) => rxctrl2_out(7 downto 0),
      rxctrl3_out(7 downto 0) => rxctrl3_out(7 downto 0),
      rxdata_out(127 downto 0) => \^rxdata_out\(127 downto 0),
      rxdataextendrsvd_out(7 downto 0) => rxdataextendrsvd_out(7 downto 0),
      rxdatavalid_out(1 downto 0) => rxdatavalid_out(1 downto 0),
      rxdfeagcctrl_in(1 downto 0) => rxdfeagcctrl_in(1 downto 0),
      rxdfeagchold_in(0) => rxdfeagchold_in(0),
      rxdfeagcovrden_in(0) => rxdfeagcovrden_in(0),
      rxdfelfhold_in(0) => rxdfelfhold_in(0),
      rxdfelfovrden_in(0) => rxdfelfovrden_in(0),
      rxdfelpmreset_in(0) => rxdfelpmreset_in(0),
      rxdfetap10hold_in(0) => rxdfetap10hold_in(0),
      rxdfetap10ovrden_in(0) => rxdfetap10ovrden_in(0),
      rxdfetap11hold_in(0) => rxdfetap11hold_in(0),
      rxdfetap11ovrden_in(0) => rxdfetap11ovrden_in(0),
      rxdfetap12hold_in(0) => rxdfetap12hold_in(0),
      rxdfetap12ovrden_in(0) => rxdfetap12ovrden_in(0),
      rxdfetap13hold_in(0) => rxdfetap13hold_in(0),
      rxdfetap13ovrden_in(0) => rxdfetap13ovrden_in(0),
      rxdfetap14hold_in(0) => rxdfetap14hold_in(0),
      rxdfetap14ovrden_in(0) => rxdfetap14ovrden_in(0),
      rxdfetap15hold_in(0) => rxdfetap15hold_in(0),
      rxdfetap15ovrden_in(0) => rxdfetap15ovrden_in(0),
      rxdfetap2hold_in(0) => rxdfetap2hold_in(0),
      rxdfetap2ovrden_in(0) => rxdfetap2ovrden_in(0),
      rxdfetap3hold_in(0) => rxdfetap3hold_in(0),
      rxdfetap3ovrden_in(0) => rxdfetap3ovrden_in(0),
      rxdfetap4hold_in(0) => rxdfetap4hold_in(0),
      rxdfetap4ovrden_in(0) => rxdfetap4ovrden_in(0),
      rxdfetap5hold_in(0) => rxdfetap5hold_in(0),
      rxdfetap5ovrden_in(0) => rxdfetap5ovrden_in(0),
      rxdfetap6hold_in(0) => rxdfetap6hold_in(0),
      rxdfetap6ovrden_in(0) => rxdfetap6ovrden_in(0),
      rxdfetap7hold_in(0) => rxdfetap7hold_in(0),
      rxdfetap7ovrden_in(0) => rxdfetap7ovrden_in(0),
      rxdfetap8hold_in(0) => rxdfetap8hold_in(0),
      rxdfetap8ovrden_in(0) => rxdfetap8ovrden_in(0),
      rxdfetap9hold_in(0) => rxdfetap9hold_in(0),
      rxdfetap9ovrden_in(0) => rxdfetap9ovrden_in(0),
      rxdfeuthold_in(0) => rxdfeuthold_in(0),
      rxdfeutovrden_in(0) => rxdfeutovrden_in(0),
      rxdfevphold_in(0) => rxdfevphold_in(0),
      rxdfevpovrden_in(0) => rxdfevpovrden_in(0),
      rxdfevsen_in(0) => rxdfevsen_in(0),
      rxdfexyden_in(0) => rxdfexyden_in(0),
      rxdlybypass_in(0) => rxdlybypass_in(0),
      rxdlyen_in(0) => rxdlyen_in(0),
      rxdlyovrden_in(0) => rxdlyovrden_in(0),
      rxdlysreset_in(0) => rxdlysreset_in(0),
      rxdlysresetdone_out(0) => rxdlysresetdone_out(0),
      rxelecidle_out(0) => rxelecidle_out(0),
      rxelecidlemode_in(1 downto 0) => rxelecidlemode_in(1 downto 0),
      rxgearboxslip_in(0) => rxgearboxslip_in(0),
      rxheader_out(5 downto 0) => rxheader_out(5 downto 0),
      rxheadervalid_out(1 downto 0) => rxheadervalid_out(1 downto 0),
      rxlatclk_in(0) => rxlatclk_in(0),
      rxlpmen_in(0) => rxlpmen_in(0),
      rxlpmgchold_in(0) => rxlpmgchold_in(0),
      rxlpmgcovrden_in(0) => rxlpmgcovrden_in(0),
      rxlpmhfhold_in(0) => rxlpmhfhold_in(0),
      rxlpmhfovrden_in(0) => rxlpmhfovrden_in(0),
      rxlpmlfhold_in(0) => rxlpmlfhold_in(0),
      rxlpmlfklovrden_in(0) => rxlpmlfklovrden_in(0),
      rxlpmoshold_in(0) => rxlpmoshold_in(0),
      rxlpmosovrden_in(0) => rxlpmosovrden_in(0),
      rxmcommaalignen_in(0) => rxmcommaalignen_in(0),
      rxmonitorout_out(6 downto 0) => rxmonitorout_out(6 downto 0),
      rxmonitorsel_in(1 downto 0) => rxmonitorsel_in(1 downto 0),
      rxoobreset_in(0) => rxoobreset_in(0),
      rxoscalreset_in(0) => rxoscalreset_in(0),
      rxoshold_in(0) => rxoshold_in(0),
      rxosintcfg_in(3 downto 0) => rxosintcfg_in(3 downto 0),
      rxosintdone_out(0) => rxosintdone_out(0),
      rxosinten_in(0) => rxosinten_in(0),
      rxosinthold_in(0) => rxosinthold_in(0),
      rxosintovrden_in(0) => rxosintovrden_in(0),
      rxosintstarted_out(0) => rxosintstarted_out(0),
      rxosintstrobe_in(0) => rxosintstrobe_in(0),
      rxosintstrobedone_out(0) => rxosintstrobedone_out(0),
      rxosintstrobestarted_out(0) => rxosintstrobestarted_out(0),
      rxosinttestovrden_in(0) => rxosinttestovrden_in(0),
      rxosovrden_in(0) => rxosovrden_in(0),
      rxoutclk_out(0) => rxoutclk_out(0),
      rxoutclkfabric_out(0) => rxoutclkfabric_out(0),
      rxoutclkpcs_out(0) => rxoutclkpcs_out(0),
      rxoutclksel_in(2 downto 0) => rxoutclksel_in(2 downto 0),
      rxpcommaalignen_in(0) => rxpcommaalignen_in(0),
      rxpcsreset_in(0) => rxpcsreset_in(0),
      rxpd_in(1 downto 0) => rxpd_in(1 downto 0),
      rxphalign_in(0) => rxphalign_in(0),
      rxphaligndone_out(0) => rxphaligndone_out(0),
      rxphalignen_in(0) => rxphalignen_in(0),
      rxphalignerr_out(0) => rxphalignerr_out(0),
      rxphdlypd_in(0) => rxphdlypd_in(0),
      rxphdlyreset_in(0) => rxphdlyreset_in(0),
      rxphovrden_in(0) => rxphovrden_in(0),
      rxpllclksel_in(1 downto 0) => rxpllclksel_in(1 downto 0),
      rxpmareset_in(0) => rxpmareset_in(0),
      rxpmaresetdone_out(0) => rxpmaresetdone_out(0),
      rxpolarity_in(0) => rxpolarity_in(0),
      rxprbscntreset_in(0) => rxprbscntreset_in(0),
      rxprbserr_out(0) => rxprbserr_out(0),
      rxprbslocked_out(0) => rxprbslocked_out(0),
      rxprbssel_in(3 downto 0) => rxprbssel_in(3 downto 0),
      rxprgdivresetdone_out(0) => rxprgdivresetdone_out(0),
      rxqpien_in(0) => rxqpien_in(0),
      rxqpisenn_out(0) => rxqpisenn_out(0),
      rxqpisenp_out(0) => rxqpisenp_out(0),
      rxrate_in(2 downto 0) => rxrate_in(2 downto 0),
      rxratedone_out(0) => rxratedone_out(0),
      rxratemode_in(0) => rxratemode_in(0),
      rxrecclkout_out(0) => rxrecclkout_out(0),
      rxresetdone_out(0) => rxresetdone_out(0),
      rxslide_in(0) => rxslide_in(0),
      rxsliderdy_out(0) => rxsliderdy_out(0),
      rxslipdone_out(0) => rxslipdone_out(0),
      rxslipoutclk_in(0) => rxslipoutclk_in(0),
      rxslipoutclkrdy_out(0) => rxslipoutclkrdy_out(0),
      rxslippma_in(0) => rxslippma_in(0),
      rxslippmardy_out(0) => rxslippmardy_out(0),
      rxstartofseq_out(1 downto 0) => rxstartofseq_out(1 downto 0),
      rxstatus_out(2 downto 0) => rxstatus_out(2 downto 0),
      rxsyncallin_in(0) => rxsyncallin_in(0),
      rxsyncdone_out(0) => rxsyncdone_out(0),
      rxsyncin_in(0) => rxsyncin_in(0),
      rxsyncmode_in(0) => rxsyncmode_in(0),
      rxsyncout_out(0) => rxsyncout_out(0),
      rxsysclksel_in(1 downto 0) => rxsysclksel_in(1 downto 0),
      rxusrclk2_in(0) => rxusrclk2_in(0),
      rxusrclk_in(0) => rxusrclk_in(0),
      rxvalid_out(0) => rxvalid_out(0),
      sigvalidclk_in(0) => sigvalidclk_in(0),
      tx8b10bbypass_in(7 downto 0) => tx8b10bbypass_in(7 downto 0),
      tx8b10ben_in(0) => tx8b10ben_in(0),
      txbufdiffctrl_in(2 downto 0) => txbufdiffctrl_in(2 downto 0),
      txbufstatus_out(1 downto 0) => txbufstatus_out(1 downto 0),
      txcomfinish_out(0) => txcomfinish_out(0),
      txcominit_in(0) => txcominit_in(0),
      txcomsas_in(0) => txcomsas_in(0),
      txcomwake_in(0) => txcomwake_in(0),
      txctrl0_in(15 downto 0) => txctrl0_in(15 downto 0),
      txctrl1_in(15 downto 0) => txctrl1_in(15 downto 0),
      txctrl2_in(7 downto 0) => txctrl2_in(7 downto 0),
      txdataextendrsvd_in(7 downto 0) => txdataextendrsvd_in(7 downto 0),
      txdeemph_in(0) => txdeemph_in(0),
      txdetectrx_in(0) => txdetectrx_in(0),
      txdiffctrl_in(3 downto 0) => txdiffctrl_in(3 downto 0),
      txdiffpd_in(0) => txdiffpd_in(0),
      txdlybypass_in(0) => txdlybypass_in(0),
      txdlyen_in(0) => txdlyen_in(0),
      txdlyhold_in(0) => txdlyhold_in(0),
      txdlyovrden_in(0) => txdlyovrden_in(0),
      txdlysreset_in(0) => txdlysreset_in(0),
      txdlysresetdone_out(0) => txdlysresetdone_out(0),
      txdlyupdown_in(0) => txdlyupdown_in(0),
      txelecidle_in(0) => txelecidle_in(0),
      txheader_in(5 downto 0) => txheader_in(5 downto 0),
      txinhibit_in(0) => txinhibit_in(0),
      txlatclk_in(0) => txlatclk_in(0),
      txmaincursor_in(6 downto 0) => txmaincursor_in(6 downto 0),
      txmargin_in(2 downto 0) => txmargin_in(2 downto 0),
      txoutclk_out(0) => txoutclk_out(0),
      txoutclkfabric_out(0) => txoutclkfabric_out(0),
      txoutclkpcs_out(0) => txoutclkpcs_out(0),
      txoutclksel_in(2 downto 0) => txoutclksel_in(2 downto 0),
      txpcsreset_in(0) => txpcsreset_in(0),
      txpd_in(1 downto 0) => txpd_in(1 downto 0),
      txpdelecidlemode_in(0) => txpdelecidlemode_in(0),
      txphalign_in(0) => txphalign_in(0),
      txphaligndone_out(0) => txphaligndone_out(0),
      txphalignen_in(0) => txphalignen_in(0),
      txphdlypd_in(0) => txphdlypd_in(0),
      txphdlyreset_in(0) => txphdlyreset_in(0),
      txphdlytstclk_in(0) => txphdlytstclk_in(0),
      txphinit_in(0) => txphinit_in(0),
      txphinitdone_out(0) => txphinitdone_out(0),
      txphovrden_in(0) => txphovrden_in(0),
      txpippmen_in(0) => txpippmen_in(0),
      txpippmovrden_in(0) => txpippmovrden_in(0),
      txpippmpd_in(0) => txpippmpd_in(0),
      txpippmsel_in(0) => txpippmsel_in(0),
      txpippmstepsize_in(4 downto 0) => txpippmstepsize_in(4 downto 0),
      txpisopd_in(0) => txpisopd_in(0),
      txpllclksel_in(1 downto 0) => txpllclksel_in(1 downto 0),
      txpmareset_in(0) => txpmareset_in(0),
      txpmaresetdone_out(0) => txpmaresetdone_out(0),
      txpolarity_in(0) => txpolarity_in(0),
      txpostcursor_in(4 downto 0) => txpostcursor_in(4 downto 0),
      txpostcursorinv_in(0) => txpostcursorinv_in(0),
      txprbsforceerr_in(0) => txprbsforceerr_in(0),
      txprbssel_in(3 downto 0) => txprbssel_in(3 downto 0),
      txprecursor_in(4 downto 0) => txprecursor_in(4 downto 0),
      txprecursorinv_in(0) => txprecursorinv_in(0),
      txprgdivresetdone_out(0) => txprgdivresetdone_out(0),
      txqpibiasen_in(0) => txqpibiasen_in(0),
      txqpisenn_out(0) => txqpisenn_out(0),
      txqpisenp_out(0) => txqpisenp_out(0),
      txqpistrongpdown_in(0) => txqpistrongpdown_in(0),
      txqpiweakpup_in(0) => txqpiweakpup_in(0),
      txrate_in(2 downto 0) => txrate_in(2 downto 0),
      txratedone_out(0) => txratedone_out(0),
      txratemode_in(0) => txratemode_in(0),
      txresetdone_out(0) => txresetdone_out(0),
      txsequence_in(6 downto 0) => txsequence_in(6 downto 0),
      txswing_in(0) => txswing_in(0),
      txsyncallin_in(0) => txsyncallin_in(0),
      txsyncdone_out(0) => txsyncdone_out(0),
      txsyncin_in(0) => txsyncin_in(0),
      txsyncmode_in(0) => txsyncmode_in(0),
      txsyncout_out(0) => txsyncout_out(0),
      txsysclksel_in(1 downto 0) => txsysclksel_in(1 downto 0),
      txusrclk2_in(0) => txusrclk2_in(0),
      txusrclk_in(0) => txusrclk_in(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt is
  port (
    gtwiz_userclk_tx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userclk_rx_active_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_clk_freerun_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_all_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_pll_and_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_datapath_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_cdr_stable_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_tx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_reset_rx_done_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtwiz_userdata_tx_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gtwiz_userdata_rx_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    drpclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    drpen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    drpwe_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxn_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gthrxp_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrefclk0_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    loopback_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rx8b10ben_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxbufreset_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxcommadeten_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxmcommaalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpcommaalignen_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rxpolarity_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx8b10ben_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txctrl0_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txctrl1_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    txctrl2_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    txdetectrx_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txelecidle_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    txusrclk_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    txusrclk2_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    cplllock_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    drprdy_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxn_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gthtxp_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    gtpowergood_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rxbyteisaligned_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbyterealign_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxclkcorcnt_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rxcommadet_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxctrl0_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rxctrl1_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    rxctrl2_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxctrl3_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rxoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    txoutclk_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txpmaresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    txresetdone_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt : entity is "dnpcie_aurora_2_sim_gt,dnpcie_aurora_2_sim_gt_gtwizard_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt : entity is "dnpcie_aurora_2_sim_gt";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt : entity is "dnpcie_aurora_2_sim_gt_gtwizard_top,Vivado 2018.2";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt is
  signal NLW_inst_bufgtce_out_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_bufgtcemask_out_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_bufgtdiv_out_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_inst_bufgtreset_out_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_bufgtrstmask_out_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_cpllfbclklost_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_cpllrefclklost_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_dmonitorout_out_UNCONNECTED : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal NLW_inst_dmonitoroutclk_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_drpdo_common_out_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_inst_drprdy_common_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_eyescandataerror_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtrefclkmonitor_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_buffbypass_rx_done_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_buffbypass_rx_error_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_buffbypass_tx_done_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_buffbypass_tx_error_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_reset_qpll0reset_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_reset_qpll1reset_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_userclk_rx_active_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_userclk_rx_srcclk_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_userclk_rx_usrclk2_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_userclk_rx_usrclk_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_userclk_tx_active_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_userclk_tx_srcclk_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_userclk_tx_usrclk2_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtwiz_userclk_tx_usrclk_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtytxn_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_gtytxp_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_pcierategen3_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_pcierateidle_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_pcierateqpllpd_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_pcierateqpllreset_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_pciesynctxsyncdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_pcieusergen3rdy_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_pcieuserphystatusrst_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_pcieuserratestart_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_pcsrsvdout_out_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_inst_phystatus_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_pinrsrvdas_out_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_pmarsvdout0_out_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_pmarsvdout1_out_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_powerpresent_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qpll0fbclklost_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qpll0lock_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qpll0outclk_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qpll0outrefclk_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qpll0refclklost_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qpll1fbclklost_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qpll1lock_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qpll1outclk_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qpll1outrefclk_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qpll1refclklost_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_qplldmonitor0_out_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_qplldmonitor1_out_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_refclkoutmonitor0_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_refclkoutmonitor1_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_resetexception_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxcdrlock_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxcdrphdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxchanbondseq_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxchanisaligned_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxchanrealign_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxchbondo_out_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_inst_rxckcaldone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxcominitdet_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxcomsasdet_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxcomwakedet_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxdata_out_UNCONNECTED : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal NLW_inst_rxdataextendrsvd_out_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_rxdatavalid_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_rxdlysresetdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxelecidle_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxheader_out_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_inst_rxheadervalid_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_rxlfpstresetdet_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxlfpsu2lpexitdet_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxlfpsu3wakedet_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxmonitorout_out_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal NLW_inst_rxosintdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxosintstarted_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxosintstrobedone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxosintstrobestarted_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxoutclkfabric_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxoutclkpcs_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxphaligndone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxphalignerr_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxprbserr_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxprbslocked_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxprgdivresetdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxqpisenn_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxqpisenp_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxratedone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxrecclk0_sel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_rxrecclk0sel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxrecclk1_sel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_rxrecclk1sel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxrecclkout_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxsliderdy_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxslipdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxslipoutclkrdy_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxslippmardy_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxstartofseq_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_rxstatus_out_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_rxsyncdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxsyncout_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_rxvalid_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_sdm0finalout_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_sdm0testdata_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_sdm1finalout_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_sdm1testdata_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_tcongpo_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_tconrsvdout0_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txcomfinish_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txdccdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txdlysresetdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txoutclkfabric_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txoutclkpcs_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txphaligndone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txphinitdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txprgdivresetdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txqpisenn_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txqpisenp_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txratedone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txsyncdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_txsyncout_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_ubdaddr_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_ubden_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_ubdi_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_ubdwe_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_ubmdmtdo_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_ubrsvdout_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_ubtxuart_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_CHANNEL_ENABLE : string;
  attribute C_CHANNEL_ENABLE of inst : label is "192'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001";
  attribute C_COMMON_SCALING_FACTOR : integer;
  attribute C_COMMON_SCALING_FACTOR of inst : label is 1;
  attribute C_CPLL_VCO_FREQUENCY : string;
  attribute C_CPLL_VCO_FREQUENCY of inst : label is "3200.000000";
  attribute C_ENABLE_COMMON_USRCLK : integer;
  attribute C_ENABLE_COMMON_USRCLK of inst : label is 0;
  attribute C_FORCE_COMMONS : integer;
  attribute C_FORCE_COMMONS of inst : label is 0;
  attribute C_FREERUN_FREQUENCY : string;
  attribute C_FREERUN_FREQUENCY of inst : label is "160.000000";
  attribute C_GT_REV : integer;
  attribute C_GT_REV of inst : label is 17;
  attribute C_GT_TYPE : integer;
  attribute C_GT_TYPE of inst : label is 0;
  attribute C_INCLUDE_CPLL_CAL : integer;
  attribute C_INCLUDE_CPLL_CAL of inst : label is 2;
  attribute C_LOCATE_COMMON : integer;
  attribute C_LOCATE_COMMON of inst : label is 0;
  attribute C_LOCATE_IN_SYSTEM_IBERT_CORE : integer;
  attribute C_LOCATE_IN_SYSTEM_IBERT_CORE of inst : label is 2;
  attribute C_LOCATE_RESET_CONTROLLER : integer;
  attribute C_LOCATE_RESET_CONTROLLER of inst : label is 0;
  attribute C_LOCATE_RX_BUFFER_BYPASS_CONTROLLER : integer;
  attribute C_LOCATE_RX_BUFFER_BYPASS_CONTROLLER of inst : label is 0;
  attribute C_LOCATE_RX_USER_CLOCKING : integer;
  attribute C_LOCATE_RX_USER_CLOCKING of inst : label is 1;
  attribute C_LOCATE_TX_BUFFER_BYPASS_CONTROLLER : integer;
  attribute C_LOCATE_TX_BUFFER_BYPASS_CONTROLLER of inst : label is 0;
  attribute C_LOCATE_TX_USER_CLOCKING : integer;
  attribute C_LOCATE_TX_USER_CLOCKING of inst : label is 1;
  attribute C_LOCATE_USER_DATA_WIDTH_SIZING : integer;
  attribute C_LOCATE_USER_DATA_WIDTH_SIZING of inst : label is 0;
  attribute C_PCIE_CORECLK_FREQ : integer;
  attribute C_PCIE_CORECLK_FREQ of inst : label is 250;
  attribute C_PCIE_ENABLE : integer;
  attribute C_PCIE_ENABLE of inst : label is 0;
  attribute C_RESET_CONTROLLER_INSTANCE_CTRL : integer;
  attribute C_RESET_CONTROLLER_INSTANCE_CTRL of inst : label is 0;
  attribute C_RESET_SEQUENCE_INTERVAL : integer;
  attribute C_RESET_SEQUENCE_INTERVAL of inst : label is 0;
  attribute C_RX_BUFFBYPASS_MODE : integer;
  attribute C_RX_BUFFBYPASS_MODE of inst : label is 0;
  attribute C_RX_BUFFER_BYPASS_INSTANCE_CTRL : integer;
  attribute C_RX_BUFFER_BYPASS_INSTANCE_CTRL of inst : label is 0;
  attribute C_RX_BUFFER_MODE : integer;
  attribute C_RX_BUFFER_MODE of inst : label is 1;
  attribute C_RX_CB_DISP : string;
  attribute C_RX_CB_DISP of inst : label is "8'b00000000";
  attribute C_RX_CB_K : string;
  attribute C_RX_CB_K of inst : label is "8'b00000000";
  attribute C_RX_CB_LEN_SEQ : integer;
  attribute C_RX_CB_LEN_SEQ of inst : label is 1;
  attribute C_RX_CB_MAX_LEVEL : integer;
  attribute C_RX_CB_MAX_LEVEL of inst : label is 1;
  attribute C_RX_CB_NUM_SEQ : integer;
  attribute C_RX_CB_NUM_SEQ of inst : label is 0;
  attribute C_RX_CB_VAL : string;
  attribute C_RX_CB_VAL of inst : label is "80'b00000000000000000000000000000000000000000000000000000000000000000000000000000000";
  attribute C_RX_CC_DISP : string;
  attribute C_RX_CC_DISP of inst : label is "8'b00000000";
  attribute C_RX_CC_ENABLE : integer;
  attribute C_RX_CC_ENABLE of inst : label is 1;
  attribute C_RX_CC_K : string;
  attribute C_RX_CC_K of inst : label is "8'b00001111";
  attribute C_RX_CC_LEN_SEQ : integer;
  attribute C_RX_CC_LEN_SEQ of inst : label is 4;
  attribute C_RX_CC_NUM_SEQ : integer;
  attribute C_RX_CC_NUM_SEQ of inst : label is 1;
  attribute C_RX_CC_PERIODICITY : integer;
  attribute C_RX_CC_PERIODICITY of inst : label is 2500;
  attribute C_RX_CC_VAL : string;
  attribute C_RX_CC_VAL of inst : label is "80'b00000000000000000000000000000000000000000011110111001111011100111101110011110111";
  attribute C_RX_COMMA_M_ENABLE : integer;
  attribute C_RX_COMMA_M_ENABLE of inst : label is 1;
  attribute C_RX_COMMA_M_VAL : string;
  attribute C_RX_COMMA_M_VAL of inst : label is "10'b1010000011";
  attribute C_RX_COMMA_P_ENABLE : integer;
  attribute C_RX_COMMA_P_ENABLE of inst : label is 1;
  attribute C_RX_COMMA_P_VAL : string;
  attribute C_RX_COMMA_P_VAL of inst : label is "10'b0101111100";
  attribute C_RX_DATA_DECODING : integer;
  attribute C_RX_DATA_DECODING of inst : label is 1;
  attribute C_RX_ENABLE : integer;
  attribute C_RX_ENABLE of inst : label is 1;
  attribute C_RX_INT_DATA_WIDTH : integer;
  attribute C_RX_INT_DATA_WIDTH of inst : label is 40;
  attribute C_RX_LINE_RATE : string;
  attribute C_RX_LINE_RATE of inst : label is "6.400000";
  attribute C_RX_MASTER_CHANNEL_IDX : integer;
  attribute C_RX_MASTER_CHANNEL_IDX of inst : label is 0;
  attribute C_RX_OUTCLK_BUFG_GT_DIV : integer;
  attribute C_RX_OUTCLK_BUFG_GT_DIV of inst : label is 1;
  attribute C_RX_OUTCLK_FREQUENCY : string;
  attribute C_RX_OUTCLK_FREQUENCY of inst : label is "160.000000";
  attribute C_RX_OUTCLK_SOURCE : integer;
  attribute C_RX_OUTCLK_SOURCE of inst : label is 1;
  attribute C_RX_PLL_TYPE : integer;
  attribute C_RX_PLL_TYPE of inst : label is 2;
  attribute C_RX_RECCLK_OUTPUT : string;
  attribute C_RX_RECCLK_OUTPUT of inst : label is "192'b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  attribute C_RX_REFCLK_FREQUENCY : string;
  attribute C_RX_REFCLK_FREQUENCY of inst : label is "200.000000";
  attribute C_RX_SLIDE_MODE : integer;
  attribute C_RX_SLIDE_MODE of inst : label is 0;
  attribute C_RX_USER_CLOCKING_CONTENTS : integer;
  attribute C_RX_USER_CLOCKING_CONTENTS of inst : label is 0;
  attribute C_RX_USER_CLOCKING_INSTANCE_CTRL : integer;
  attribute C_RX_USER_CLOCKING_INSTANCE_CTRL of inst : label is 0;
  attribute C_RX_USER_CLOCKING_RATIO_FSRC_FUSRCLK : integer;
  attribute C_RX_USER_CLOCKING_RATIO_FSRC_FUSRCLK of inst : label is 1;
  attribute C_RX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2 : integer;
  attribute C_RX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2 of inst : label is 1;
  attribute C_RX_USER_CLOCKING_SOURCE : integer;
  attribute C_RX_USER_CLOCKING_SOURCE of inst : label is 0;
  attribute C_RX_USER_DATA_WIDTH : integer;
  attribute C_RX_USER_DATA_WIDTH of inst : label is 32;
  attribute C_RX_USRCLK2_FREQUENCY : string;
  attribute C_RX_USRCLK2_FREQUENCY of inst : label is "160.000000";
  attribute C_RX_USRCLK_FREQUENCY : string;
  attribute C_RX_USRCLK_FREQUENCY of inst : label is "160.000000";
  attribute C_SECONDARY_QPLL_ENABLE : integer;
  attribute C_SECONDARY_QPLL_ENABLE of inst : label is 0;
  attribute C_SECONDARY_QPLL_REFCLK_FREQUENCY : string;
  attribute C_SECONDARY_QPLL_REFCLK_FREQUENCY of inst : label is "257.812500";
  attribute C_SIM_CPLL_CAL_BYPASS : integer;
  attribute C_SIM_CPLL_CAL_BYPASS of inst : label is 1;
  attribute C_TOTAL_NUM_CHANNELS : integer;
  attribute C_TOTAL_NUM_CHANNELS of inst : label is 1;
  attribute C_TOTAL_NUM_COMMONS : integer;
  attribute C_TOTAL_NUM_COMMONS of inst : label is 0;
  attribute C_TOTAL_NUM_COMMONS_EXAMPLE : integer;
  attribute C_TOTAL_NUM_COMMONS_EXAMPLE of inst : label is 0;
  attribute C_TXPROGDIV_FREQ_ENABLE : integer;
  attribute C_TXPROGDIV_FREQ_ENABLE of inst : label is 0;
  attribute C_TXPROGDIV_FREQ_SOURCE : integer;
  attribute C_TXPROGDIV_FREQ_SOURCE of inst : label is 2;
  attribute C_TXPROGDIV_FREQ_VAL : string;
  attribute C_TXPROGDIV_FREQ_VAL of inst : label is "160.000000";
  attribute C_TX_BUFFBYPASS_MODE : integer;
  attribute C_TX_BUFFBYPASS_MODE of inst : label is 0;
  attribute C_TX_BUFFER_BYPASS_INSTANCE_CTRL : integer;
  attribute C_TX_BUFFER_BYPASS_INSTANCE_CTRL of inst : label is 0;
  attribute C_TX_BUFFER_MODE : integer;
  attribute C_TX_BUFFER_MODE of inst : label is 1;
  attribute C_TX_DATA_ENCODING : integer;
  attribute C_TX_DATA_ENCODING of inst : label is 1;
  attribute C_TX_ENABLE : integer;
  attribute C_TX_ENABLE of inst : label is 1;
  attribute C_TX_INT_DATA_WIDTH : integer;
  attribute C_TX_INT_DATA_WIDTH of inst : label is 40;
  attribute C_TX_LINE_RATE : string;
  attribute C_TX_LINE_RATE of inst : label is "6.400000";
  attribute C_TX_MASTER_CHANNEL_IDX : integer;
  attribute C_TX_MASTER_CHANNEL_IDX of inst : label is 0;
  attribute C_TX_OUTCLK_BUFG_GT_DIV : integer;
  attribute C_TX_OUTCLK_BUFG_GT_DIV of inst : label is 1;
  attribute C_TX_OUTCLK_FREQUENCY : string;
  attribute C_TX_OUTCLK_FREQUENCY of inst : label is "160.000000";
  attribute C_TX_OUTCLK_SOURCE : integer;
  attribute C_TX_OUTCLK_SOURCE of inst : label is 1;
  attribute C_TX_PLL_TYPE : integer;
  attribute C_TX_PLL_TYPE of inst : label is 2;
  attribute C_TX_REFCLK_FREQUENCY : string;
  attribute C_TX_REFCLK_FREQUENCY of inst : label is "200.000000";
  attribute C_TX_USER_CLOCKING_CONTENTS : integer;
  attribute C_TX_USER_CLOCKING_CONTENTS of inst : label is 0;
  attribute C_TX_USER_CLOCKING_INSTANCE_CTRL : integer;
  attribute C_TX_USER_CLOCKING_INSTANCE_CTRL of inst : label is 0;
  attribute C_TX_USER_CLOCKING_RATIO_FSRC_FUSRCLK : integer;
  attribute C_TX_USER_CLOCKING_RATIO_FSRC_FUSRCLK of inst : label is 1;
  attribute C_TX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2 : integer;
  attribute C_TX_USER_CLOCKING_RATIO_FUSRCLK_FUSRCLK2 of inst : label is 1;
  attribute C_TX_USER_CLOCKING_SOURCE : integer;
  attribute C_TX_USER_CLOCKING_SOURCE of inst : label is 0;
  attribute C_TX_USER_DATA_WIDTH : integer;
  attribute C_TX_USER_DATA_WIDTH of inst : label is 32;
  attribute C_TX_USRCLK2_FREQUENCY : string;
  attribute C_TX_USRCLK2_FREQUENCY of inst : label is "160.000000";
  attribute C_TX_USRCLK_FREQUENCY : string;
  attribute C_TX_USRCLK_FREQUENCY of inst : label is "160.000000";
  attribute C_USER_GTPOWERGOOD_DELAY_EN : integer;
  attribute C_USER_GTPOWERGOOD_DELAY_EN of inst : label is 0;
begin
inst: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt_gtwizard_top
     port map (
      bgbypassb_in(0) => '1',
      bgmonitorenb_in(0) => '1',
      bgpdb_in(0) => '1',
      bgrcalovrd_in(4 downto 0) => B"11111",
      bgrcalovrdenb_in(0) => '1',
      bufgtce_out(2 downto 0) => NLW_inst_bufgtce_out_UNCONNECTED(2 downto 0),
      bufgtcemask_out(2 downto 0) => NLW_inst_bufgtcemask_out_UNCONNECTED(2 downto 0),
      bufgtdiv_out(8 downto 0) => NLW_inst_bufgtdiv_out_UNCONNECTED(8 downto 0),
      bufgtreset_out(2 downto 0) => NLW_inst_bufgtreset_out_UNCONNECTED(2 downto 0),
      bufgtrstmask_out(2 downto 0) => NLW_inst_bufgtrstmask_out_UNCONNECTED(2 downto 0),
      cdrstepdir_in(0) => '0',
      cdrstepsq_in(0) => '0',
      cdrstepsx_in(0) => '0',
      cfgreset_in(0) => '0',
      clkrsvd0_in(0) => '0',
      clkrsvd1_in(0) => '0',
      cpllfbclklost_out(0) => NLW_inst_cpllfbclklost_out_UNCONNECTED(0),
      cpllfreqlock_in(0) => '0',
      cplllock_out(0) => cplllock_out(0),
      cplllockdetclk_in(0) => '0',
      cplllocken_in(0) => '1',
      cpllpd_in(0) => '0',
      cpllrefclklost_out(0) => NLW_inst_cpllrefclklost_out_UNCONNECTED(0),
      cpllrefclksel_in(2 downto 0) => B"001",
      cpllreset_in(0) => '0',
      dmonfiforeset_in(0) => '0',
      dmonitorclk_in(0) => '0',
      dmonitorout_out(16 downto 0) => NLW_inst_dmonitorout_out_UNCONNECTED(16 downto 0),
      dmonitoroutclk_out(0) => NLW_inst_dmonitoroutclk_out_UNCONNECTED(0),
      drpaddr_common_in(8 downto 0) => B"000000000",
      drpaddr_in(8 downto 0) => drpaddr_in(8 downto 0),
      drpclk_common_in(0) => '0',
      drpclk_in(0) => drpclk_in(0),
      drpdi_common_in(15 downto 0) => B"0000000000000000",
      drpdi_in(15 downto 0) => drpdi_in(15 downto 0),
      drpdo_common_out(15 downto 0) => NLW_inst_drpdo_common_out_UNCONNECTED(15 downto 0),
      drpdo_out(15 downto 0) => drpdo_out(15 downto 0),
      drpen_common_in(0) => '0',
      drpen_in(0) => drpen_in(0),
      drprdy_common_out(0) => NLW_inst_drprdy_common_out_UNCONNECTED(0),
      drprdy_out(0) => drprdy_out(0),
      drprst_in(0) => '0',
      drpwe_common_in(0) => '0',
      drpwe_in(0) => drpwe_in(0),
      elpcaldvorwren_in(0) => '0',
      elpcalpaorwren_in(0) => '0',
      evoddphicaldone_in(0) => '0',
      evoddphicalstart_in(0) => '0',
      evoddphidrden_in(0) => '0',
      evoddphidwren_in(0) => '0',
      evoddphixrden_in(0) => '0',
      evoddphixwren_in(0) => '0',
      eyescandataerror_out(0) => NLW_inst_eyescandataerror_out_UNCONNECTED(0),
      eyescanmode_in(0) => '0',
      eyescanreset_in(0) => '0',
      eyescantrigger_in(0) => '0',
      freqos_in(0) => '0',
      gtgrefclk0_in(0) => '0',
      gtgrefclk1_in(0) => '0',
      gtgrefclk_in(0) => '0',
      gthrxn_in(0) => gthrxn_in(0),
      gthrxp_in(0) => gthrxp_in(0),
      gthtxn_out(0) => gthtxn_out(0),
      gthtxp_out(0) => gthtxp_out(0),
      gtnorthrefclk00_in(0) => '0',
      gtnorthrefclk01_in(0) => '0',
      gtnorthrefclk0_in(0) => '0',
      gtnorthrefclk10_in(0) => '0',
      gtnorthrefclk11_in(0) => '0',
      gtnorthrefclk1_in(0) => '0',
      gtpowergood_out(0) => gtpowergood_out(0),
      gtrefclk00_in(0) => '0',
      gtrefclk01_in(0) => '0',
      gtrefclk0_in(0) => gtrefclk0_in(0),
      gtrefclk10_in(0) => '0',
      gtrefclk11_in(0) => '0',
      gtrefclk1_in(0) => '0',
      gtrefclkmonitor_out(0) => NLW_inst_gtrefclkmonitor_out_UNCONNECTED(0),
      gtresetsel_in(0) => '0',
      gtrsvd_in(15 downto 0) => B"0000000000000000",
      gtrxreset_in(0) => '0',
      gtrxresetsel_in(0) => '0',
      gtsouthrefclk00_in(0) => '0',
      gtsouthrefclk01_in(0) => '0',
      gtsouthrefclk0_in(0) => '0',
      gtsouthrefclk10_in(0) => '0',
      gtsouthrefclk11_in(0) => '0',
      gtsouthrefclk1_in(0) => '0',
      gttxreset_in(0) => '0',
      gttxresetsel_in(0) => '0',
      gtwiz_buffbypass_rx_done_out(0) => NLW_inst_gtwiz_buffbypass_rx_done_out_UNCONNECTED(0),
      gtwiz_buffbypass_rx_error_out(0) => NLW_inst_gtwiz_buffbypass_rx_error_out_UNCONNECTED(0),
      gtwiz_buffbypass_rx_reset_in(0) => '0',
      gtwiz_buffbypass_rx_start_user_in(0) => '0',
      gtwiz_buffbypass_tx_done_out(0) => NLW_inst_gtwiz_buffbypass_tx_done_out_UNCONNECTED(0),
      gtwiz_buffbypass_tx_error_out(0) => NLW_inst_gtwiz_buffbypass_tx_error_out_UNCONNECTED(0),
      gtwiz_buffbypass_tx_reset_in(0) => '0',
      gtwiz_buffbypass_tx_start_user_in(0) => '0',
      gtwiz_gthe3_cpll_cal_bufg_ce_in(0) => '0',
      gtwiz_gthe3_cpll_cal_cnt_tol_in(17 downto 0) => B"000000000000000000",
      gtwiz_gthe3_cpll_cal_txoutclk_period_in(17 downto 0) => B"000000000000000000",
      gtwiz_gthe4_cpll_cal_bufg_ce_in(0) => '0',
      gtwiz_gthe4_cpll_cal_cnt_tol_in(17 downto 0) => B"000000000000000000",
      gtwiz_gthe4_cpll_cal_txoutclk_period_in(17 downto 0) => B"000000000000000000",
      gtwiz_gtye4_cpll_cal_bufg_ce_in(0) => '0',
      gtwiz_gtye4_cpll_cal_cnt_tol_in(17 downto 0) => B"000000000000000000",
      gtwiz_gtye4_cpll_cal_txoutclk_period_in(17 downto 0) => B"000000000000000000",
      gtwiz_reset_all_in(0) => gtwiz_reset_all_in(0),
      gtwiz_reset_clk_freerun_in(0) => gtwiz_reset_clk_freerun_in(0),
      gtwiz_reset_qpll0lock_in(0) => '0',
      gtwiz_reset_qpll0reset_out(0) => NLW_inst_gtwiz_reset_qpll0reset_out_UNCONNECTED(0),
      gtwiz_reset_qpll1lock_in(0) => '0',
      gtwiz_reset_qpll1reset_out(0) => NLW_inst_gtwiz_reset_qpll1reset_out_UNCONNECTED(0),
      gtwiz_reset_rx_cdr_stable_out(0) => gtwiz_reset_rx_cdr_stable_out(0),
      gtwiz_reset_rx_datapath_in(0) => gtwiz_reset_rx_datapath_in(0),
      gtwiz_reset_rx_done_in(0) => '0',
      gtwiz_reset_rx_done_out(0) => gtwiz_reset_rx_done_out(0),
      gtwiz_reset_rx_pll_and_datapath_in(0) => gtwiz_reset_rx_pll_and_datapath_in(0),
      gtwiz_reset_tx_datapath_in(0) => gtwiz_reset_tx_datapath_in(0),
      gtwiz_reset_tx_done_in(0) => '0',
      gtwiz_reset_tx_done_out(0) => gtwiz_reset_tx_done_out(0),
      gtwiz_reset_tx_pll_and_datapath_in(0) => gtwiz_reset_tx_pll_and_datapath_in(0),
      gtwiz_userclk_rx_active_in(0) => gtwiz_userclk_rx_active_in(0),
      gtwiz_userclk_rx_active_out(0) => NLW_inst_gtwiz_userclk_rx_active_out_UNCONNECTED(0),
      gtwiz_userclk_rx_reset_in(0) => '0',
      gtwiz_userclk_rx_srcclk_out(0) => NLW_inst_gtwiz_userclk_rx_srcclk_out_UNCONNECTED(0),
      gtwiz_userclk_rx_usrclk2_out(0) => NLW_inst_gtwiz_userclk_rx_usrclk2_out_UNCONNECTED(0),
      gtwiz_userclk_rx_usrclk_out(0) => NLW_inst_gtwiz_userclk_rx_usrclk_out_UNCONNECTED(0),
      gtwiz_userclk_tx_active_in(0) => gtwiz_userclk_tx_active_in(0),
      gtwiz_userclk_tx_active_out(0) => NLW_inst_gtwiz_userclk_tx_active_out_UNCONNECTED(0),
      gtwiz_userclk_tx_reset_in(0) => '0',
      gtwiz_userclk_tx_srcclk_out(0) => NLW_inst_gtwiz_userclk_tx_srcclk_out_UNCONNECTED(0),
      gtwiz_userclk_tx_usrclk2_out(0) => NLW_inst_gtwiz_userclk_tx_usrclk2_out_UNCONNECTED(0),
      gtwiz_userclk_tx_usrclk_out(0) => NLW_inst_gtwiz_userclk_tx_usrclk_out_UNCONNECTED(0),
      gtwiz_userdata_rx_out(31 downto 0) => gtwiz_userdata_rx_out(31 downto 0),
      gtwiz_userdata_tx_in(31 downto 0) => gtwiz_userdata_tx_in(31 downto 0),
      gtyrxn_in(0) => '0',
      gtyrxp_in(0) => '0',
      gtytxn_out(0) => NLW_inst_gtytxn_out_UNCONNECTED(0),
      gtytxp_out(0) => NLW_inst_gtytxp_out_UNCONNECTED(0),
      incpctrl_in(0) => '0',
      loopback_in(2 downto 0) => loopback_in(2 downto 0),
      looprsvd_in(0) => '0',
      lpbkrxtxseren_in(0) => '0',
      lpbktxrxseren_in(0) => '0',
      pcieeqrxeqadaptdone_in(0) => '0',
      pcierategen3_out(0) => NLW_inst_pcierategen3_out_UNCONNECTED(0),
      pcierateidle_out(0) => NLW_inst_pcierateidle_out_UNCONNECTED(0),
      pcierateqpll0_in(0) => '0',
      pcierateqpll1_in(0) => '0',
      pcierateqpllpd_out(1 downto 0) => NLW_inst_pcierateqpllpd_out_UNCONNECTED(1 downto 0),
      pcierateqpllreset_out(1 downto 0) => NLW_inst_pcierateqpllreset_out_UNCONNECTED(1 downto 0),
      pcierstidle_in(0) => '0',
      pciersttxsyncstart_in(0) => '0',
      pciesynctxsyncdone_out(0) => NLW_inst_pciesynctxsyncdone_out_UNCONNECTED(0),
      pcieusergen3rdy_out(0) => NLW_inst_pcieusergen3rdy_out_UNCONNECTED(0),
      pcieuserphystatusrst_out(0) => NLW_inst_pcieuserphystatusrst_out_UNCONNECTED(0),
      pcieuserratedone_in(0) => '0',
      pcieuserratestart_out(0) => NLW_inst_pcieuserratestart_out_UNCONNECTED(0),
      pcsrsvdin2_in(4 downto 0) => B"00000",
      pcsrsvdin_in(15 downto 0) => B"0000000000000000",
      pcsrsvdout_out(11 downto 0) => NLW_inst_pcsrsvdout_out_UNCONNECTED(11 downto 0),
      phystatus_out(0) => NLW_inst_phystatus_out_UNCONNECTED(0),
      pinrsrvdas_out(7 downto 0) => NLW_inst_pinrsrvdas_out_UNCONNECTED(7 downto 0),
      pmarsvd0_in(7 downto 0) => B"00000000",
      pmarsvd1_in(7 downto 0) => B"00000000",
      pmarsvdin_in(4 downto 0) => B"00000",
      pmarsvdout0_out(7 downto 0) => NLW_inst_pmarsvdout0_out_UNCONNECTED(7 downto 0),
      pmarsvdout1_out(7 downto 0) => NLW_inst_pmarsvdout1_out_UNCONNECTED(7 downto 0),
      powerpresent_out(0) => NLW_inst_powerpresent_out_UNCONNECTED(0),
      qpll0clk_in(0) => '0',
      qpll0clkrsvd0_in(0) => '0',
      qpll0clkrsvd1_in(0) => '0',
      qpll0fbclklost_out(0) => NLW_inst_qpll0fbclklost_out_UNCONNECTED(0),
      qpll0fbdiv_in(0) => '0',
      qpll0freqlock_in(0) => '0',
      qpll0lock_out(0) => NLW_inst_qpll0lock_out_UNCONNECTED(0),
      qpll0lockdetclk_in(0) => '0',
      qpll0locken_in(0) => '0',
      qpll0outclk_out(0) => NLW_inst_qpll0outclk_out_UNCONNECTED(0),
      qpll0outrefclk_out(0) => NLW_inst_qpll0outrefclk_out_UNCONNECTED(0),
      qpll0pd_in(0) => '1',
      qpll0refclk_in(0) => '0',
      qpll0refclklost_out(0) => NLW_inst_qpll0refclklost_out_UNCONNECTED(0),
      qpll0refclksel_in(2 downto 0) => B"001",
      qpll0reset_in(0) => '1',
      qpll1clk_in(0) => '0',
      qpll1clkrsvd0_in(0) => '0',
      qpll1clkrsvd1_in(0) => '0',
      qpll1fbclklost_out(0) => NLW_inst_qpll1fbclklost_out_UNCONNECTED(0),
      qpll1fbdiv_in(0) => '0',
      qpll1freqlock_in(0) => '0',
      qpll1lock_out(0) => NLW_inst_qpll1lock_out_UNCONNECTED(0),
      qpll1lockdetclk_in(0) => '0',
      qpll1locken_in(0) => '0',
      qpll1outclk_out(0) => NLW_inst_qpll1outclk_out_UNCONNECTED(0),
      qpll1outrefclk_out(0) => NLW_inst_qpll1outrefclk_out_UNCONNECTED(0),
      qpll1pd_in(0) => '1',
      qpll1refclk_in(0) => '0',
      qpll1refclklost_out(0) => NLW_inst_qpll1refclklost_out_UNCONNECTED(0),
      qpll1refclksel_in(2 downto 0) => B"001",
      qpll1reset_in(0) => '1',
      qplldmonitor0_out(7 downto 0) => NLW_inst_qplldmonitor0_out_UNCONNECTED(7 downto 0),
      qplldmonitor1_out(7 downto 0) => NLW_inst_qplldmonitor1_out_UNCONNECTED(7 downto 0),
      qpllrsvd1_in(7 downto 0) => B"00000000",
      qpllrsvd2_in(4 downto 0) => B"00000",
      qpllrsvd3_in(4 downto 0) => B"00000",
      qpllrsvd4_in(7 downto 0) => B"00000000",
      rcalenb_in(0) => '1',
      refclkoutmonitor0_out(0) => NLW_inst_refclkoutmonitor0_out_UNCONNECTED(0),
      refclkoutmonitor1_out(0) => NLW_inst_refclkoutmonitor1_out_UNCONNECTED(0),
      resetexception_out(0) => NLW_inst_resetexception_out_UNCONNECTED(0),
      resetovrd_in(0) => '0',
      rstclkentx_in(0) => '0',
      rx8b10ben_in(0) => rx8b10ben_in(0),
      rxafecfoken_in(0) => '0',
      rxbufreset_in(0) => rxbufreset_in(0),
      rxbufstatus_out(2 downto 0) => rxbufstatus_out(2 downto 0),
      rxbyteisaligned_out(0) => rxbyteisaligned_out(0),
      rxbyterealign_out(0) => rxbyterealign_out(0),
      rxcdrfreqreset_in(0) => '0',
      rxcdrhold_in(0) => '0',
      rxcdrlock_out(0) => NLW_inst_rxcdrlock_out_UNCONNECTED(0),
      rxcdrovrden_in(0) => '0',
      rxcdrphdone_out(0) => NLW_inst_rxcdrphdone_out_UNCONNECTED(0),
      rxcdrreset_in(0) => '0',
      rxcdrresetrsv_in(0) => '0',
      rxchanbondseq_out(0) => NLW_inst_rxchanbondseq_out_UNCONNECTED(0),
      rxchanisaligned_out(0) => NLW_inst_rxchanisaligned_out_UNCONNECTED(0),
      rxchanrealign_out(0) => NLW_inst_rxchanrealign_out_UNCONNECTED(0),
      rxchbonden_in(0) => '0',
      rxchbondi_in(4 downto 0) => B"00000",
      rxchbondlevel_in(2 downto 0) => B"000",
      rxchbondmaster_in(0) => '0',
      rxchbondo_out(4 downto 0) => NLW_inst_rxchbondo_out_UNCONNECTED(4 downto 0),
      rxchbondslave_in(0) => '0',
      rxckcaldone_out(0) => NLW_inst_rxckcaldone_out_UNCONNECTED(0),
      rxckcalreset_in(0) => '0',
      rxckcalstart_in(0) => '0',
      rxclkcorcnt_out(1 downto 0) => rxclkcorcnt_out(1 downto 0),
      rxcominitdet_out(0) => NLW_inst_rxcominitdet_out_UNCONNECTED(0),
      rxcommadet_out(0) => rxcommadet_out(0),
      rxcommadeten_in(0) => rxcommadeten_in(0),
      rxcomsasdet_out(0) => NLW_inst_rxcomsasdet_out_UNCONNECTED(0),
      rxcomwakedet_out(0) => NLW_inst_rxcomwakedet_out_UNCONNECTED(0),
      rxctrl0_out(15 downto 0) => rxctrl0_out(15 downto 0),
      rxctrl1_out(15 downto 0) => rxctrl1_out(15 downto 0),
      rxctrl2_out(7 downto 0) => rxctrl2_out(7 downto 0),
      rxctrl3_out(7 downto 0) => rxctrl3_out(7 downto 0),
      rxdata_out(127 downto 0) => NLW_inst_rxdata_out_UNCONNECTED(127 downto 0),
      rxdataextendrsvd_out(7 downto 0) => NLW_inst_rxdataextendrsvd_out_UNCONNECTED(7 downto 0),
      rxdatavalid_out(1 downto 0) => NLW_inst_rxdatavalid_out_UNCONNECTED(1 downto 0),
      rxdccforcestart_in(0) => '0',
      rxdfeagcctrl_in(1 downto 0) => B"01",
      rxdfeagchold_in(0) => '0',
      rxdfeagcovrden_in(0) => '0',
      rxdfecfokfcnum_in(0) => '0',
      rxdfecfokfen_in(0) => '0',
      rxdfecfokfpulse_in(0) => '0',
      rxdfecfokhold_in(0) => '0',
      rxdfecfokovren_in(0) => '0',
      rxdfekhhold_in(0) => '0',
      rxdfekhovrden_in(0) => '0',
      rxdfelfhold_in(0) => '0',
      rxdfelfovrden_in(0) => '0',
      rxdfelpmreset_in(0) => '0',
      rxdfetap10hold_in(0) => '0',
      rxdfetap10ovrden_in(0) => '0',
      rxdfetap11hold_in(0) => '0',
      rxdfetap11ovrden_in(0) => '0',
      rxdfetap12hold_in(0) => '0',
      rxdfetap12ovrden_in(0) => '0',
      rxdfetap13hold_in(0) => '0',
      rxdfetap13ovrden_in(0) => '0',
      rxdfetap14hold_in(0) => '0',
      rxdfetap14ovrden_in(0) => '0',
      rxdfetap15hold_in(0) => '0',
      rxdfetap15ovrden_in(0) => '0',
      rxdfetap2hold_in(0) => '0',
      rxdfetap2ovrden_in(0) => '0',
      rxdfetap3hold_in(0) => '0',
      rxdfetap3ovrden_in(0) => '0',
      rxdfetap4hold_in(0) => '0',
      rxdfetap4ovrden_in(0) => '0',
      rxdfetap5hold_in(0) => '0',
      rxdfetap5ovrden_in(0) => '0',
      rxdfetap6hold_in(0) => '0',
      rxdfetap6ovrden_in(0) => '0',
      rxdfetap7hold_in(0) => '0',
      rxdfetap7ovrden_in(0) => '0',
      rxdfetap8hold_in(0) => '0',
      rxdfetap8ovrden_in(0) => '0',
      rxdfetap9hold_in(0) => '0',
      rxdfetap9ovrden_in(0) => '0',
      rxdfeuthold_in(0) => '0',
      rxdfeutovrden_in(0) => '0',
      rxdfevphold_in(0) => '0',
      rxdfevpovrden_in(0) => '0',
      rxdfevsen_in(0) => '0',
      rxdfexyden_in(0) => '1',
      rxdlybypass_in(0) => '1',
      rxdlyen_in(0) => '0',
      rxdlyovrden_in(0) => '0',
      rxdlysreset_in(0) => '0',
      rxdlysresetdone_out(0) => NLW_inst_rxdlysresetdone_out_UNCONNECTED(0),
      rxelecidle_out(0) => NLW_inst_rxelecidle_out_UNCONNECTED(0),
      rxelecidlemode_in(1 downto 0) => B"11",
      rxeqtraining_in(0) => '0',
      rxgearboxslip_in(0) => '0',
      rxheader_out(5 downto 0) => NLW_inst_rxheader_out_UNCONNECTED(5 downto 0),
      rxheadervalid_out(1 downto 0) => NLW_inst_rxheadervalid_out_UNCONNECTED(1 downto 0),
      rxlatclk_in(0) => '0',
      rxlfpstresetdet_out(0) => NLW_inst_rxlfpstresetdet_out_UNCONNECTED(0),
      rxlfpsu2lpexitdet_out(0) => NLW_inst_rxlfpsu2lpexitdet_out_UNCONNECTED(0),
      rxlfpsu3wakedet_out(0) => NLW_inst_rxlfpsu3wakedet_out_UNCONNECTED(0),
      rxlpmen_in(0) => '1',
      rxlpmgchold_in(0) => '0',
      rxlpmgcovrden_in(0) => '0',
      rxlpmhfhold_in(0) => '0',
      rxlpmhfovrden_in(0) => '0',
      rxlpmlfhold_in(0) => '0',
      rxlpmlfklovrden_in(0) => '0',
      rxlpmoshold_in(0) => '0',
      rxlpmosovrden_in(0) => '0',
      rxmcommaalignen_in(0) => rxmcommaalignen_in(0),
      rxmonitorout_out(6 downto 0) => NLW_inst_rxmonitorout_out_UNCONNECTED(6 downto 0),
      rxmonitorsel_in(1 downto 0) => B"00",
      rxoobreset_in(0) => '0',
      rxoscalreset_in(0) => '0',
      rxoshold_in(0) => '0',
      rxosintcfg_in(3 downto 0) => B"1101",
      rxosintdone_out(0) => NLW_inst_rxosintdone_out_UNCONNECTED(0),
      rxosinten_in(0) => '1',
      rxosinthold_in(0) => '0',
      rxosintovrden_in(0) => '0',
      rxosintstarted_out(0) => NLW_inst_rxosintstarted_out_UNCONNECTED(0),
      rxosintstrobe_in(0) => '0',
      rxosintstrobedone_out(0) => NLW_inst_rxosintstrobedone_out_UNCONNECTED(0),
      rxosintstrobestarted_out(0) => NLW_inst_rxosintstrobestarted_out_UNCONNECTED(0),
      rxosinttestovrden_in(0) => '0',
      rxosovrden_in(0) => '0',
      rxoutclk_out(0) => rxoutclk_out(0),
      rxoutclkfabric_out(0) => NLW_inst_rxoutclkfabric_out_UNCONNECTED(0),
      rxoutclkpcs_out(0) => NLW_inst_rxoutclkpcs_out_UNCONNECTED(0),
      rxoutclksel_in(2 downto 0) => B"010",
      rxpcommaalignen_in(0) => rxpcommaalignen_in(0),
      rxpcsreset_in(0) => '0',
      rxpd_in(1 downto 0) => rxpd_in(1 downto 0),
      rxphalign_in(0) => '0',
      rxphaligndone_out(0) => NLW_inst_rxphaligndone_out_UNCONNECTED(0),
      rxphalignen_in(0) => '0',
      rxphalignerr_out(0) => NLW_inst_rxphalignerr_out_UNCONNECTED(0),
      rxphdlypd_in(0) => '1',
      rxphdlyreset_in(0) => '0',
      rxphovrden_in(0) => '0',
      rxpllclksel_in(1 downto 0) => B"00",
      rxpmareset_in(0) => '0',
      rxpmaresetdone_out(0) => rxpmaresetdone_out(0),
      rxpolarity_in(0) => rxpolarity_in(0),
      rxprbscntreset_in(0) => '0',
      rxprbserr_out(0) => NLW_inst_rxprbserr_out_UNCONNECTED(0),
      rxprbslocked_out(0) => NLW_inst_rxprbslocked_out_UNCONNECTED(0),
      rxprbssel_in(3 downto 0) => B"0000",
      rxprgdivresetdone_out(0) => NLW_inst_rxprgdivresetdone_out_UNCONNECTED(0),
      rxprogdivreset_in(0) => '0',
      rxqpien_in(0) => '0',
      rxqpisenn_out(0) => NLW_inst_rxqpisenn_out_UNCONNECTED(0),
      rxqpisenp_out(0) => NLW_inst_rxqpisenp_out_UNCONNECTED(0),
      rxrate_in(2 downto 0) => B"000",
      rxratedone_out(0) => NLW_inst_rxratedone_out_UNCONNECTED(0),
      rxratemode_in(0) => '0',
      rxrecclk0_sel_out(1 downto 0) => NLW_inst_rxrecclk0_sel_out_UNCONNECTED(1 downto 0),
      rxrecclk0sel_out(0) => NLW_inst_rxrecclk0sel_out_UNCONNECTED(0),
      rxrecclk1_sel_out(1 downto 0) => NLW_inst_rxrecclk1_sel_out_UNCONNECTED(1 downto 0),
      rxrecclk1sel_out(0) => NLW_inst_rxrecclk1sel_out_UNCONNECTED(0),
      rxrecclkout_out(0) => NLW_inst_rxrecclkout_out_UNCONNECTED(0),
      rxresetdone_out(0) => rxresetdone_out(0),
      rxslide_in(0) => '0',
      rxsliderdy_out(0) => NLW_inst_rxsliderdy_out_UNCONNECTED(0),
      rxslipdone_out(0) => NLW_inst_rxslipdone_out_UNCONNECTED(0),
      rxslipoutclk_in(0) => '0',
      rxslipoutclkrdy_out(0) => NLW_inst_rxslipoutclkrdy_out_UNCONNECTED(0),
      rxslippma_in(0) => '0',
      rxslippmardy_out(0) => NLW_inst_rxslippmardy_out_UNCONNECTED(0),
      rxstartofseq_out(1 downto 0) => NLW_inst_rxstartofseq_out_UNCONNECTED(1 downto 0),
      rxstatus_out(2 downto 0) => NLW_inst_rxstatus_out_UNCONNECTED(2 downto 0),
      rxsyncallin_in(0) => '0',
      rxsyncdone_out(0) => NLW_inst_rxsyncdone_out_UNCONNECTED(0),
      rxsyncin_in(0) => '0',
      rxsyncmode_in(0) => '0',
      rxsyncout_out(0) => NLW_inst_rxsyncout_out_UNCONNECTED(0),
      rxsysclksel_in(1 downto 0) => B"00",
      rxtermination_in(0) => '0',
      rxuserrdy_in(0) => '1',
      rxusrclk2_in(0) => rxusrclk2_in(0),
      rxusrclk_in(0) => rxusrclk_in(0),
      rxvalid_out(0) => NLW_inst_rxvalid_out_UNCONNECTED(0),
      sdm0data_in(0) => '0',
      sdm0finalout_out(0) => NLW_inst_sdm0finalout_out_UNCONNECTED(0),
      sdm0reset_in(0) => '0',
      sdm0testdata_out(0) => NLW_inst_sdm0testdata_out_UNCONNECTED(0),
      sdm0toggle_in(0) => '0',
      sdm0width_in(0) => '0',
      sdm1data_in(0) => '0',
      sdm1finalout_out(0) => NLW_inst_sdm1finalout_out_UNCONNECTED(0),
      sdm1reset_in(0) => '0',
      sdm1testdata_out(0) => NLW_inst_sdm1testdata_out_UNCONNECTED(0),
      sdm1toggle_in(0) => '0',
      sdm1width_in(0) => '0',
      sigvalidclk_in(0) => '0',
      tcongpi_in(0) => '0',
      tcongpo_out(0) => NLW_inst_tcongpo_out_UNCONNECTED(0),
      tconpowerup_in(0) => '0',
      tconreset_in(0) => '0',
      tconrsvdin1_in(0) => '0',
      tconrsvdout0_out(0) => NLW_inst_tconrsvdout0_out_UNCONNECTED(0),
      tstin_in(19 downto 0) => B"00000000000000000000",
      tx8b10bbypass_in(7 downto 0) => B"00000000",
      tx8b10ben_in(0) => tx8b10ben_in(0),
      txbufdiffctrl_in(2 downto 0) => B"000",
      txbufstatus_out(1 downto 0) => txbufstatus_out(1 downto 0),
      txcomfinish_out(0) => NLW_inst_txcomfinish_out_UNCONNECTED(0),
      txcominit_in(0) => '0',
      txcomsas_in(0) => '0',
      txcomwake_in(0) => '0',
      txctrl0_in(15 downto 0) => txctrl0_in(15 downto 0),
      txctrl1_in(15 downto 0) => txctrl1_in(15 downto 0),
      txctrl2_in(7 downto 0) => txctrl2_in(7 downto 0),
      txdata_in(127 downto 0) => B"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      txdataextendrsvd_in(7 downto 0) => B"00000000",
      txdccdone_out(0) => NLW_inst_txdccdone_out_UNCONNECTED(0),
      txdccforcestart_in(0) => '0',
      txdccreset_in(0) => '0',
      txdeemph_in(0) => '0',
      txdetectrx_in(0) => txdetectrx_in(0),
      txdiffctrl_in(3 downto 0) => B"1100",
      txdiffpd_in(0) => '0',
      txdlybypass_in(0) => '1',
      txdlyen_in(0) => '0',
      txdlyhold_in(0) => '0',
      txdlyovrden_in(0) => '0',
      txdlysreset_in(0) => '0',
      txdlysresetdone_out(0) => NLW_inst_txdlysresetdone_out_UNCONNECTED(0),
      txdlyupdown_in(0) => '0',
      txelecidle_in(0) => txelecidle_in(0),
      txelforcestart_in(0) => '0',
      txheader_in(5 downto 0) => B"000000",
      txinhibit_in(0) => '0',
      txlatclk_in(0) => '0',
      txlfpstreset_in(0) => '0',
      txlfpsu2lpexit_in(0) => '0',
      txlfpsu3wake_in(0) => '0',
      txmaincursor_in(6 downto 0) => B"1000000",
      txmargin_in(2 downto 0) => B"000",
      txmuxdcdexhold_in(0) => '0',
      txmuxdcdorwren_in(0) => '0',
      txoneszeros_in(0) => '0',
      txoutclk_out(0) => txoutclk_out(0),
      txoutclkfabric_out(0) => NLW_inst_txoutclkfabric_out_UNCONNECTED(0),
      txoutclkpcs_out(0) => NLW_inst_txoutclkpcs_out_UNCONNECTED(0),
      txoutclksel_in(2 downto 0) => B"010",
      txpcsreset_in(0) => '0',
      txpd_in(1 downto 0) => txpd_in(1 downto 0),
      txpdelecidlemode_in(0) => '0',
      txphalign_in(0) => '0',
      txphaligndone_out(0) => NLW_inst_txphaligndone_out_UNCONNECTED(0),
      txphalignen_in(0) => '0',
      txphdlypd_in(0) => '1',
      txphdlyreset_in(0) => '0',
      txphdlytstclk_in(0) => '0',
      txphinit_in(0) => '0',
      txphinitdone_out(0) => NLW_inst_txphinitdone_out_UNCONNECTED(0),
      txphovrden_in(0) => '0',
      txpippmen_in(0) => '0',
      txpippmovrden_in(0) => '0',
      txpippmpd_in(0) => '0',
      txpippmsel_in(0) => '0',
      txpippmstepsize_in(4 downto 0) => B"00000",
      txpisopd_in(0) => '0',
      txpllclksel_in(1 downto 0) => B"00",
      txpmareset_in(0) => '0',
      txpmaresetdone_out(0) => txpmaresetdone_out(0),
      txpolarity_in(0) => '0',
      txpostcursor_in(4 downto 0) => B"00000",
      txpostcursorinv_in(0) => '0',
      txprbsforceerr_in(0) => '0',
      txprbssel_in(3 downto 0) => B"0000",
      txprecursor_in(4 downto 0) => B"00000",
      txprecursorinv_in(0) => '0',
      txprgdivresetdone_out(0) => NLW_inst_txprgdivresetdone_out_UNCONNECTED(0),
      txprogdivreset_in(0) => '0',
      txqpibiasen_in(0) => '0',
      txqpisenn_out(0) => NLW_inst_txqpisenn_out_UNCONNECTED(0),
      txqpisenp_out(0) => NLW_inst_txqpisenp_out_UNCONNECTED(0),
      txqpistrongpdown_in(0) => '0',
      txqpiweakpup_in(0) => '0',
      txrate_in(2 downto 0) => B"000",
      txratedone_out(0) => NLW_inst_txratedone_out_UNCONNECTED(0),
      txratemode_in(0) => '0',
      txresetdone_out(0) => txresetdone_out(0),
      txsequence_in(6 downto 0) => B"0000000",
      txswing_in(0) => '0',
      txsyncallin_in(0) => '0',
      txsyncdone_out(0) => NLW_inst_txsyncdone_out_UNCONNECTED(0),
      txsyncin_in(0) => '0',
      txsyncmode_in(0) => '0',
      txsyncout_out(0) => NLW_inst_txsyncout_out_UNCONNECTED(0),
      txsysclksel_in(1 downto 0) => B"00",
      txuserrdy_in(0) => '1',
      txusrclk2_in(0) => txusrclk2_in(0),
      txusrclk_in(0) => txusrclk_in(0),
      ubcfgstreamen_in(0) => '0',
      ubdaddr_out(0) => NLW_inst_ubdaddr_out_UNCONNECTED(0),
      ubden_out(0) => NLW_inst_ubden_out_UNCONNECTED(0),
      ubdi_out(0) => NLW_inst_ubdi_out_UNCONNECTED(0),
      ubdo_in(0) => '0',
      ubdrdy_in(0) => '0',
      ubdwe_out(0) => NLW_inst_ubdwe_out_UNCONNECTED(0),
      ubenable_in(0) => '0',
      ubgpi_in(0) => '0',
      ubintr_in(0) => '0',
      ubiolmbrst_in(0) => '0',
      ubmbrst_in(0) => '0',
      ubmdmcapture_in(0) => '0',
      ubmdmdbgrst_in(0) => '0',
      ubmdmdbgupdate_in(0) => '0',
      ubmdmregen_in(0) => '0',
      ubmdmshift_in(0) => '0',
      ubmdmsysrst_in(0) => '0',
      ubmdmtck_in(0) => '0',
      ubmdmtdi_in(0) => '0',
      ubmdmtdo_out(0) => NLW_inst_ubmdmtdo_out_UNCONNECTED(0),
      ubrsvdout_out(0) => NLW_inst_ubrsvdout_out_UNCONNECTED(0),
      ubtxuart_out(0) => NLW_inst_ubtxuart_out_UNCONNECTED(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_GT_WRAPPER is
  port (
    gtwiz_userdata_rx_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tx_lock : out STD_LOGIC;
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drprdy_out : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    gt_powergood : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxbyterealign_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    rxctrl0_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rxctrl2_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    tx_out_clk : out STD_LOGIC;
    tx_resetdone_out : out STD_LOGIC;
    rx_resetdone_out : out STD_LOGIC;
    reset_count_r_reg : out STD_LOGIC;
    reset_count_r_reg_0 : out STD_LOGIC;
    \soft_err_r_reg[0]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \left_align_select_r_reg[0]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \word_aligned_data_r_reg[17]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \word_aligned_data_r_reg[24]\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \word_aligned_control_bits_r_reg[2]\ : out STD_LOGIC;
    \word_aligned_control_bits_r_reg[3]\ : out STD_LOGIC;
    hard_err_gt0 : out STD_LOGIC;
    bufg_gt_clr_out : out STD_LOGIC;
    gt_txresetdone_r2_reg : out STD_LOGIC;
    gt_rxresetdone_r2_reg : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    \out\ : in STD_LOGIC;
    gtwiz_userdata_tx_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drpwe_in : in STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    ena_comma_align_i : in STD_LOGIC;
    power_down : in STD_LOGIC;
    rxpolarity_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    sync_clk : in STD_LOGIC;
    user_clk : in STD_LOGIC;
    txctrl2_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gtrxreset_i : in STD_LOGIC;
    link_reset_r : in STD_LOGIC;
    consecutive_commas_r : in STD_LOGIC;
    begin_r : in STD_LOGIC;
    enable_err_detect_i : in STD_LOGIC;
    ready_r_reg : in STD_LOGIC;
    \previous_cycle_data_r_reg[6]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \previous_cycle_control_r_reg[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    pll_not_locked : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_GT_WRAPPER : entity is "dnpcie_aurora_2_sim_GT_WRAPPER";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_GT_WRAPPER;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_GT_WRAPPER is
  signal dnpcie_aurora_2_sim_gt_i_n_113 : STD_LOGIC;
  signal gt_rxresetdone_r2_reg_srl2_n_0 : STD_LOGIC;
  signal gt_txpmaresetdone_int : STD_LOGIC;
  signal gt_txresetdone_r2_reg_srl2_n_0 : STD_LOGIC;
  signal gtrxreset_pulse : STD_LOGIC;
  signal gtrxreset_pulse_i_1_n_0 : STD_LOGIC;
  signal gtrxreset_r1 : STD_LOGIC;
  signal gtrxreset_r2 : STD_LOGIC;
  signal gtrxreset_r3 : STD_LOGIC;
  signal gtrxreset_sync : STD_LOGIC;
  signal gtwiz_reset_rx_done_out : STD_LOGIC;
  signal gtwiz_reset_tx_done_out : STD_LOGIC;
  signal gtwiz_userclk_rx_active_in : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of gtwiz_userclk_rx_active_in : signal is "true";
  signal gtwiz_userclk_tx_active_in : STD_LOGIC;
  attribute RTL_KEEP of gtwiz_userclk_tx_active_in : signal is "true";
  signal gtwiz_userclk_tx_active_in_t : STD_LOGIC;
  signal \^gtwiz_userdata_rx_out\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal link_reset_r2 : STD_LOGIC;
  signal rx_buf_err_i : STD_LOGIC;
  signal rx_disp_err_i : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rx_not_in_table_i : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^rx_resetdone_out\ : STD_LOGIC;
  signal \^rxbyterealign_out\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^rxctrl0_out\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rxfsm_soft_reset_r : STD_LOGIC;
  signal rxfsm_soft_reset_r_i_1_n_0 : STD_LOGIC;
  signal tx_buf_err_i : STD_LOGIC;
  signal \^tx_resetdone_out\ : STD_LOGIC;
  signal NLW_dnpcie_aurora_2_sim_gt_i_gtwiz_reset_rx_cdr_stable_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_rxbufstatus_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_rxbyteisaligned_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_rxclkcorcnt_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_rxcommadet_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_rxctrl0_out_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 4 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_rxctrl1_out_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 4 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_rxctrl2_out_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_rxctrl3_out_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_rxoutclk_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_rxresetdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_txbufstatus_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_dnpcie_aurora_2_sim_gt_i_txresetdone_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dnpcie_aurora_2_sim_gt_i : label is "dnpcie_aurora_2_sim_gt,dnpcie_aurora_2_sim_gt_gtwizard_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of dnpcie_aurora_2_sim_gt_i : label is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of dnpcie_aurora_2_sim_gt_i : label is "dnpcie_aurora_2_sim_gt_gtwizard_top,Vivado 2018.2";
  attribute srl_name : string;
  attribute srl_name of gt_rxresetdone_r2_reg_srl2 : label is "inst/\gt_wrapper_i/gt_rxresetdone_r2_reg_srl2 ";
  attribute srl_name of gt_txresetdone_r2_reg_srl2 : label is "inst/\gt_wrapper_i/gt_txresetdone_r2_reg_srl2 ";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of gtrxreset_r1_reg : label is "no";
  attribute KEEP : string;
  attribute KEEP of \gtwiz_userclk_rx_active_in_reg[0]\ : label is "yes";
  attribute KEEP of \gtwiz_userclk_tx_active_in_reg[0]\ : label is "yes";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \left_align_select_r[0]_i_1\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \left_align_select_r[1]_i_1\ : label is "soft_lutpair120";
  attribute equivalent_register_removal of link_reset_r2_reg : label is "no";
  attribute SOFT_HLUTNM of \soft_err_r[0]_i_1\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \soft_err_r[1]_i_1\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \soft_err_r[2]_i_1\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \soft_err_r[3]_i_1\ : label is "soft_lutpair121";
begin
  gtwiz_userdata_rx_out(31 downto 0) <= \^gtwiz_userdata_rx_out\(31 downto 0);
  rx_resetdone_out <= \^rx_resetdone_out\;
  rxbyterealign_out(0) <= \^rxbyterealign_out\(0);
  rxctrl0_out(3 downto 0) <= \^rxctrl0_out\(3 downto 0);
  tx_resetdone_out <= \^tx_resetdone_out\;
bufg_gt_clr_out_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => gt_txpmaresetdone_int,
      O => bufg_gt_clr_out
    );
dnpcie_aurora_2_sim_gt_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_gt
     port map (
      cplllock_out(0) => tx_lock,
      drpaddr_in(8 downto 0) => gt0_drpaddr_in(8 downto 0),
      drpclk_in(0) => init_clk_in,
      drpdi_in(15 downto 0) => gt0_drpdi_in(15 downto 0),
      drpdo_out(15 downto 0) => gt0_drpdo_out(15 downto 0),
      drpen_in(0) => gt0_drpen_in,
      drprdy_out(0) => gt0_drprdy_out,
      drpwe_in(0) => gt0_drpwe_in,
      gthrxn_in(0) => rxn,
      gthrxp_in(0) => rxp,
      gthtxn_out(0) => txn,
      gthtxp_out(0) => txp,
      gtpowergood_out(0) => gt_powergood(0),
      gtrefclk0_in(0) => gt_refclk1,
      gtwiz_reset_all_in(0) => \out\,
      gtwiz_reset_clk_freerun_in(0) => init_clk_in,
      gtwiz_reset_rx_cdr_stable_out(0) => NLW_dnpcie_aurora_2_sim_gt_i_gtwiz_reset_rx_cdr_stable_out_UNCONNECTED(0),
      gtwiz_reset_rx_datapath_in(0) => rxfsm_soft_reset_r,
      gtwiz_reset_rx_done_out(0) => gtwiz_reset_rx_done_out,
      gtwiz_reset_rx_pll_and_datapath_in(0) => '0',
      gtwiz_reset_tx_datapath_in(0) => '0',
      gtwiz_reset_tx_done_out(0) => gtwiz_reset_tx_done_out,
      gtwiz_reset_tx_pll_and_datapath_in(0) => '0',
      gtwiz_userclk_rx_active_in(0) => gtwiz_userclk_rx_active_in,
      gtwiz_userclk_tx_active_in(0) => gtwiz_userclk_tx_active_in,
      gtwiz_userdata_rx_out(31 downto 0) => \^gtwiz_userdata_rx_out\(31 downto 0),
      gtwiz_userdata_tx_in(31 downto 0) => gtwiz_userdata_tx_in(31 downto 0),
      loopback_in(2 downto 0) => loopback(2 downto 0),
      rx8b10ben_in(0) => '1',
      rxbufreset_in(0) => '0',
      rxbufstatus_out(2) => rx_buf_err_i,
      rxbufstatus_out(1 downto 0) => NLW_dnpcie_aurora_2_sim_gt_i_rxbufstatus_out_UNCONNECTED(1 downto 0),
      rxbyteisaligned_out(0) => NLW_dnpcie_aurora_2_sim_gt_i_rxbyteisaligned_out_UNCONNECTED(0),
      rxbyterealign_out(0) => \^rxbyterealign_out\(0),
      rxclkcorcnt_out(1 downto 0) => NLW_dnpcie_aurora_2_sim_gt_i_rxclkcorcnt_out_UNCONNECTED(1 downto 0),
      rxcommadet_out(0) => NLW_dnpcie_aurora_2_sim_gt_i_rxcommadet_out_UNCONNECTED(0),
      rxcommadeten_in(0) => '1',
      rxctrl0_out(15 downto 4) => NLW_dnpcie_aurora_2_sim_gt_i_rxctrl0_out_UNCONNECTED(15 downto 4),
      rxctrl0_out(3 downto 0) => \^rxctrl0_out\(3 downto 0),
      rxctrl1_out(15 downto 4) => NLW_dnpcie_aurora_2_sim_gt_i_rxctrl1_out_UNCONNECTED(15 downto 4),
      rxctrl1_out(3 downto 0) => rx_disp_err_i(3 downto 0),
      rxctrl2_out(7 downto 4) => NLW_dnpcie_aurora_2_sim_gt_i_rxctrl2_out_UNCONNECTED(7 downto 4),
      rxctrl2_out(3 downto 0) => rxctrl2_out(3 downto 0),
      rxctrl3_out(7 downto 4) => NLW_dnpcie_aurora_2_sim_gt_i_rxctrl3_out_UNCONNECTED(7 downto 4),
      rxctrl3_out(3 downto 0) => rx_not_in_table_i(3 downto 0),
      rxmcommaalignen_in(0) => ena_comma_align_i,
      rxoutclk_out(0) => NLW_dnpcie_aurora_2_sim_gt_i_rxoutclk_out_UNCONNECTED(0),
      rxpcommaalignen_in(0) => ena_comma_align_i,
      rxpd_in(1) => power_down,
      rxpd_in(0) => power_down,
      rxpmaresetdone_out(0) => dnpcie_aurora_2_sim_gt_i_n_113,
      rxpolarity_in(0) => rxpolarity_in(0),
      rxresetdone_out(0) => NLW_dnpcie_aurora_2_sim_gt_i_rxresetdone_out_UNCONNECTED(0),
      rxusrclk2_in(0) => user_clk,
      rxusrclk_in(0) => sync_clk,
      tx8b10ben_in(0) => '1',
      txbufstatus_out(1) => tx_buf_err_i,
      txbufstatus_out(0) => NLW_dnpcie_aurora_2_sim_gt_i_txbufstatus_out_UNCONNECTED(0),
      txctrl0_in(15 downto 0) => B"0000000000000000",
      txctrl1_in(15 downto 0) => B"0000000000000000",
      txctrl2_in(7 downto 4) => B"0000",
      txctrl2_in(3 downto 0) => txctrl2_in(3 downto 0),
      txdetectrx_in(0) => power_down,
      txelecidle_in(0) => power_down,
      txoutclk_out(0) => tx_out_clk,
      txpd_in(1) => power_down,
      txpd_in(0) => power_down,
      txpmaresetdone_out(0) => gt_txpmaresetdone_int,
      txresetdone_out(0) => NLW_dnpcie_aurora_2_sim_gt_i_txresetdone_out_UNCONNECTED(0),
      txusrclk2_in(0) => user_clk,
      txusrclk_in(0) => sync_clk
    );
gt_rxresetdone_r2_reg_srl2: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => gtwiz_reset_rx_done_out,
      Q => gt_rxresetdone_r2_reg_srl2_n_0
    );
gt_rxresetdone_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gt_rxresetdone_r2_reg_srl2_n_0,
      Q => \^rx_resetdone_out\,
      R => '0'
    );
gt_rxresetdone_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^rx_resetdone_out\,
      O => gt_rxresetdone_r2_reg
    );
gt_txresetdone_r2_reg_srl2: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => user_clk,
      D => gtwiz_reset_tx_done_out,
      Q => gt_txresetdone_r2_reg_srl2_n_0
    );
gt_txresetdone_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gt_txresetdone_r2_reg_srl2_n_0,
      Q => \^tx_resetdone_out\,
      R => '0'
    );
gt_txresetdone_r_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^tx_resetdone_out\,
      O => gt_txresetdone_r2_reg
    );
gtrxreset_cdc_sync: entity work.\dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync__parameterized0\
     port map (
      gtrxreset_i => gtrxreset_i,
      init_clk_in => init_clk_in,
      \out\ => gtrxreset_sync,
      user_clk => user_clk
    );
gtrxreset_pulse_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => gtrxreset_r2,
      I1 => gtrxreset_r3,
      O => gtrxreset_pulse_i_1_n_0
    );
gtrxreset_pulse_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_pulse_i_1_n_0,
      Q => gtrxreset_pulse,
      R => '0'
    );
gtrxreset_r1_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_sync,
      Q => gtrxreset_r1,
      R => '0'
    );
gtrxreset_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_r1,
      Q => gtrxreset_r2,
      R => '0'
    );
gtrxreset_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => gtrxreset_r2,
      Q => gtrxreset_r3,
      R => '0'
    );
\gtwiz_userclk_rx_active_in_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userclk_tx_active_in_t,
      Q => gtwiz_userclk_rx_active_in,
      R => '0'
    );
\gtwiz_userclk_tx_active_in[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => pll_not_locked,
      O => gtwiz_userclk_tx_active_in_t
    );
\gtwiz_userclk_tx_active_in_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => user_clk,
      CE => '1',
      D => gtwiz_userclk_tx_active_in_t,
      Q => gtwiz_userclk_tx_active_in,
      R => '0'
    );
hard_err_gt_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => rx_buf_err_i,
      I1 => tx_buf_err_i,
      I2 => \^rxbyterealign_out\(0),
      O => hard_err_gt0
    );
\left_align_select_r[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11410154"
    )
        port map (
      I0 => ready_r_reg,
      I1 => \^rxctrl0_out\(0),
      I2 => \^rxctrl0_out\(1),
      I3 => \^rxctrl0_out\(3),
      I4 => \^rxctrl0_out\(2),
      O => E(0)
    );
\left_align_select_r[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^rxctrl0_out\(2),
      I1 => \^rxctrl0_out\(3),
      O => \left_align_select_r_reg[0]\(1)
    );
\left_align_select_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => \^rxctrl0_out\(3),
      I1 => \^rxctrl0_out\(2),
      I2 => \^rxctrl0_out\(1),
      O => \left_align_select_r_reg[0]\(0)
    );
link_reset_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => link_reset_r,
      Q => link_reset_r2,
      R => '0'
    );
reset_count_r_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => rx_disp_err_i(3),
      I1 => rx_not_in_table_i(3),
      I2 => rx_not_in_table_i(1),
      I3 => rx_disp_err_i(1),
      I4 => rx_disp_err_i(0),
      I5 => rx_disp_err_i(2),
      O => reset_count_r_reg_0
    );
reset_count_r_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => rx_not_in_table_i(2),
      I1 => rx_not_in_table_i(0),
      I2 => consecutive_commas_r,
      I3 => begin_r,
      O => reset_count_r_reg
    );
rxfsm_soft_reset_r_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => link_reset_r2,
      I1 => gtrxreset_pulse,
      O => rxfsm_soft_reset_r_i_1_n_0
    );
rxfsm_soft_reset_r_reg: unisim.vcomponents.FDRE
     port map (
      C => init_clk_in,
      CE => '1',
      D => rxfsm_soft_reset_r_i_1_n_0,
      Q => rxfsm_soft_reset_r,
      R => '0'
    );
\soft_err_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => enable_err_detect_i,
      I1 => rx_disp_err_i(0),
      I2 => rx_not_in_table_i(0),
      O => \soft_err_r_reg[0]\(3)
    );
\soft_err_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => rx_disp_err_i(1),
      I1 => rx_not_in_table_i(1),
      I2 => enable_err_detect_i,
      O => \soft_err_r_reg[0]\(2)
    );
\soft_err_r[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => enable_err_detect_i,
      I1 => rx_disp_err_i(2),
      I2 => rx_not_in_table_i(2),
      O => \soft_err_r_reg[0]\(1)
    );
\soft_err_r[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => enable_err_detect_i,
      I1 => rx_disp_err_i(3),
      I2 => rx_not_in_table_i(3),
      O => \soft_err_r_reg[0]\(0)
    );
\word_aligned_control_bits_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \^rxctrl0_out\(2),
      I1 => \previous_cycle_control_r_reg[0]\(0),
      I2 => \^rxctrl0_out\(1),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^rxctrl0_out\(0),
      O => \word_aligned_control_bits_r_reg[2]\
    );
\word_aligned_control_bits_r[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => \^rxctrl0_out\(0),
      I1 => \^rxctrl0_out\(1),
      I2 => \^rxctrl0_out\(3),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^rxctrl0_out\(2),
      O => \word_aligned_control_bits_r_reg[3]\
    );
\word_aligned_data_r[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(22),
      I1 => \previous_cycle_data_r_reg[6]\(3),
      I2 => \^gtwiz_userdata_rx_out\(14),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^gtwiz_userdata_rx_out\(6),
      O => \word_aligned_data_r_reg[17]\(3)
    );
\word_aligned_data_r[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(19),
      I1 => \previous_cycle_data_r_reg[6]\(2),
      I2 => \^gtwiz_userdata_rx_out\(11),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^gtwiz_userdata_rx_out\(3),
      O => \word_aligned_data_r_reg[17]\(2)
    );
\word_aligned_data_r[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(18),
      I1 => \previous_cycle_data_r_reg[6]\(1),
      I2 => \^gtwiz_userdata_rx_out\(10),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^gtwiz_userdata_rx_out\(2),
      O => \word_aligned_data_r_reg[17]\(1)
    );
\word_aligned_data_r[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(17),
      I1 => \previous_cycle_data_r_reg[6]\(0),
      I2 => \^gtwiz_userdata_rx_out\(1),
      I3 => Q(1),
      I4 => Q(0),
      I5 => \^gtwiz_userdata_rx_out\(9),
      O => \word_aligned_data_r_reg[17]\(0)
    );
\word_aligned_data_r[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(7),
      I1 => \^gtwiz_userdata_rx_out\(15),
      I2 => \^gtwiz_userdata_rx_out\(31),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^gtwiz_userdata_rx_out\(23),
      O => \word_aligned_data_r_reg[24]\(7)
    );
\word_aligned_data_r[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(30),
      I1 => \^gtwiz_userdata_rx_out\(6),
      I2 => \^gtwiz_userdata_rx_out\(22),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^gtwiz_userdata_rx_out\(14),
      O => \word_aligned_data_r_reg[24]\(6)
    );
\word_aligned_data_r[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(29),
      I1 => \^gtwiz_userdata_rx_out\(5),
      I2 => \^gtwiz_userdata_rx_out\(13),
      I3 => Q(1),
      I4 => Q(0),
      I5 => \^gtwiz_userdata_rx_out\(21),
      O => \word_aligned_data_r_reg[24]\(5)
    );
\word_aligned_data_r[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCAAF000CCAAF0"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(4),
      I1 => \^gtwiz_userdata_rx_out\(12),
      I2 => \^gtwiz_userdata_rx_out\(28),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^gtwiz_userdata_rx_out\(20),
      O => \word_aligned_data_r_reg[24]\(4)
    );
\word_aligned_data_r[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(27),
      I1 => \^gtwiz_userdata_rx_out\(3),
      I2 => \^gtwiz_userdata_rx_out\(19),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^gtwiz_userdata_rx_out\(11),
      O => \word_aligned_data_r_reg[24]\(3)
    );
\word_aligned_data_r[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFCCAAF000CCAA"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(26),
      I1 => \^gtwiz_userdata_rx_out\(2),
      I2 => \^gtwiz_userdata_rx_out\(18),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^gtwiz_userdata_rx_out\(10),
      O => \word_aligned_data_r_reg[24]\(2)
    );
\word_aligned_data_r[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCCF0AA00CCF0AA"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(25),
      I1 => \^gtwiz_userdata_rx_out\(1),
      I2 => \^gtwiz_userdata_rx_out\(9),
      I3 => Q(1),
      I4 => Q(0),
      I5 => \^gtwiz_userdata_rx_out\(17),
      O => \word_aligned_data_r_reg[24]\(1)
    );
\word_aligned_data_r[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCFFAAF0CC00AAF0"
    )
        port map (
      I0 => \^gtwiz_userdata_rx_out\(0),
      I1 => \^gtwiz_userdata_rx_out\(16),
      I2 => \^gtwiz_userdata_rx_out\(24),
      I3 => Q(0),
      I4 => Q(1),
      I5 => \^gtwiz_userdata_rx_out\(8),
      O => \word_aligned_data_r_reg[24]\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_core is
  port (
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 31 );
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 3 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 31 );
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 0 to 3 );
    m_axi_rx_tvalid : out STD_LOGIC;
    m_axi_rx_tlast : out STD_LOGIC;
    s_axi_nfc_req : in STD_LOGIC;
    s_axi_nfc_nb : in STD_LOGIC_VECTOR ( 0 to 3 );
    s_axi_nfc_ack : out STD_LOGIC;
    m_axi_rx_snf : out STD_LOGIC;
    m_axi_rx_fc_nb : out STD_LOGIC_VECTOR ( 0 to 3 );
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    hard_err : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    frame_err : out STD_LOGIC;
    channel_up : out STD_LOGIC;
    lane_up : out STD_LOGIC;
    user_clk : in STD_LOGIC;
    sync_clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt_reset : in STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    pll_not_locked : in STD_LOGIC;
    tx_resetdone_out : out STD_LOGIC;
    rx_resetdone_out : out STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drprdy_out : out STD_LOGIC;
    gt0_drpwe_in : in STD_LOGIC;
    tx_out_clk : out STD_LOGIC;
    gt_powergood : out STD_LOGIC_VECTOR ( 0 to 0 );
    bufg_gt_clr_out : out STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    tx_lock : out STD_LOGIC
  );
  attribute CC_FREQ_FACTOR : string;
  attribute CC_FREQ_FACTOR of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_core : entity is "5'b01100";
  attribute EXAMPLE_SIMULATION : integer;
  attribute EXAMPLE_SIMULATION of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_core : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_core : entity is "dnpcie_aurora_2_sim_core";
end dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_core;

architecture STRUCTURE of dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_core is
  signal \<const1>\ : STD_LOGIC;
  signal axi_to_ll_pdu_i_n_0 : STD_LOGIC;
  signal \^channel_up\ : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_16 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_17 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_18 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_19 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_21 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_22 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_23 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_24 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_25 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_26 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_27 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_29 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_32 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_33 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_34 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_35 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_36 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_37 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_38 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_39 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_40 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_41 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_46 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_79 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_80 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_81 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_82 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_83 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_84 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_85 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_86 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_87 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_88 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_89 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_90 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_91 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_92 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_93 : STD_LOGIC;
  signal dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_94 : STD_LOGIC;
  signal \dnpcie_aurora_2_sim_err_detect_4byte_i/hard_err_gt0\ : STD_LOGIC;
  signal \dnpcie_aurora_2_sim_err_detect_4byte_i/p_6_out\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \dnpcie_aurora_2_sim_lane_init_sm_4byte_i/begin_r\ : STD_LOGIC;
  signal \dnpcie_aurora_2_sim_lane_init_sm_4byte_i/consecutive_commas_r\ : STD_LOGIC;
  signal \dnpcie_aurora_2_sim_sym_dec_4byte_i/left_align_select_r\ : STD_LOGIC;
  signal \dnpcie_aurora_2_sim_sym_dec_4byte_i/previous_cycle_control_r\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal do_cc_i : STD_LOGIC;
  signal ena_comma_align_i : STD_LOGIC;
  signal enable_err_detect_i : STD_LOGIC;
  signal fc_nb_striped_i : STD_LOGIC_VECTOR ( 0 to 3 );
  signal gen_a_i : STD_LOGIC;
  signal gen_cc_i : STD_LOGIC;
  signal gen_ecp_i : STD_LOGIC;
  signal gen_k_i : STD_LOGIC_VECTOR ( 0 to 3 );
  signal gen_pad_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal gen_r_i : STD_LOGIC_VECTOR ( 0 to 3 );
  signal gen_scp_striped_i : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gen_snf_striped_i : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gen_v_i : STD_LOGIC_VECTOR ( 1 to 3 );
  signal got_v_i : STD_LOGIC;
  signal gt_reset_sync_init_clk : STD_LOGIC;
  signal gt_wrapper_i_n_65 : STD_LOGIC;
  signal gt_wrapper_i_n_66 : STD_LOGIC;
  signal gt_wrapper_i_n_68 : STD_LOGIC;
  signal gt_wrapper_i_n_72 : STD_LOGIC;
  signal gt_wrapper_i_n_73 : STD_LOGIC;
  signal gt_wrapper_i_n_74 : STD_LOGIC;
  signal gt_wrapper_i_n_75 : STD_LOGIC;
  signal gt_wrapper_i_n_76 : STD_LOGIC;
  signal gt_wrapper_i_n_77 : STD_LOGIC;
  signal gt_wrapper_i_n_78 : STD_LOGIC;
  signal gt_wrapper_i_n_79 : STD_LOGIC;
  signal gt_wrapper_i_n_80 : STD_LOGIC;
  signal gt_wrapper_i_n_81 : STD_LOGIC;
  signal gt_wrapper_i_n_82 : STD_LOGIC;
  signal gt_wrapper_i_n_83 : STD_LOGIC;
  signal gt_wrapper_i_n_84 : STD_LOGIC;
  signal gt_wrapper_i_n_85 : STD_LOGIC;
  signal gt_wrapper_i_n_86 : STD_LOGIC;
  signal gt_wrapper_i_n_87 : STD_LOGIC;
  signal gt_wrapper_i_n_90 : STD_LOGIC;
  signal gt_wrapper_i_n_91 : STD_LOGIC;
  signal gtrxreset_i : STD_LOGIC;
  signal hard_err_i : STD_LOGIC;
  signal \^lane_up\ : STD_LOGIC;
  signal \^link_reset_out\ : STD_LOGIC;
  signal link_reset_r : STD_LOGIC;
  signal \^m_axi_rx_fc_nb\ : STD_LOGIC_VECTOR ( 0 to 3 );
  signal \^m_axi_rx_tkeep\ : STD_LOGIC_VECTOR ( 1 to 3 );
  signal new_pkt_r : STD_LOGIC;
  signal \nfc_module_i/nfc_counter_r_reg\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal p_0_in : STD_LOGIC;
  signal reset_lanes_i : STD_LOGIC;
  signal reset_sync_user_clk : STD_LOGIC;
  signal rx_char_is_comma_i : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rx_char_is_k_i : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rx_data_i : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rx_ecp_striped_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal rx_eof : STD_LOGIC;
  signal \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/after_scp_select_c_0\ : STD_LOGIC;
  signal \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/after_scp_select_c_1\ : STD_LOGIC;
  signal rx_ll_rst : STD_LOGIC;
  signal rx_pe_data_v_striped_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal rx_polarity_i : STD_LOGIC;
  signal rx_realign_i : STD_LOGIC;
  signal rx_rem_int : STD_LOGIC_VECTOR ( 0 to 1 );
  signal rx_scp_striped_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal rx_snf_striped_i : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_nfc_ack\ : STD_LOGIC;
  signal soft_err_i : STD_LOGIC_VECTOR ( 0 to 1 );
  signal standard_cc_module_i_n_0 : STD_LOGIC;
  signal start_rx_i : STD_LOGIC;
  signal \^sys_reset_out\ : STD_LOGIC;
  signal tx_char_is_k_i : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal tx_data_i : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal tx_dst_rdy : STD_LOGIC;
  signal \tx_ll_control_i/do_cc_r\ : STD_LOGIC;
  signal \tx_ll_control_i/do_nfc_r\ : STD_LOGIC;
  signal \^tx_lock\ : STD_LOGIC;
  signal tx_pe_data_i : STD_LOGIC_VECTOR ( 0 to 31 );
  signal tx_pe_data_v_i : STD_LOGIC_VECTOR ( 0 to 1 );
begin
  channel_up <= \^channel_up\;
  lane_up <= \^lane_up\;
  link_reset_out <= \^link_reset_out\;
  m_axi_rx_fc_nb(0 to 3) <= \^m_axi_rx_fc_nb\(0 to 3);
  m_axi_rx_tkeep(0) <= \<const1>\;
  m_axi_rx_tkeep(1 to 3) <= \^m_axi_rx_tkeep\(1 to 3);
  s_axi_nfc_ack <= \^s_axi_nfc_ack\;
  sys_reset_out <= \^sys_reset_out\;
  tx_lock <= \^tx_lock\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
axi_to_ll_pdu_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_AXI_TO_LL
     port map (
      new_pkt_r => new_pkt_r,
      \tx_pe_data_v_r_reg[1]\ => axi_to_ll_pdu_i_n_0,
      user_clk => user_clk
    );
core_reset_logic_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RESET_LOGIC
     port map (
      channel_up => \^channel_up\,
      gt_rxresetdone_r3_reg_0 => gt_wrapper_i_n_91,
      gt_txresetdone_r3_reg_0 => gt_wrapper_i_n_90,
      init_clk_in => init_clk_in,
      link_reset_out => \^link_reset_out\,
      link_reset_r => link_reset_r,
      new_pkt_r => new_pkt_r,
      new_pkt_r_reg => axi_to_ll_pdu_i_n_0,
      \out\ => reset_sync_user_clk,
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      sys_reset_out => \^sys_reset_out\,
      tx_dst_rdy => tx_dst_rdy,
      tx_lock => \^tx_lock\,
      user_clk => user_clk
    );
dnpcie_aurora_2_sim_aurora_lane_4byte_0_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_AURORA_LANE_4BYTE
     port map (
      D(3 downto 0) => rx_char_is_comma_i(3 downto 0),
      \DEFRAMED_DATA_V_reg[0]\(1) => rx_pe_data_v_striped_i(0),
      \DEFRAMED_DATA_V_reg[0]\(0) => rx_pe_data_v_striped_i(1),
      E(0) => \dnpcie_aurora_2_sim_sym_dec_4byte_i/left_align_select_r\,
      ENABLE_ERR_DETECT_reg(3) => \dnpcie_aurora_2_sim_err_detect_4byte_i/p_6_out\(3),
      ENABLE_ERR_DETECT_reg(2) => gt_wrapper_i_n_68,
      ENABLE_ERR_DETECT_reg(1 downto 0) => \dnpcie_aurora_2_sim_err_detect_4byte_i/p_6_out\(1 downto 0),
      \FC_NB_reg[0]\(3) => fc_nb_striped_i(0),
      \FC_NB_reg[0]\(2) => fc_nb_striped_i(1),
      \FC_NB_reg[0]\(1) => fc_nb_striped_i(2),
      \FC_NB_reg[0]\(0) => fc_nb_striped_i(3),
      \GEN_PAD_reg[0]\(1) => gen_pad_i(0),
      \GEN_PAD_reg[0]\(0) => gen_pad_i(1),
      \IN_FRAME_reg[1]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_46,
      Q(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_22,
      Q(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_23,
      SR(0) => reset_lanes_i,
      \TX_PE_DATA_V_reg[0]\(1) => tx_pe_data_v_i(0),
      \TX_PE_DATA_V_reg[0]\(0) => tx_pe_data_v_i(1),
      \TX_PE_DATA_reg[0]\(31) => tx_pe_data_i(0),
      \TX_PE_DATA_reg[0]\(30) => tx_pe_data_i(1),
      \TX_PE_DATA_reg[0]\(29) => tx_pe_data_i(2),
      \TX_PE_DATA_reg[0]\(28) => tx_pe_data_i(3),
      \TX_PE_DATA_reg[0]\(27) => tx_pe_data_i(4),
      \TX_PE_DATA_reg[0]\(26) => tx_pe_data_i(5),
      \TX_PE_DATA_reg[0]\(25) => tx_pe_data_i(6),
      \TX_PE_DATA_reg[0]\(24) => tx_pe_data_i(7),
      \TX_PE_DATA_reg[0]\(23) => tx_pe_data_i(8),
      \TX_PE_DATA_reg[0]\(22) => tx_pe_data_i(9),
      \TX_PE_DATA_reg[0]\(21) => tx_pe_data_i(10),
      \TX_PE_DATA_reg[0]\(20) => tx_pe_data_i(11),
      \TX_PE_DATA_reg[0]\(19) => tx_pe_data_i(12),
      \TX_PE_DATA_reg[0]\(18) => tx_pe_data_i(13),
      \TX_PE_DATA_reg[0]\(17) => tx_pe_data_i(14),
      \TX_PE_DATA_reg[0]\(16) => tx_pe_data_i(15),
      \TX_PE_DATA_reg[0]\(15) => tx_pe_data_i(16),
      \TX_PE_DATA_reg[0]\(14) => tx_pe_data_i(17),
      \TX_PE_DATA_reg[0]\(13) => tx_pe_data_i(18),
      \TX_PE_DATA_reg[0]\(12) => tx_pe_data_i(19),
      \TX_PE_DATA_reg[0]\(11) => tx_pe_data_i(20),
      \TX_PE_DATA_reg[0]\(10) => tx_pe_data_i(21),
      \TX_PE_DATA_reg[0]\(9) => tx_pe_data_i(22),
      \TX_PE_DATA_reg[0]\(8) => tx_pe_data_i(23),
      \TX_PE_DATA_reg[0]\(7) => tx_pe_data_i(24),
      \TX_PE_DATA_reg[0]\(6) => tx_pe_data_i(25),
      \TX_PE_DATA_reg[0]\(5) => tx_pe_data_i(26),
      \TX_PE_DATA_reg[0]\(4) => tx_pe_data_i(27),
      \TX_PE_DATA_reg[0]\(3) => tx_pe_data_i(28),
      \TX_PE_DATA_reg[0]\(2) => tx_pe_data_i(29),
      \TX_PE_DATA_reg[0]\(1) => tx_pe_data_i(30),
      \TX_PE_DATA_reg[0]\(0) => tx_pe_data_i(31),
      after_scp_select_c_0 => \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/after_scp_select_c_0\,
      after_scp_select_c_1 => \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/after_scp_select_c_1\,
      begin_r => \dnpcie_aurora_2_sim_lane_init_sm_4byte_i/begin_r\,
      \channel_fcnb_r_reg[4]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_19,
      \channel_fcnb_r_reg[5]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_18,
      \channel_fcnb_r_reg[6]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_17,
      \channel_fcnb_r_reg[7]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_16,
      consecutive_commas_r => \dnpcie_aurora_2_sim_lane_init_sm_4byte_i/consecutive_commas_r\,
      consecutive_commas_r_reg => gt_wrapper_i_n_65,
      ena_comma_align_i => ena_comma_align_i,
      enable_err_detect_i => enable_err_detect_i,
      gen_a_i => gen_a_i,
      gen_cc_i => gen_cc_i,
      gen_ecp_i => gen_ecp_i,
      gen_k_flop_0_i(3) => gen_k_i(0),
      gen_k_flop_0_i(2) => gen_k_i(1),
      gen_k_flop_0_i(1) => gen_k_i(2),
      gen_k_flop_0_i(0) => gen_k_i(3),
      gen_r_flop_0_i(3) => gen_r_i(0),
      gen_r_flop_0_i(2) => gen_r_i(1),
      gen_r_flop_0_i(1) => gen_r_i(2),
      gen_r_flop_0_i(0) => gen_r_i(3),
      gen_scp_striped_i(0) => gen_scp_striped_i(0),
      gen_snf_striped_i(0) => gen_snf_striped_i(0),
      gen_v_flop_1_i(2) => gen_v_i(1),
      gen_v_flop_1_i(1) => gen_v_i(2),
      gen_v_flop_1_i(0) => gen_v_i(3),
      got_v_i => got_v_i,
      gtrxreset_out_reg => gt_wrapper_i_n_66,
      gtrxreset_out_reg_0(1) => gt_wrapper_i_n_72,
      gtrxreset_out_reg_0(0) => gt_wrapper_i_n_73,
      gtwiz_userdata_rx_out(31 downto 0) => rx_data_i(31 downto 0),
      gtwiz_userdata_tx_in(31 downto 0) => tx_data_i(31 downto 0),
      hard_err_gt0 => \dnpcie_aurora_2_sim_err_detect_4byte_i/hard_err_gt0\,
      hard_err_i => hard_err_i,
      in_frame_r_reg => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_41,
      init_clk_in => init_clk_in,
      lane_up => \^lane_up\,
      \left_align_select_r_reg[1]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_21,
      \left_align_select_r_reg[1]_0\ => gt_wrapper_i_n_87,
      \left_align_select_r_reg[1]_1\(7) => gt_wrapper_i_n_78,
      \left_align_select_r_reg[1]_1\(6) => gt_wrapper_i_n_79,
      \left_align_select_r_reg[1]_1\(5) => gt_wrapper_i_n_80,
      \left_align_select_r_reg[1]_1\(4) => gt_wrapper_i_n_81,
      \left_align_select_r_reg[1]_1\(3) => gt_wrapper_i_n_82,
      \left_align_select_r_reg[1]_1\(2) => gt_wrapper_i_n_83,
      \left_align_select_r_reg[1]_1\(1) => gt_wrapper_i_n_84,
      \left_align_select_r_reg[1]_1\(0) => gt_wrapper_i_n_85,
      link_reset_out => \^link_reset_out\,
      m_axi_nfc_rx_tvalid(1) => m_axi_rx_snf,
      m_axi_nfc_rx_tvalid(0) => rx_snf_striped_i(1),
      m_axi_rx_fc_nb(0 to 3) => \^m_axi_rx_fc_nb\(0 to 3),
      \previous_cycle_control_r_reg[0]\ => gt_wrapper_i_n_86,
      \previous_cycle_data_r_reg[6]\(3) => gt_wrapper_i_n_74,
      \previous_cycle_data_r_reg[6]\(2) => gt_wrapper_i_n_75,
      \previous_cycle_data_r_reg[6]\(1) => gt_wrapper_i_n_76,
      \previous_cycle_data_r_reg[6]\(0) => gt_wrapper_i_n_77,
      \rx_ecp_d_r_reg[7]\(3) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_79,
      \rx_ecp_d_r_reg[7]\(2) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_80,
      \rx_ecp_d_r_reg[7]\(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_81,
      \rx_ecp_d_r_reg[7]\(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_82,
      \rx_snf_d_r_reg[0]\(7) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_87,
      \rx_snf_d_r_reg[0]\(6) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_88,
      \rx_snf_d_r_reg[0]\(5) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_89,
      \rx_snf_d_r_reg[0]\(4) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_90,
      \rx_snf_d_r_reg[0]\(3) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_91,
      \rx_snf_d_r_reg[0]\(2) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_92,
      \rx_snf_d_r_reg[0]\(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_93,
      \rx_snf_d_r_reg[0]\(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_94,
      \rx_sp_neg_d_r_reg[1]\(3) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_83,
      \rx_sp_neg_d_r_reg[1]\(2) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_84,
      \rx_sp_neg_d_r_reg[1]\(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_85,
      \rx_sp_neg_d_r_reg[1]\(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_86,
      \rx_spa_r_reg[4]\(7) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_33,
      \rx_spa_r_reg[4]\(6) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_34,
      \rx_spa_r_reg[4]\(5) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_35,
      \rx_spa_r_reg[4]\(4) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_36,
      \rx_spa_r_reg[4]\(3) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_37,
      \rx_spa_r_reg[4]\(2) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_38,
      \rx_spa_r_reg[4]\(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_39,
      \rx_spa_r_reg[4]\(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_40,
      rxbyterealign_out(0) => rx_realign_i,
      rxctrl0_out(3 downto 0) => rx_char_is_k_i(3 downto 0),
      rxpolarity_in(0) => rx_polarity_i,
      \soft_err_r_reg[0]\(1) => soft_err_i(0),
      \soft_err_r_reg[0]\(0) => soft_err_i(1),
      \stage_1_ecp_r_reg[0]\(1) => rx_ecp_striped_i(0),
      \stage_1_ecp_r_reg[0]\(0) => rx_ecp_striped_i(1),
      stage_1_load_nfc_r_reg => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_29,
      stage_1_pad_r_reg => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_32,
      \stage_1_scp_r_reg[0]\(1) => rx_scp_striped_i(0),
      \stage_1_scp_r_reg[0]\(0) => rx_scp_striped_i(1),
      txctrl2_in(3 downto 0) => tx_char_is_k_i(3 downto 0),
      user_clk => user_clk,
      \word_aligned_control_bits_r_reg[1]\(0) => \dnpcie_aurora_2_sim_sym_dec_4byte_i/previous_cycle_control_r\(0),
      \word_aligned_data_r_reg[9]\(3) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_24,
      \word_aligned_data_r_reg[9]\(2) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_25,
      \word_aligned_data_r_reg[9]\(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_26,
      \word_aligned_data_r_reg[9]\(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_27
    );
dnpcie_aurora_2_sim_global_logic_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_GLOBAL_LOGIC
     port map (
      D(1) => soft_err_i(0),
      D(0) => soft_err_i(1),
      SR(0) => reset_lanes_i,
      SS(0) => rx_ll_rst,
      SYSTEM_RESET_reg => \^sys_reset_out\,
      channel_up => \^channel_up\,
      gen_a_i => gen_a_i,
      \gen_k_r_reg[0]\(3) => gen_k_i(0),
      \gen_k_r_reg[0]\(2) => gen_k_i(1),
      \gen_k_r_reg[0]\(1) => gen_k_i(2),
      \gen_k_r_reg[0]\(0) => gen_k_i(3),
      \gen_r_r_reg[0]\(3) => gen_r_i(0),
      \gen_r_r_reg[0]\(2) => gen_r_i(1),
      \gen_r_r_reg[0]\(1) => gen_r_i(2),
      \gen_r_r_reg[0]\(0) => gen_r_i(3),
      \gen_v_r_reg[1]\(2) => gen_v_i(1),
      \gen_v_r_reg[1]\(1) => gen_v_i(2),
      \gen_v_r_reg[1]\(0) => gen_v_i(3),
      got_v_i => got_v_i,
      gtrxreset_i => gtrxreset_i,
      hard_err => hard_err,
      hard_err_i => hard_err_i,
      lane_up => \^lane_up\,
      p_0_in => p_0_in,
      power_down => power_down,
      soft_err => soft_err,
      start_rx_i => start_rx_i,
      user_clk => user_clk
    );
dnpcie_aurora_2_sim_rx_ll_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_RX_LL
     port map (
      D(1) => rx_scp_striped_i(0),
      D(0) => rx_scp_striped_i(1),
      Q(0) => \nfc_module_i/nfc_counter_r_reg\(0),
      \RX_ECP_reg[0]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_46,
      \RX_ECP_reg[0]_0\(1) => rx_ecp_striped_i(0),
      \RX_ECP_reg[0]_0\(0) => rx_ecp_striped_i(1),
      \RX_ECP_reg[1]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_41,
      \RX_PAD_reg[1]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_32,
      \RX_PE_DATA_V_reg[0]\(1) => rx_pe_data_v_striped_i(0),
      \RX_PE_DATA_V_reg[0]\(0) => rx_pe_data_v_striped_i(1),
      \RX_SNF_reg[0]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_29,
      \RX_SNF_reg[1]\(0) => rx_snf_striped_i(1),
      SS(0) => rx_ll_rst,
      after_scp_select_c_0 => \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/after_scp_select_c_0\,
      after_scp_select_c_1 => \rx_ll_pdu_datapath_i/stage_1_rx_ll_deframer_i/after_scp_select_c_1\,
      do_cc_r => \tx_ll_control_i/do_cc_r\,
      frame_err => frame_err,
      m_axi_rx_fc_nb(0 to 3) => \^m_axi_rx_fc_nb\(0 to 3),
      m_axi_rx_tdata(0 to 31) => m_axi_rx_tdata(0 to 31),
      \m_axi_rx_tkeep[2]\(1) => rx_rem_int(0),
      \m_axi_rx_tkeep[2]\(0) => rx_rem_int(1),
      m_axi_rx_tlast => m_axi_rx_tlast,
      m_axi_rx_tvalid => m_axi_rx_tvalid,
      rx_eof => rx_eof,
      start_rx_i => start_rx_i,
      tx_dst_rdy => tx_dst_rdy,
      user_clk => user_clk,
      \word_aligned_data_r_reg[0]\(7) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_87,
      \word_aligned_data_r_reg[0]\(6) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_88,
      \word_aligned_data_r_reg[0]\(5) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_89,
      \word_aligned_data_r_reg[0]\(4) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_90,
      \word_aligned_data_r_reg[0]\(3) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_91,
      \word_aligned_data_r_reg[0]\(2) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_92,
      \word_aligned_data_r_reg[0]\(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_93,
      \word_aligned_data_r_reg[0]\(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_94,
      \word_aligned_data_r_reg[12]\(3) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_83,
      \word_aligned_data_r_reg[12]\(2) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_84,
      \word_aligned_data_r_reg[12]\(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_85,
      \word_aligned_data_r_reg[12]\(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_86,
      \word_aligned_data_r_reg[16]\(7) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_33,
      \word_aligned_data_r_reg[16]\(6) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_34,
      \word_aligned_data_r_reg[16]\(5) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_35,
      \word_aligned_data_r_reg[16]\(4) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_36,
      \word_aligned_data_r_reg[16]\(3) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_37,
      \word_aligned_data_r_reg[16]\(2) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_38,
      \word_aligned_data_r_reg[16]\(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_39,
      \word_aligned_data_r_reg[16]\(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_40,
      \word_aligned_data_r_reg[24]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_19,
      \word_aligned_data_r_reg[25]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_18,
      \word_aligned_data_r_reg[26]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_17,
      \word_aligned_data_r_reg[27]\ => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_16,
      \word_aligned_data_r_reg[28]\(3) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_79,
      \word_aligned_data_r_reg[28]\(2) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_80,
      \word_aligned_data_r_reg[28]\(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_81,
      \word_aligned_data_r_reg[28]\(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_82
    );
dnpcie_aurora_2_sim_tx_ll_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_TX_LL
     port map (
      Q => do_cc_i,
      do_cc_r => \tx_ll_control_i/do_cc_r\,
      do_nfc_r => \tx_ll_control_i/do_nfc_r\,
      do_nfc_r_reg => standard_cc_module_i_n_0,
      \fc_nb_r_reg[0]\(3) => fc_nb_striped_i(0),
      \fc_nb_r_reg[0]\(2) => fc_nb_striped_i(1),
      \fc_nb_r_reg[0]\(1) => fc_nb_striped_i(2),
      \fc_nb_r_reg[0]\(0) => fc_nb_striped_i(3),
      gen_cc_i => gen_cc_i,
      gen_ecp_i => gen_ecp_i,
      \gen_pad_r_reg[0]\(1) => gen_pad_i(0),
      \gen_pad_r_reg[0]\(0) => gen_pad_i(1),
      gen_scp_striped_i(0) => gen_scp_striped_i(0),
      gen_snf_striped_i(0) => gen_snf_striped_i(0),
      new_pkt_r_reg => axi_to_ll_pdu_i_n_0,
      p_0_in => p_0_in,
      s_axi_nfc_nb(0 to 3) => s_axi_nfc_nb(0 to 3),
      s_axi_nfc_tx_tready => \^s_axi_nfc_ack\,
      s_axi_tx_tdata(0 to 31) => s_axi_tx_tdata(0 to 31),
      s_axi_tx_tkeep(0 to 3) => s_axi_tx_tkeep(0 to 3),
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tready => s_axi_tx_tready,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      tx_dst_rdy => tx_dst_rdy,
      \tx_pe_data_r_reg[0]\(31) => tx_pe_data_i(0),
      \tx_pe_data_r_reg[0]\(30) => tx_pe_data_i(1),
      \tx_pe_data_r_reg[0]\(29) => tx_pe_data_i(2),
      \tx_pe_data_r_reg[0]\(28) => tx_pe_data_i(3),
      \tx_pe_data_r_reg[0]\(27) => tx_pe_data_i(4),
      \tx_pe_data_r_reg[0]\(26) => tx_pe_data_i(5),
      \tx_pe_data_r_reg[0]\(25) => tx_pe_data_i(6),
      \tx_pe_data_r_reg[0]\(24) => tx_pe_data_i(7),
      \tx_pe_data_r_reg[0]\(23) => tx_pe_data_i(8),
      \tx_pe_data_r_reg[0]\(22) => tx_pe_data_i(9),
      \tx_pe_data_r_reg[0]\(21) => tx_pe_data_i(10),
      \tx_pe_data_r_reg[0]\(20) => tx_pe_data_i(11),
      \tx_pe_data_r_reg[0]\(19) => tx_pe_data_i(12),
      \tx_pe_data_r_reg[0]\(18) => tx_pe_data_i(13),
      \tx_pe_data_r_reg[0]\(17) => tx_pe_data_i(14),
      \tx_pe_data_r_reg[0]\(16) => tx_pe_data_i(15),
      \tx_pe_data_r_reg[0]\(15) => tx_pe_data_i(16),
      \tx_pe_data_r_reg[0]\(14) => tx_pe_data_i(17),
      \tx_pe_data_r_reg[0]\(13) => tx_pe_data_i(18),
      \tx_pe_data_r_reg[0]\(12) => tx_pe_data_i(19),
      \tx_pe_data_r_reg[0]\(11) => tx_pe_data_i(20),
      \tx_pe_data_r_reg[0]\(10) => tx_pe_data_i(21),
      \tx_pe_data_r_reg[0]\(9) => tx_pe_data_i(22),
      \tx_pe_data_r_reg[0]\(8) => tx_pe_data_i(23),
      \tx_pe_data_r_reg[0]\(7) => tx_pe_data_i(24),
      \tx_pe_data_r_reg[0]\(6) => tx_pe_data_i(25),
      \tx_pe_data_r_reg[0]\(5) => tx_pe_data_i(26),
      \tx_pe_data_r_reg[0]\(4) => tx_pe_data_i(27),
      \tx_pe_data_r_reg[0]\(3) => tx_pe_data_i(28),
      \tx_pe_data_r_reg[0]\(2) => tx_pe_data_i(29),
      \tx_pe_data_r_reg[0]\(1) => tx_pe_data_i(30),
      \tx_pe_data_r_reg[0]\(0) => tx_pe_data_i(31),
      \tx_pe_data_v_r_reg[0]\(1) => tx_pe_data_v_i(0),
      \tx_pe_data_v_r_reg[0]\(0) => tx_pe_data_v_i(1),
      user_clk => user_clk
    );
gt_reset_cdc_sync: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync
     port map (
      gt_reset => gt_reset,
      init_clk_in => init_clk_in,
      \out\ => gt_reset_sync_init_clk
    );
gt_wrapper_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_GT_WRAPPER
     port map (
      E(0) => \dnpcie_aurora_2_sim_sym_dec_4byte_i/left_align_select_r\,
      Q(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_22,
      Q(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_23,
      begin_r => \dnpcie_aurora_2_sim_lane_init_sm_4byte_i/begin_r\,
      bufg_gt_clr_out => bufg_gt_clr_out,
      consecutive_commas_r => \dnpcie_aurora_2_sim_lane_init_sm_4byte_i/consecutive_commas_r\,
      ena_comma_align_i => ena_comma_align_i,
      enable_err_detect_i => enable_err_detect_i,
      gt0_drpaddr_in(8 downto 0) => gt0_drpaddr_in(8 downto 0),
      gt0_drpdi_in(15 downto 0) => gt0_drpdi_in(15 downto 0),
      gt0_drpdo_out(15 downto 0) => gt0_drpdo_out(15 downto 0),
      gt0_drpen_in => gt0_drpen_in,
      gt0_drprdy_out => gt0_drprdy_out,
      gt0_drpwe_in => gt0_drpwe_in,
      gt_powergood(0) => gt_powergood(0),
      gt_refclk1 => gt_refclk1,
      gt_rxresetdone_r2_reg => gt_wrapper_i_n_91,
      gt_txresetdone_r2_reg => gt_wrapper_i_n_90,
      gtrxreset_i => gtrxreset_i,
      gtwiz_userdata_rx_out(31 downto 0) => rx_data_i(31 downto 0),
      gtwiz_userdata_tx_in(31 downto 0) => tx_data_i(31 downto 0),
      hard_err_gt0 => \dnpcie_aurora_2_sim_err_detect_4byte_i/hard_err_gt0\,
      init_clk_in => init_clk_in,
      \left_align_select_r_reg[0]\(1) => gt_wrapper_i_n_72,
      \left_align_select_r_reg[0]\(0) => gt_wrapper_i_n_73,
      link_reset_r => link_reset_r,
      loopback(2 downto 0) => loopback(2 downto 0),
      \out\ => gt_reset_sync_init_clk,
      pll_not_locked => pll_not_locked,
      power_down => power_down,
      \previous_cycle_control_r_reg[0]\(0) => \dnpcie_aurora_2_sim_sym_dec_4byte_i/previous_cycle_control_r\(0),
      \previous_cycle_data_r_reg[6]\(3) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_24,
      \previous_cycle_data_r_reg[6]\(2) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_25,
      \previous_cycle_data_r_reg[6]\(1) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_26,
      \previous_cycle_data_r_reg[6]\(0) => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_27,
      ready_r_reg => dnpcie_aurora_2_sim_aurora_lane_4byte_0_i_n_21,
      reset_count_r_reg => gt_wrapper_i_n_65,
      reset_count_r_reg_0 => gt_wrapper_i_n_66,
      rx_resetdone_out => rx_resetdone_out,
      rxbyterealign_out(0) => rx_realign_i,
      rxctrl0_out(3 downto 0) => rx_char_is_k_i(3 downto 0),
      rxctrl2_out(3 downto 0) => rx_char_is_comma_i(3 downto 0),
      rxn => rxn,
      rxp => rxp,
      rxpolarity_in(0) => rx_polarity_i,
      \soft_err_r_reg[0]\(3) => \dnpcie_aurora_2_sim_err_detect_4byte_i/p_6_out\(3),
      \soft_err_r_reg[0]\(2) => gt_wrapper_i_n_68,
      \soft_err_r_reg[0]\(1 downto 0) => \dnpcie_aurora_2_sim_err_detect_4byte_i/p_6_out\(1 downto 0),
      sync_clk => sync_clk,
      tx_lock => \^tx_lock\,
      tx_out_clk => tx_out_clk,
      tx_resetdone_out => tx_resetdone_out,
      txctrl2_in(3 downto 0) => tx_char_is_k_i(3 downto 0),
      txn => txn,
      txp => txp,
      user_clk => user_clk,
      \word_aligned_control_bits_r_reg[2]\ => gt_wrapper_i_n_86,
      \word_aligned_control_bits_r_reg[3]\ => gt_wrapper_i_n_87,
      \word_aligned_data_r_reg[17]\(3) => gt_wrapper_i_n_74,
      \word_aligned_data_r_reg[17]\(2) => gt_wrapper_i_n_75,
      \word_aligned_data_r_reg[17]\(1) => gt_wrapper_i_n_76,
      \word_aligned_data_r_reg[17]\(0) => gt_wrapper_i_n_77,
      \word_aligned_data_r_reg[24]\(7) => gt_wrapper_i_n_78,
      \word_aligned_data_r_reg[24]\(6) => gt_wrapper_i_n_79,
      \word_aligned_data_r_reg[24]\(5) => gt_wrapper_i_n_80,
      \word_aligned_data_r_reg[24]\(4) => gt_wrapper_i_n_81,
      \word_aligned_data_r_reg[24]\(3) => gt_wrapper_i_n_82,
      \word_aligned_data_r_reg[24]\(2) => gt_wrapper_i_n_83,
      \word_aligned_data_r_reg[24]\(1) => gt_wrapper_i_n_84,
      \word_aligned_data_r_reg[24]\(0) => gt_wrapper_i_n_85
    );
hpcnt_reset_cdc_sync: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync_0
     port map (
      init_clk_in => init_clk_in,
      reset => reset
    );
ll_to_axi_pdu_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_LL_TO_AXI
     port map (
      \RX_REM_reg[0]\(1) => rx_rem_int(0),
      \RX_REM_reg[0]\(0) => rx_rem_int(1),
      m_axi_rx_tkeep(2) => \^m_axi_rx_tkeep\(1),
      m_axi_rx_tkeep(1) => \^m_axi_rx_tkeep\(2),
      m_axi_rx_tkeep(0) => \^m_axi_rx_tkeep\(3),
      rx_eof => rx_eof
    );
reset_sync_user_clk_cdc_sync: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_cdc_sync_1
     port map (
      \out\ => reset_sync_user_clk,
      reset => reset,
      user_clk => user_clk
    );
standard_cc_module_i: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_STANDARD_CC_MODULE
     port map (
      Q(0) => \nfc_module_i/nfc_counter_r_reg\(0),
      SYSTEM_RESET_reg => \^sys_reset_out\,
      TX_DST_RDY_N_reg => standard_cc_module_i_n_0,
      do_cc_r_reg => do_cc_i,
      do_nfc_r => \tx_ll_control_i/do_nfc_r\,
      s_axi_nfc_ack => \^s_axi_nfc_ack\,
      s_axi_nfc_req => s_axi_nfc_req,
      user_clk => user_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dnpcie_aurora_2_sim is
  port (
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 31 );
    s_axi_tx_tkeep : in STD_LOGIC_VECTOR ( 0 to 3 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tlast : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 31 );
    m_axi_rx_tkeep : out STD_LOGIC_VECTOR ( 0 to 3 );
    m_axi_rx_tvalid : out STD_LOGIC;
    m_axi_rx_tlast : out STD_LOGIC;
    s_axi_nfc_tx_tvalid : in STD_LOGIC;
    s_axi_nfc_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 3 );
    s_axi_nfc_tx_tready : out STD_LOGIC;
    m_axi_nfc_rx_tvalid : out STD_LOGIC;
    m_axi_nfc_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 3 );
    rxp : in STD_LOGIC;
    rxn : in STD_LOGIC;
    txp : out STD_LOGIC;
    txn : out STD_LOGIC;
    gt_refclk1 : in STD_LOGIC;
    frame_err : out STD_LOGIC;
    hard_err : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    lane_up : out STD_LOGIC;
    channel_up : out STD_LOGIC;
    user_clk : in STD_LOGIC;
    sync_clk : in STD_LOGIC;
    gt_reset : in STD_LOGIC;
    reset : in STD_LOGIC;
    sys_reset_out : out STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    tx_lock : out STD_LOGIC;
    init_clk_in : in STD_LOGIC;
    tx_resetdone_out : out STD_LOGIC;
    rx_resetdone_out : out STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    gt0_drpaddr : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpdi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpdo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpen : in STD_LOGIC;
    gt0_drprdy : out STD_LOGIC;
    gt0_drpwe : in STD_LOGIC;
    gt_powergood : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_out_clk : out STD_LOGIC;
    bufg_gt_clr_out : out STD_LOGIC;
    pll_not_locked : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of dnpcie_aurora_2_sim : entity is true;
end dnpcie_aurora_2_sim;

architecture STRUCTURE of dnpcie_aurora_2_sim is
  attribute CC_FREQ_FACTOR : string;
  attribute CC_FREQ_FACTOR of inst : label is "5'b01100";
  attribute EXAMPLE_SIMULATION : integer;
  attribute EXAMPLE_SIMULATION of inst : label is 1;
begin
inst: entity work.dnpcie_aurora_2_sim_dnpcie_aurora_2_sim_core
     port map (
      bufg_gt_clr_out => bufg_gt_clr_out,
      channel_up => channel_up,
      frame_err => frame_err,
      gt0_drpaddr_in(8 downto 0) => gt0_drpaddr(8 downto 0),
      gt0_drpdi_in(15 downto 0) => gt0_drpdi(15 downto 0),
      gt0_drpdo_out(15 downto 0) => gt0_drpdo(15 downto 0),
      gt0_drpen_in => gt0_drpen,
      gt0_drprdy_out => gt0_drprdy,
      gt0_drpwe_in => gt0_drpwe,
      gt_powergood(0) => gt_powergood(0),
      gt_refclk1 => gt_refclk1,
      gt_reset => gt_reset,
      hard_err => hard_err,
      init_clk_in => init_clk_in,
      lane_up => lane_up,
      link_reset_out => link_reset_out,
      loopback(2 downto 0) => loopback(2 downto 0),
      m_axi_rx_fc_nb(0 to 3) => m_axi_nfc_rx_tdata(0 to 3),
      m_axi_rx_snf => m_axi_nfc_rx_tvalid,
      m_axi_rx_tdata(0 to 31) => m_axi_rx_tdata(0 to 31),
      m_axi_rx_tkeep(0 to 3) => m_axi_rx_tkeep(0 to 3),
      m_axi_rx_tlast => m_axi_rx_tlast,
      m_axi_rx_tvalid => m_axi_rx_tvalid,
      pll_not_locked => pll_not_locked,
      power_down => power_down,
      reset => reset,
      rx_resetdone_out => rx_resetdone_out,
      rxn => rxn,
      rxp => rxp,
      s_axi_nfc_ack => s_axi_nfc_tx_tready,
      s_axi_nfc_nb(0 to 3) => s_axi_nfc_tx_tdata(0 to 3),
      s_axi_nfc_req => s_axi_nfc_tx_tvalid,
      s_axi_tx_tdata(0 to 31) => s_axi_tx_tdata(0 to 31),
      s_axi_tx_tkeep(0 to 3) => s_axi_tx_tkeep(0 to 3),
      s_axi_tx_tlast => s_axi_tx_tlast,
      s_axi_tx_tready => s_axi_tx_tready,
      s_axi_tx_tvalid => s_axi_tx_tvalid,
      soft_err => soft_err,
      sync_clk => sync_clk,
      sys_reset_out => sys_reset_out,
      tx_lock => tx_lock,
      tx_out_clk => tx_out_clk,
      tx_resetdone_out => tx_resetdone_out,
      txn => txn,
      txp => txp,
      user_clk => user_clk
    );
end STRUCTURE;

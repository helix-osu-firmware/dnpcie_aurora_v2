-- This contains the tuser generation logic
-- that was in dnpcie_aurora.vhd inside the generate loop.
-- We move it to its own file so that it can be identically included
-- in any implementation.
-- See also the xoff generation.

 library ieee;
     use ieee.std_logic_1164.all;
     use ieee.std_logic_misc.all;
     use ieee.numeric_std.all;
library work;
    use work.ttcs_intfc_pkg.all;
-- synthesis translate_off
library unisim;
    use unisim.vcomponents.all;
-- synthesis translate_on

entity  dnpcie_aurora_tuser_generator is
port(
        -- clock, reset
        user_clk                : in std_logic;
        ur_ch_reset             : in std_logic;
        
        -- TUSER generation
        channel_up              : in std_logic;
        m_axi_rx_tvalid         : in std_logic;
        m_axi_rx_tlast          : in std_logic;
        m_axi_rx_tuser          : out std_logic
     );
end dnpcie_aurora_tuser_generator;

architecture behave of dnpcie_aurora_tuser_generator is
        signal  rx_new_packet_d     : std_logic;
        signal  rx_new_packet_q     : std_logic;
        
        constant    CQD             : time                          := 1 ns; -- clock to Q delay for Aurora simulation        
        -- 
begin
        rx_new_pkt_d   <= '0' when ((m_axi_rx_tvalid and m_axi_rx_tlast) = '1') else
                             '1' when ((m_axi_rx_tvalid and (not m_axi_rx_tlast)) = '1') else
                             rx_new_pkt_q;

        m_axi_rx_tuser <= (not rx_new_pkt_q) when ((m_axi_rx_tvalid and m_axi_rx_tlast) = '1') else
                          (rx_new_pkt_d and (not rx_new_pkt_q));

        --------------------------------------------------
        -- Start of frame (tuser in AXI) registers.
        --------------------------------------------------
        sof_pcs :  process(user_clk)
        begin
            if (user_clk'event and user_clk='1') then
                if (ur_ch_reset = '1') then
                    rx_new_pkt_q <= '0' after CQD;
                else
                    rx_new_pkt_q <= rx_new_pkt_d and channel_up after CQD;
                end if;
            end if;
        end process;

end behave;

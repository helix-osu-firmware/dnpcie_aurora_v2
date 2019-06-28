-- This contains the xoff generation logic
-- that was in dnpcie_aurora.vhd inside the generate loop.
-- We move it to its own file so that it can be identically included
-- in any implementation.
-- See also the xoff generation.

 library ieee;
     use ieee.std_logic_1164.all;
     use ieee.std_logic_misc.all;
     use ieee.numeric_std.all;
-- synthesis translate_off
library unisim;
    use unisim.vcomponents.all;
-- synthesis translate_on

entity  dnpcie_aurora_xoff_generator is
port(
        -- clock, reset
        user_clk                : in std_logic;
        ur_ch_reset             : in std_logic;
        -- XOFF generation input interface
        s_axi_tx_nfc_xoff       : in std_logic;
        -- XOFF generation output interface
        s_axi_nfc_req           : out std_logic;
        s_axi_nfc_nb            : out std_logic_vector(0 to 3);
        s_axi_nfc_ack           : in std_logic
     );
end dnpcie_aurora_xoff_generator;

architecture behave of dnpcie_aurora_xoff_generator is
        signal  nfc_xoff_q0     : std_logic;
        signal  nfc_xoff_q1     : std_logic;
        signal  nfc_xoff_re     : std_logic;
        signal  nfc_xoff_fe     : std_logic;
        signal  nfc_xoff_strt   : std_logic;
        signal  nfc_xoff_stop   : std_logic;
        
        constant    CQD             : time                          := 1 ns; -- clock to Q delay for Aurora simulation        
        constant XOFF_VAL               : std_logic_vector(3 downto 0)          := X"F";
        constant XON_VAL                : std_logic_vector(3 downto 0)          := X"0";
begin
        --------------------------------------------------
        -- NFC XON/XOFF logic. Start by sending XOFF when
        -- FIFO is almost full. Conclude by sending XON
        -- when FIFO empties.
        --------------------------------------------------
        nfc_pcs : process(user_clk)
        begin
            if (user_clk'event and user_clk='1') then
                if (ur_ch_reset = '1') then
                    nfc_xoff_q0 <= '0';
                    nfc_xoff_q1 <= '0';
                    nfc_xoff_re <= '0';
                    nfc_xoff_fe <= '0';
                    nfc_xoff_strt <= '0';
                    nfc_xoff_stop <= '0';
                    s_axi_nfc_req <= '0';
                    s_axi_nfc_nb  <= XON_VAL;
                    --m_axi_rx_nfc_xoff <= '0';
                else
                    nfc_xoff_q0 <= s_axi_tx_nfc_xoff;
                    nfc_xoff_q1 <= nfc_xoff_q0;
                    nfc_xoff_re <= nfc_xoff_q0 and (not nfc_xoff_q1);--rising edge
                    nfc_xoff_fe <= (not nfc_xoff_q0) and nfc_xoff_q1;--falling edge
                    -- XOFF transmit logic ------------------
                    if (s_axi_nfc_ack and nfc_xoff_strt) = '1' then--clear values when ack occurs                    
                        nfc_xoff_strt <= '0';
                    else            
                        if nfc_xoff_re = '1' then-- rising edge starts XOFF cycle
                            nfc_xoff_strt <= '1';
                        end if;
                    end if;
                    -- XOFF start logic
                    if (s_axi_nfc_ack and (not nfc_xoff_strt) and nfc_xoff_stop) = '1' then--clear values when ack occurs
                        nfc_xoff_stop <= '0';
                    else            
                        if nfc_xoff_fe = '1' then-- falling edge concludes XOFF cycle
                            nfc_xoff_stop <= '1';
                        end if;
                    end if;
                    -- XOFF end logic
                    if s_axi_nfc_ack = '1' then--clear values when ack occurs                    
                        s_axi_nfc_req <= '0' ;
                        s_axi_nfc_nb  <= XON_VAL;--first ack XOFF, second XON
                    else            
                        -- need to request at start and stop
                        s_axi_nfc_req <= nfc_xoff_strt or nfc_xoff_stop;
                        if nfc_xoff_strt = '1' then
                            s_axi_nfc_nb  <= XOFF_VAL;--first value always XOFF
                        end if;
                    end if;
                end if;
            end if;
        end process;
end behave;

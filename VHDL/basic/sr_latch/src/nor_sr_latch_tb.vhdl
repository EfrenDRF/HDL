--------------------------------------------------------------------
-- Author: Efren Del Real Frias
--
-- Create date : 03/22/2020
-- Module Name : nor_sr_latch_tb
--


--
use work.sr_latch_pkg.all;


-----
entity nor_sr_latch_tb is
end nor_sr_latch_tb;

architecture behav of nor_sr_latch_tb is

    -- Specifies whitch entity bound with the component
    for nor_sr_latch_0: sr_latch use entity work.sr_latch(nor_sr_latch);

    -- Sigals
    signal s_nor, r_nor, q_nor, nq_nor : bit;
        
    begin
        --Component instantation
        nor_sr_latch_0: sr_latch port map(s => s_nor, r => r_nor, q => q_nor, nq => nq_nor);

        NOR_PATTERN: process
            begin
                -- Cheak each pattern
                for pIndex in nor_sr_latch_patterns'range loop
                    --set the inputs
                    s_nor <= nor_sr_latch_patterns(pIndex).s;
                    r_nor <= nor_sr_latch_patterns(pIndex).r;

                    --wait for the results
                    wait for 1 ns;

                    --check the ouputs
                    assert q_nor  = nor_sr_latch_patterns(pIndex).q report "wrong Set value" severity error;
                    assert nq_nor = nor_sr_latch_patterns(pIndex).nq report "wrong Reset value" severity error;
                end loop;

                assert false report "End of the test NOR_SR_LATCH" severity note;

                --  Wait forever; this will finish the simulation.
                wait;
        end process;


end behav;
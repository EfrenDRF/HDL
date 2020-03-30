--------------------------------------------------------------------
-- Author: Efren Del Real Frias
--
-- Create date : 03/22/2020
-- Module Name : nand_sr_latch_tb
--


--
use work.sr_latch_pkg.all;


-----
entity nand_sr_latch_tb is
end nand_sr_latch_tb;

architecture behav of nand_sr_latch_tb is

    -- Specifies whitch entity bound with the component
    for nand_sr_latch_0: sr_latch use entity work.sr_latch(nand_sr_latch);

    -- Sigals
    signal s_nand, r_nand, q_nand, nq_nand : bit;
        
    begin
        --Component instantation
        nand_sr_latch_0: sr_latch port map(s => s_nand, r => r_nand, q => q_nand, nq => nq_nand);

        NAND_PATTERN: process
            begin
                -- Cheak each pattern
                for pIndex in nand_sr_latch_patterns'range loop
                    --set the inputs
                    s_nand <= nand_sr_latch_patterns(pIndex).s;
                    r_nand <= nand_sr_latch_patterns(pIndex).r;

                    --wait for the results
                    wait for 1 ns;

                    --check the ouputs
                    assert q_nand  = nand_sr_latch_patterns(pIndex).q report "wrong Set value" severity error;
                    assert nq_nand = nand_sr_latch_patterns(pIndex).nq report "wrong Reset value" severity error;
                end loop;

                assert false report "End of the test NAND_SR_LATCH" severity note;

                --  Wait forever; this will finish the simulation.
                wait;
        end process;


end behav;
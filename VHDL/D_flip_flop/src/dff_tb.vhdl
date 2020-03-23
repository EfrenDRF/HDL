--------------------------------------------------------------------
-- Author: Efren Del Real Frias
--
-- Create date : 03/22/2020
-- Module Name : dff_tb
--

use work.dff_pkg.all;
-----
entity dff_tb is
end dff_tb;
    

architecture behav of dff_tb is

    -- Sigals
    signal sD, sCLK, sQ, sNQ: bit;
        
    begin
        --Component instantation
        dff_0: dff port map(d => sD, clk => sCLK, q => sQ, nq => sNQ);

        process
            begin
                -- Cheak each pattern
                for pIndex in dff_patterns'range loop
                    --set the inputs
                    sD   <= dff_patterns(pIndex).d;
                    sCLK <= dff_patterns(pIndex).clk;
                    --sD   <= '0'
                    --sCLK <= '1';

                    --wait for the results
                    wait for 1 ns;

                    --check the ouputs
                    --assert sQ  = dff_patterns(pIndex).q report "Q value does not match with expected value" severity error;
                    --assert sNQ = dff_patterns(pIndex).nq report "NQ value does not match with expected value" severity error;
                end loop;

                assert false report "End of the test" severity note;

                -- Wait forever; this will finish the simulation.
                wait;
        end process;


end behav;
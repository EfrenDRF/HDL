--------------------------------------------------------------------
-- Author: Efren Del Real Frias
--
-- Create date : 03/22/2020
-- Module Name : dff
--

-- use component sr_latch
use work.sr_latch_pkg.all;


entity dff is
    port(
        d : in bit;         -- Data
        clk: in bit;        -- Clock
        q: out bit;         -- 
        nq: out bit         -- 
    );
end dff;


architecture rtl of dff is
    -- Specifies whitch entity bound with the component
    for sr_latch_0: sr_latch use entity work.sr_latch(nand_sr_latch);

    --Signals
    signal sS, sR, sQ, sNQ: bit;

    begin
        --Component instantation
        sr_latch_0: sr_latch port map(s => sS, r => sR, q => sQ, nq => sNQ);



        sS <= d nand clk;
        sR <= (not d) nand clk;

        q <= sQ;
        nq <= sNQ;
        
end rtl;
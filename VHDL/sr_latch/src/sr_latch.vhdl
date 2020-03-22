--------------------------------------------------------------------
-- Author: Efren Del Real Frias
--
-- Create date : 03/22/2020
-- Module Name : sr_latch_tb
--

entity sr_latch is
    port(
        s: in bit;      -- Set
        r: in bit;      -- Reset
        q: out bit;     --
        nq: out bit     --
    );
end sr_latch;


------------------------------------------------
--  NAND SR TRUTH TABLE
--  +---+---+---+----+
--  | s | r | q  | nq |
--  +---+---+----+----+
--  | 0 | 0 |undefined|
--  | 0 | 1 | 1  | 0  |
--  | 1 | 0 | 0  | 1  |
--  | 1 | 1 | q  | nq |
--  +---+---+---+-----+

architecture NAND_sr_latch of sr_latch is
    signal tmp_q : bit;
    signal tmp_nq : bit;

    begin
        tmp_q <=  s nand tmp_nq;
        tmp_nq <= r nand tmp_q;

        q <= tmp_q;
        nq <=tmp_nq;
end NAND_sr_latch;


------------------------------------------------
--  NOR SR LATCH TRUTH TABLE
--  +---+---+---+----+
--  | s | r | q  | nq |
--  +---+---+----+----+
--  | 0 | 0 | q  | nq |
--  | 0 | 1 | 0  | 1  |
--  | 1 | 0 | 1  | 0  |
--  | 1 | 1 |undefined|
--  +---+---+---+-----+

architecture NOR_sr_latch of sr_latch is 
    signal tmp_q : bit;
    signal tmp_nq : bit;

    begin
        tmp_q <=  r nor tmp_nq;
        tmp_nq <= s nor tmp_q;

        q <= tmp_q;
        nq <= tmp_nq;
end NOR_sr_latch;
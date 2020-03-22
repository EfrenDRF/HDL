--------------------------------------------------------------------
-- Author: Efren Del Real Frias
--
-- Create date : 03/22/2020
-- Module Name : 
--


package sr_latch_pkg is

    --Component declaration
    component sr_latch
        port(
            s: in bit;      -- set
            r: in bit;      -- reset
            q: out bit;     --
            nq: out bit     --
        );
    end component;
    
    type sr_latch_pattern_t is record
        --sr_latch inputs
        s: bit;
        r: bit;
        --sr_latch utputs
        q: bit;
        nq: bit;
    end record;

    type sr_latch_pattern_array_t is array (natural range <>) of sr_latch_pattern_t;
    

    ------------------------------------------------
    --  NAND SR LATCH TRUTH TABLE
    --  +---+---+---+----+
    --  | s | r | q  | nq |
    --  +---+---+----+----+
    --  | 0 | 0 |undefined|
    --  | 0 | 1 | 1  | 0  |
    --  | 1 | 0 | 0  | 1  |
    --  | 1 | 1 | q  | nq |
    --  +---+---+---+-----+
        constant nand_sr_latch_patterns : sr_latch_pattern_array_t :=
                                                    (
                                                        ('0', '1', '1', '0'),
                                                        ('1', '0', '0', '1'),
                                                        ('0', '1', '1', '0'),
                                                        ('1', '1', '1', '0'),
                                                        ('1', '0', '0', '1'),
                                                        ('1', '1', '0', '1'),
                                                        ('0', '1', '1', '0'),
                                                        ('1', '1', '1', '0')
                                                    );

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
        constant nor_sr_latch_patterns : sr_latch_pattern_array_t :=
                                                    (
                                                        ('0', '1', '0', '1'),
                                                        ('1', '0', '1', '0'),
                                                        ('0', '1', '0', '1'),
                                                        ('0', '0', '0', '1'),
                                                        ('1', '0', '1', '0'),
                                                        ('0', '0', '1', '0'),
                                                        ('0', '1', '0', '1'),
                                                        ('0', '0', '0', '1')
                                                    );


    
end package sr_latch_pkg;

--------------------------------------------------------------------
-- Author: Efren Del Real Frias
--
-- Create date : 03/22/2020
-- Module Name : 
--

package dff_pkg is

    --Component declaration
    component dff
        port( d ,clk: in bit; q, nq: out bit);
    end component;
    
    type dff_pattern_t is record
        --Inputs
        clk: bit;
        d: bit;
        --Outputs
        q: bit;
        nq: bit;
    end record;

    type dff_pattern_array_t is array (natural range <>) of dff_pattern_t;
    

    ------------------------------------------------
    --  NAND SR LATCH TRUTH TABLE
    --  +---+---+---+----+
    --  |clk| d | q  | nq |
    --  +---+---+----+----+
    --  | 0 | x | q  | nq |
    --  | 1 | 0 | 0  | 1  |
    --  | 1 | 1 | 1  | 0  |
    --  +---+---+---+-----+
        constant dff_patterns : dff_pattern_array_t :=
                                                    (
                                                        ('1', '0', '0', '1'),
                                                        ('0', '1', '0', '1'),
                                                        ('1', '1', '1', '0'),
                                                        ('0', '0', '1', '0'),
                                                        ('1', '0', '0', '1'),
                                                        ('0', '0', '0', '1'),
                                                        ('1', '1', '1', '0'),
                                                        ('0', '0', '1', '0'),
                                                        ('1', '0', '0', '1'),
                                                        ('0', '1', '0', '1'),
                                                        ('1', '0', '0', '1'),
                                                        ('0', '1', '0', '1')
                                                    );




    
end package dff_pkg;


#--------------------------------------------------------------------
# Author: Efren Del Real Frias
# Date: 29/ March/2020

import os_methods

import os
import sys


sh_fileName = sys.argv[1]

fileName = os_methods.find_dot_pgj_file()

vhdlFiles =os_methods.get_content_from_dot_pgj_file(fileName)

with open(sh_fileName,'a') as ghdl_script_file:
    ghdl_script_file.write("#!/bin/bash\n")
    for vhdlFileandLocation in vhdlFiles:
        ghdl_script_file.write ("ghdl -a -Wa,--32 "+ vhdlFileandLocation +"\n")
        
        vhdlFileName =  os_methods.get_file_name(vhdlFileandLocation)
        #print(vhdlFileName)
        
        tb_file = os_methods.compare_testBench_File(vhdlFileName)
        if (tb_file != False):
            #print(tb_file)
            ghdl_script_file.write ("ghdl -e -Wa,--32 -Wl,-m32 "+ tb_file +"\n")
            ghdl_script_file.write ("ghdl -r "+ tb_file +"\n")
            ghdl_script_file.write ("ghdl -r "+ tb_file + " --vcd="+ tb_file +".vcd\n")
            


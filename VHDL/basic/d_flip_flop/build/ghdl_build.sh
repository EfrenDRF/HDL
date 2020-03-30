#!/bin/bash 
clear

working_dir=$(dirname $(realpath $0))

#regular expression
[[ $working_dir =~ ^.*(VHDL) ]]
mainFolder=$BASH_REMATCH
ghdlScriptsFolder="${mainFolder}/_ghdl_scripts_/"

#execute python script
python "${ghdlScriptsFolder}main_ghdl.py"




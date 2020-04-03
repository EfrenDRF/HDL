#!/bin/bash 
clear

#Gets the path where the bash file has run
working_dir=$(dirname $(realpath $0))

#regular expression
[[ $working_dir =~ ^.*(VHDL) ]]
mainFolder=$BASH_REMATCH
ghdlScriptsFolder="${mainFolder}/_ghdl_scripts_/"


#Run bash script
"${ghdlScriptsFolder}build.sh"

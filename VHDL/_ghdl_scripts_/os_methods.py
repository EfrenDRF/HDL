#--------------------------------------------------------------------
# Author: Efren Del Real Frias
# Date: 29/ March/2020




import os
import re


GET_FILE_NAME_NOT_OK = False


#---------------------------------------------------
#- 
#---------------------------------------------------
def find_dot_pgj_file():
    for filename in os.listdir(os.getcwd()):
        if(re.match("LOCAL.*.pgj",filename)):
            break
    return filename

#---------------------------------------------------
#-
#---------------------------------------------------
def get_content_from_dot_pgj_file(fileName):

    fileList = []
    returnList = []

    #open the file
    with open(fileName,'r') as f:
        for line in f:

            #remove the  carriage return
            line = line.replace('\n','')

            #Gets the file name
            file_name = get_file_name(line)

            if(file_name != GET_FILE_NAME_NOT_OK):

                if(re.match("GLOBAL.*pgj",file_name)):
                    #Function self-calling
                    fileAndPathList = get_content_from_dot_pgj_file(line)

                    #Verify each list element
                    for element in fileAndPathList:

                        #Gets the file name
                        recursive_file_name = get_file_name(element)

                        if(recursive_file_name != GET_FILE_NAME_NOT_OK):
                            #Verify  if the current file has already saved
                            if(recursive_file_name not in returnList):

                                tmpNewFile_and_PathName = line.replace(file_name,'') + element
                                returnList.append(tmpNewFile_and_PathName)

                
                if(re.match(".*vhdl",file_name)):
                    #Verify  if the current file has already saved
                    if(file_name not in returnList):
                        returnList.append(line)
    return returnList
            

#---------------------------------------------------
#-
#---------------------------------------------------

def get_file_name(full_file_path):
    fileName = re.search(r'\w*.((vhdl)|(pgj))', full_file_path)
    returnValue = fileName.group() if (fileName != None) else GET_FILE_NAME_NOT_OK
    return returnValue

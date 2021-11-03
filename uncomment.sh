#!/bin/bash

logo(){
    printf "${bred}#     #         #####                                           
#     # #    # #     #  ####  #    # #    # ###### #    # ##### 
#     # ##   # #       #    # ##  ## ##  ## #      ##   #   #   
#     # # #  # #       #    # # ## # # ## # #####  # #  #   #   
#     # #  # # #       #    # #    # #    # #      #  # #   #   
#     # #   ## #     # #    # #    # #    # #      #   ##   #   
 #####  #    #  #####   ####  #    # #    # ###### #    #   #   
 ${reset}"
printf "${blue}    <!-- A Powerfull tool to Fetch Comments --->${reset}\n"
printf "${bgreen}=====================================${red}Developed By:${yellow}@marcos_iaf${reset}\n"

}

extractor(){
if [ -s $1 ]; then
printf "\n${bgreen}Fetching Comments...${reset}"
for i in $(cat $1)
do
#curl -s -X GET "$i" |egrep "<!--|<!---|<! - -"|anew -q $1_comments.txt 
echo -e "##### $i #####\n" >> $1_comments.txt
curl -s -X GET "$i" |egrep -iv 'DOCTYPE'|sed -n '/<!/,/>$/p'|anew -q $1_comments.txt
printf "\n${blue}$i ${yellow}[${green}\xE2\x9C\x94${yellow}]${reset}"
done
printf "\n${green}Finished Fetching the Comments${reset}"
printf "\n${green}Results saved in ${yellow}$1_Comments.txt${reset}"
else
printf "${red}No Such File or File is Empty${reset}"
fi
}

showHelp(){
printf "\n Example Usage:
       ./uncomment.sh target_file "
echo 
printf "\n Results will be saved in target_file_Uncomment.txt"
echo 
printf "\n${bred}Github:${reset} https://github.com/marcosiaf/uncomment"
printf "\n${bred}Developer:${reset} https://twitter.com/marcos_iaf"
}

###################### Color CONFIG ####################
bred='\033[1;31m'
bblue='\033[1;34m'
bgreen='\033[1;32m'
yellow='\033[0;33m'
red='\033[0;31m'
blue='\033[0;34m'
green='\033[0;32m'
reset='\033[0m'
################################### Start Of Script ###############################
logo
if [ $# -eq 0 ]; then
printf "\n${bred} No Input File provided !!${reset}"
showHelp
else
extractor $1
fi

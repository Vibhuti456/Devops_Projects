#!/bin/bash 


#This is the script for backup with 5 days rotation 

<< readme
usage: ./backup.sh <path of source> <path of target> 

readme

function Dispaly_usage(){

	echo "usage: ./backup.sh <path of source> <path of target>"

}

if [ $# -eq 0 ]; then
	Display_usage
fi 


source_dir=$1
backup_dir=$2
timestamp=$(date '+%Y-%m-%d_%H:%M:%S')


function backup_data() {

	zip -r "${backup_dir}/backup_user${timestamp}.zip" "${source_dir}"  > /dev/null 
         

	if [ $? -eq 0 ]; then

		echo "Backup Created Successfully" 
        else
		echo "Backup not created Successfully" 
        fi 

} 

#backup_data


function Rotation_data(){ 
       
       backup_ro=($(ls -t "${backup_dir}/backup_user"*.zip 2>/dev/null)) 

       #echo "${backup_ro[@]}" 

       if [ "${#backup_ro[@]}" -gt 5 ]; then 

	       echo "Performing rotation for 5 days" 

	       Backup_remove=(${backup_ro[@]:5}) 

	       echo "${Backup_remove[@]}" 

	       for backup_loop in "${Backup_remove[@]}";
	       do 
		       rm -f ${backup_loop}
	       done
        fi 
                 
}

backup_data
Rotation_data

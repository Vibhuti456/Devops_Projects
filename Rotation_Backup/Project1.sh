#!/bin/bash 


#-------------------Function For Welcoming to User Management Scripts--------------



echo "*********************************************************************************************" 


function welcome_user() {
	echo "Welcome to the User Management Scripts" 
	echo "This scripts will perform all the task related to User Management" 
	echo "Press c to create the user" 
	echo "Press d to delete the user" 
}

#welcome_user

echo "*****************************************************************************" 

function User_Management(){

	echo "Inside the function User Management!!!" 

	read -p "Enter your Username: " user_add
	read -p "Enter group want to add the user: " group_mod 

	#This command will create the new user in your system
	
	sudo useradd -m ${user_add}
        
	#This command will add your user to the group
	
	sudo usermod -aG ${group_mod} ${user_add} 

        echo "User Created Successfully!!"
}
 

#User_Management 

function Delete_User() {

	echo "This is the function to delete a user" 
        
	read -p "Enter the username want to be deleted: " user_del 
 
	#This command will delete the user
	
	sudo userdel ${user_del}

        #This command will change the directory 
	
        cd /home
        
        echo "Directory Changed...."	
    
        #This command will remove the parent directory 
	
        sudo rm -r ${user_del} 	
	echo "Parent Directory Deleted" 

}

#Delete_User


case $1 in 
        c)
		echo "Processing User management Funtion" 
		User_Management 
	;;
        d) 
		echo "Processing Delete User Function" 
		Delete_User
	;;
        *)
		welcome_user
	;;
esac

	


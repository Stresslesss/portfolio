# credit https://linux.die.net/man/1/sha256sum for information I could not find elsewhere

#!/bin/bash
read -p "Enter folder name:  " Folder                               # enter directory
read -sp "Enter Password: " Password                                # entry of password hidden
echo $Password | sha256sum -c --status "./$Folder/secret.txt"       # hash entered password and compare to file, no output
if [ $? = 0 ]                                                       # if exit status zero (success)
then echo "Access Granted"
exit 0
else echo "Access Denied"
exit 1
fi

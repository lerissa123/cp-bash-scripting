#!/bin/bash
#comparing users from readme and passwd
#don't forget to run setup first!

#sorting basedusers
sort basedusers.txt > garbage.txt
cat garbage.txt > basedusers.txt

#clearing localusers
echo "" > localusers.txt

#looking at all the users currently on the system
for i in $(seq 1000 1100)
do
    grep "x:${i}" /etc/passwd | awk -F: '{ print $1}' >> localusers.txt
done

#sorting localusers
sort localusers.txt > garbage.txt
cat garbage.txt > localusers.txt

#printing the users that fit into various categories
comm --nocheck-order  -1 -2 basedusers.txt localusers.txt #>> belovedusers.txt
echo "Above are the existing authorized (beloved) users :)"
comm --nocheck-order  -1 -3 basedusers.txt localusers.txt #>> unbelovedusers.txt
echo "These are the unauthorized (unbeloved) users >:("
comm --nocheck-order  -2 -3 basedusers.txt localusers.txt #>> addusers.txt
echo "You need to add these beloved users ;)"

#storing above info in files
comm --nocheck-order  -1 -2 basedusers.txt localusers.txt >> belovedusers.txt
comm --nocheck-order  -1 -3 basedusers.txt localusers.txt >> unbelovedusers.txt
comm --nocheck-order  -2 -3 basedusers.txt localusers.txt >> addusers.txt
echo "That info has been placed carefully and tenderly into respective files."

#deleting users that need to be deleted
echo "time to start reading files!"
#file= ~/scripttime/unbelovedusers.txt
#for i in $file read -r line
#do 
  #  echo "I'm reading a line."
  #  deluser "$line"
  #  echo "$line has been forcibly removed from the os!"
#done
file="/home/cy/scripttime/unbelovedusers.txt"
echo "i recognize that variable :)"
while IFS= read -r line
do
    echo "i started looking :D"
    echo "i'm looking at $line"
    deluser "$line" > /dev/null
done < "$file"

#file="/home/cy/scripttime/addusers.txt"
#while IFS= read -r line
#do 
    #echo "i started looking, bro!"
    #echo "i'm looking at $line"
    #adduser "$line"
#done < "$file"

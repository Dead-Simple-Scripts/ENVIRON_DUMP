#!/bin/bash
echo ""
echo "********************************"
echo "*         ENVIRON_DUMP         *"
echo "*      Extract *nix Process    *"
echo "*         Environments         *"
echo "*                              *"
echo "*           by Michael Leclair *"
echo "*          and Robert Tremblay *"
echo "********************************"
echo ""
echo "Usage: sudo ./environ_dump.sh"
echo ""
echo "Searches for, extracts and decodes environ files for forensic analysis"
#
read -p "Press [Enter] key to start environ_dump"
clear
echo "*********************************"
echo "*  environ_dump script started  *"
echo "*********************************"
#
exec 2>/dev/null
mkdir environ_results
results=environ_results
# Record all running processes on system
ps aux > running_processes.txt

# Search entire volume for environ files
for i in `find /. -name 'environ'`; do
	new=`echo $i|nawk -F"/" '{split($NF,a,".");print "results/"a[1]"_"$(NF-1)"."a[2]}'`
	cp $i $new
done

# String out each collected environ file to make it easier to review, grep, etc
for file in results/*; do
	 strings "$file" > "${file%}.strings.txt"
done
echo "Archiving results"
zip -r environ_results.zip $results
echo ">>>>> environ dump completed <<<<<"

# ENVIRON_DUMP
Searches for, extracts and decodes *nix environ files for forensic analysis

Usage: sudo ./environ_dump.sh

Script:
1. Records all running processes on the target system
2. Searches entire volume for "environ" files and saves a copy to the results directory
2. Strings out each collected environ file to make it easier to review, grep, etc

*nix environ files useful for:
1. Identying which account executed an application
2. Identifying executable file path
3. Identifying parent PID of notable executable

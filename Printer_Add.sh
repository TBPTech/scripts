#!/bin/zsh

##### Script Info
script_name="Printer_Add"
# Written by: Travis Simmons
# Description: Add printer at mass 
#Variables
StartPrintercount="lpstat -p | cut -d' ' -f2" 
EndPrintercount="lpstat -p | cut -d' ' -f2"
 
#1 use lpadmin command to add printer
/usr/sbin/lpadmin -p Brother 5470DW -L "79nm-259" -E -v ipp://10.1.61.25/ipp/print -m everywhere -o printer-is-shared=false

#2 create test page
touch ~/Desktop/testprint.txt && echo "Printer add successful" > ~/Desktop/testprint.txt

#3 print & delete test page
lp ~/Desktop/testprint.txt
rm -r ~/Desktop/testprint.txt

#4 Verify printer add is complete

 if
  [ StartPrintercount < EndPrintercount ] ;then
    echo 'Printer add complete'
 else [ StartPrintercount == EndPrintercount ] ;then
    echo "Printer add failed " 
  
 fi




#/bin/bash

if pgrep -af keyvis > /dev/null; then
   keyvis --kill
else
  keyvis
fi 

#!/bin/bash

find "/media/Nas/Openhab" -mtime +14 -type f -exec rm -rf {} \;
touch "/media/Nas/Openhab/touch1"
find "/media/Nas/Openhab" -type d -empty -exec rmdir {} \;

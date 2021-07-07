#!/bin/bash
cat 0310_Dealer_schedule|awk '{print $1, $2, $5, $6}'|grep -e 05:00:00" "AM -e 08:00:00" "AM -e 02:00:00" "PM -e 08:00:00" "PM -e 11:00:00" "PM
cat 0312_Dealer_schedule|awk '{print $1, $2, $5, $6}'|grep -e 05:00:00" "AM -e 08:00:00" "AM -e 02:00:00" "PM -e 08:00:00" "PM -e 11:00:00" "PM
cat 0315_Dealer_schedule|awk '{print $1, $2, $5, $6}'|grep -e 05:00:00" "AM -e 08:00:00" "AM -e 02:00:00" "PM -e 08:00:00" "PM -e 11:00:00" "PM

#!/bin/bash

#
# declare a "pseudo 2D"  array of lookup providers and their respective service calls & URLs
#
declare -A providers
# pair 0 row 0
providers[0,0]="ipecho.net"
# pair 0 row 1
providers[0,1]="curl -s ipecho.net/plain"

# pair 1 row 2
providers[1,0]="icanhazip.com"
# pair 1 row 3
providers[1,1]="curl -s icanhazip.com"

# pair 2 row 4
providers[2,0]="ifconfig.me"
# pair 2 row 5
providers[2,1]="curl -s ifconfig.me"
#
# end of array
#

#
# tell the user what we're doing - ellipses indicate they should wait
#
echo Confirming external IP consensus...
echo ---

#
# loop through the rows of the array, and for each row perform the IP lookup and print the result
# note we need to divide the total rows by 2 because they are doubled due to the pseudo 2D array
#
for ((i=0; i < (${#providers[@]} / 2 ); i++)); do
	provider=${providers[$i,0]}
	address=${providers[$i,1]}
	echo "$provider returns: $($address)"
done

#
# tell the user we're done
#
echo ---
echo ... and done.

#
# script compiled by r4mzy [r4mzy.co.za]
# 170602 - initial build
#

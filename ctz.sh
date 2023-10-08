#!/bin/bash

# Convert give time to multiple timezones
# This will help us know other teammates timezone
# when we intend to perform some actions

# Input your wished timezone here
timezones=('UTC' 'Asia/Ho_Chi_Minh' 'Asia/Shanghai' 'Europe/Moscow')
separator=' | '

# Check if `date` GNU or not
if [[ $(date --version 2> /dev/null | grep -i GNU) ]];then
    flag_gnu="true"
else
    flag_gnu="false"
fi

if [[ "$1" == "now" || -z "$1" ]];then
    timestamp=$(date +%s)
else
    if [[ "${flag_gnu}" == "true" ]];then
        timestamp=$(date --date="$1" +%s)
    else
        timestamp=$(date -j "$1" +%s)
    fi
fi

results=()
for tz in ${timezones[@]}
do
    if [[ "${flag_gnu}" == "true" ]];then
        convert_tz=$(TZ=$tz date -d "@$timestamp" +"%h %d %H:%M %Z")
    else
        convert_tz=$(TZ=$tz date -r "$timestamp" +"%h %d %H:%M %Z")
    fi

    # Convert Vietnam Timezone naming
    if [[ "$(grep "+07" <<< $convert_tz)" ]];then
        convert_tz=$(echo $convert_tz | sed "s/+07/VNZ/g")
    fi
    results+=("$convert_tz")
done

output=$(printf "${separator}%s" "${results[@]}")
output=${output:${#separator}}

echo $output

exit 0



#!/bin/bash

# Convert give time to multiple timezones
# This will help us know other teammates timezone
# when we intend to perform some actions

# Input your wished timezone here
timezones=('Asia/Ho_Chi_Minh' 'Asia/Shanghai' 'Europe/Moscow')
separator=' | '
time_format="%H:%M %Z"
timestamp=$(date -j $1 +%s)

results=()
for tz in ${timezones[@]}
do
    convert_tz=$(TZ=$tz date -jf "%s" "$timestamp" +"%H:%M %Z")

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

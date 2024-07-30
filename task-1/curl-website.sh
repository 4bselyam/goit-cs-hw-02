#!/bin/bash

websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

log_file="website_status.log"

> $log_file

check_website() {
    url=$1
    if curl -s --head --request GET $url | grep "200 OK" > /dev/null
    then
        echo "$url is UP" | tee -a $log_file
    else
        echo "$url is DOWN" | tee -a $log_file
    fi
}

for website in "${websites[@]}"
do
    check_website $website
done

echo "Results have been logged to $log_file"
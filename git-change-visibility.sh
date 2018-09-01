#!/bin/bash
set -e
ids=( `curl --request GET --header "PRIVATE-TOKEN: wYDFSNEMUbsrExMSCBWz" "https://git.nindeco.com/api/v4/projects?per_page=500" | jq -r ".[].id"` )
for id in "${ids[@]}";do
i="$id"
name=$(curl --request GET --header "PRIVATE-TOKEN: wYDFSNEMUbsrExMSCBWz" "https://git.nindeco.com/api/v4/projects/$i/" -d id="$i" | jq -r ".name")
echo $i:$name
status=$(curl --request PUT --header "PRIVATE-TOKEN: wYDFSNEMUbsrExMSCBWz" "https://git.nindeco.com/api/v4/projects/$i/" -d id="$i" -d name="$name" -d visibility="internal" | jq ".visibility")
echo $status
done

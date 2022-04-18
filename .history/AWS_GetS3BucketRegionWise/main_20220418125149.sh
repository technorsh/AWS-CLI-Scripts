IFS=$','
get_buckets=($(aws s3api list-buckets --query "Buckets[].Name"))
echo ${get_buckets[@]}
for bucket in "${get_buckets[@]}"; do
    if [[ $bucket -ne "]" || $bucket -ne "[" ]]; then
        echo "Both Strings are NOT Equal."
    else
        echo "${bucket}"
    fi
done
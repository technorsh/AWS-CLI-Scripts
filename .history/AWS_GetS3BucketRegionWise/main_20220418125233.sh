IFS=$'\n'
get_buckets=($(aws s3 ls"))
echo ${get_buckets[@]}
for bucket in "${get_buckets[@]}"; do
    if [[ $bucket -ne "]" || $bucket -ne "[" ]]; then
        echo "Both Strings are NOT Equal."
    else
        echo "${bucket}"
    fi
done
IFS=$'\n'
get_buckets=($(aws s3 ls))
for bucket in "${get_buckets[@]}"; do
    bucket_name=($bucket)
    echo ${#bucket[@]}
    echo "${bucket[2]}"
done
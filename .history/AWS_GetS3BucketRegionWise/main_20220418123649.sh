get_buckets=($(aws s3 ls))
echo ${#get_buckets[@]}
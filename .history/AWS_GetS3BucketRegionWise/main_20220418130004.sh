IFS=$'\n'
get_buckets=($(aws s3 ls))
for bucket in "${get_buckets[@]}"; do
    IFS=" "
    bucket_name=($bucket)
    echo "${bucket_name[2]}"
    get_region=(#(aws s3api get-bucket-location --bucket bucket_name[2]))
done
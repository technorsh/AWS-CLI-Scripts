IFS=$'\n'
get_buckets=($(aws s3 ls))
# echo ${get_buckets[@]}
for bucket in "${get_buckets[@]}"; do
echo " here is bucket: ${bucket}"
done
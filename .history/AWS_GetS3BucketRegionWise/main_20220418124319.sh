IFS=$'\n'
get_buckets=($(aws s3api list-buckets --query "Buckets[].Name"))
echo $get_buckets

# echo ${get_buckets[@]}
# for bucket in "${get_buckets[@]}"; do
#     echo "${bucket}"
# done
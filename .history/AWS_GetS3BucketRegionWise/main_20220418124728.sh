# IFS=$'\n'
get_buckets=($(aws s3api list-buckets --query "Buckets[].Name"))
echo ${get_buckets[@]}
for bucket in "${get_buckets[@]}"; do
    if [ $bucket != "]" ] || [ $bucket != "[" ]; then
        echo "Both Strings are NOT Equal."
    else
        echo "Both Strings are Equal."
    fi
done
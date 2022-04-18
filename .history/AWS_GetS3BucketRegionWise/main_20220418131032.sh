IFS=$'\n'
get_buckets=($(aws s3 ls))
for bucket in "${get_buckets[@]}"; do
    IFS=" "
    bucket_name=($bucket)
    get_region=$(aws s3api get-bucket-location --bucket ${bucket_name[2]})
    echo $get_region | 
done

| python -c 'import json,sys;obj=json.load(sys.stdin);print(obj["LocationConstraint"])'

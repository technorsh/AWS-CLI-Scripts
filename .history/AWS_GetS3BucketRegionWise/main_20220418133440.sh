IFS=$'\n'
get_buckets=($(aws s3 ls))
for bucket in "${get_buckets[@]}"; do
    IFS=" "
    bucket_name=($bucket)
    get_region=$(aws s3api get-bucket-location --bucket ${bucket_name[2]})
    region=$(echo $get_region | python -c 'import json,sys;obj=json.load(sys.stdin);print(obj["LocationConstraint"])')
    if [[region == "eu-west-2"]]; do
        echo ${bucket_name[2]} " " $region
    if [[region == "ap-south-1"]]; do 
        echo echo ${bucket_name[2]} " " $region
        
done
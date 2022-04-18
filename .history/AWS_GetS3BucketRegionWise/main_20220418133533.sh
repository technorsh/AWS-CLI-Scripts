IFS=$'\n'
get_buckets=($(aws s3 ls))
for bucket in "${get_buckets[@]}"; do
    IFS=" "
    bucket_name=($bucket)
    get_region=$(aws s3api get-bucket-location --bucket ${bucket_name[2]})
    region=$(echo $get_region | python -c 'import json,sys;obj=json.load(sys.stdin);print(obj["LocationConstraint"])')
    if [[region -eq "eu-west-2"]]; do
        echo ${bucket_name[2]} " " $region
    if [[region -eq "ap-south-1"]]; do 
        echo ${bucket_name[2]} " " $region
    else
        echo ${bucket_name[2]} " " "us-east-1"
    fi
done
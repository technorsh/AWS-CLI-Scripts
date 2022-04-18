IFS=$'\n'
get_buckets=($(aws s3 ls))
for bucket in "${get_buckets[@]}"; do
    IFS=" "
    bucket_name=($bucket)
    get_region=$(aws s3api get-bucket-location --bucket ${bucket_name[2]})
    region=$(echo $get_region | python -c 'import json,sys;obj=json.load(sys.stdin);print(obj["LocationConstraint"])')
    if [[ "$region" -eq "eu-west-2" ]] 
    then
        echo "${bucket_name[2]},$region" >> eu-west-2.csv
    elif [[ "$region" -eq "ap-south-1" ]] 
    then
        echo "${bucket_name[2]},$region" >> ap-south-1.csv
    else
        echo "${bucket_name[2]},'us-east-1" >> us-east-1.csv
    fi
done
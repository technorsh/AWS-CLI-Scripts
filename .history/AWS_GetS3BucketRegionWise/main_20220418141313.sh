#!/bin/sh

# We can set the Bucket file name of specific region here.

london_file="eu-west-2.csv"
mumbai_file="ap-south-1.csv"
n_virginia_file="us-east-1.csv"

# Here we will check that name file exist or not.

if [[ -f "$london_file" || -f "$mumbai_file" || -f "$n_virginia_file" ]]; then
    rm $london_file $mumbai_file $n_virginia_file
else
    # If file name not exist we will fetch the details from the AWS S3 Bucket & create file with region wise
    
    IFS=$'\n'
    get_buckets=($(aws s3 ls))
    echo "BUCKET NAME" "   " "REGION"
    for bucket in "${get_buckets[@]}"; do
        IFS=" "
        bucket_name=($bucket)
        get_region=$(aws s3api get-bucket-location --bucket ${bucket_name[2]})
        region=$(echo $get_region | python -c 'import json,sys;obj=json.load(sys.stdin);print(obj["LocationConstraint"])')
        echo ${bucket_name[2]} " " $(if [[ "$region" = 'None' ]]; then echo "us-east-1"; else echo "$region"; fi)
        if [[ "$region" -eq "eu-west-2" ]] 
        then
            echo "${bucket_name[2]},$region" >> $london_file
        elif [[ "$region" -eq "ap-south-1" ]] 
        then
            echo "${bucket_name[2]},$region" >> $mumbai_file
        else
            echo "${bucket_name[2]},'us-east-1'" >> $n_virginia_file
        fi
    done
fi
# File should only contain Parameter Name and Value ( Ex:- Name,value ) 
if [ $1 ]; then
    echo "Parameter Name : Value"
    while IFS="," read -r Name Value
    do
    echo "$Name : $Value"
    aws ssm put-parameter \
        --name $Name \
        --value $Value \
        --type String
    done < $1
else
    echo "Enter .csv file name"
fi

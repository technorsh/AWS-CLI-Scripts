#!/bin/sh

# Requirements :-
    # Run :-
    #    aws configure ( to specific region where you want to your ssm parameter to be copied from )
    #
    # Get all value of SSM Parameter in JSON :-
    #
    # Run :- 
    #       aws ssm get-parameters-by-path --path / --with-decryption > <JSON File name>
    #
# Install :- 
#   1) Pandas ( pip3 install pandas )
#   2) touch <CSV File name>

echo '---- Configure AWS ---- \n'
aws configure
echo '---- Getting SSM Parameter from AWS ---- \n'
aws ssm get-parameters-by-path --path / --with-decryption > ssm.json
echo '\n\n---- SSM Parameter Saved to ssm.json file ---- \n'
echo '\n---- Installing Pandas Library ---- \n'
pip3 install pandas
echo '\n---- Installed Succesfully---- \n'
echo '\n---- Created a file '$1' ---- \n'
touch $1
echo '\n---- Done with file creation '$1' ---- \n'

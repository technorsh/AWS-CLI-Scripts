#!/bin/sh

# Requirements :-
    # Run :-
    #    aws configure ( to specific region where you want to cloud watch logs to be copied from )
    #
    # Get all CloudWatch log Groups in JSON :-
    #
    # Run :- 
    #       aws logs describe-log-groups > <JSON File name>
    #
# Install Dependencies:- 
#   1) Pandas ( pip3 install pandas )
#   2) touch <CSV File name>

echo '---- Configure AWS ---- \n'
aws configure
echo '---- Getting CloudWatch log groups from AWS ---- \n'
aws logs describe-log-groups > lg.json
echo '\n\n---- CloudWatch Log Group Saved to lg.json file ---- \n'
echo '\n---- Installing Pandas Library ---- \n'
pip3 install pandas
echo '\n---- Installed Succesfully---- \n'
echo '\n---- Created a file '$1' ---- \n'
touch $1
echo '\n---- Done with file creation '$1' ---- \n'

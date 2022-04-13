import pandas as pd
import sys
import subprocess

subprocess.call(["./scripts.sh",sys.argv[1]])

df = pd.read_json("lg.json")
logGroups = df["logGroups"]
logGroups_arr = map(lambda x: x,logGroups)
logGroups_df = pd.DataFrame(list(logGroups_arr), columns = ['logGroupName', 'retentionInDays'])
logGroups_df.to_csv (sys.argv[1], sep=",",index=False)
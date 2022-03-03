# Run :- 
#   chmod +x scripts.sh
#   python3 ssm_json_to_csv.py <JSON File name> <CSV File name>

import pandas as pd
import sys
import subprocess
subprocess.call(["./scripts.sh",sys.argv[1]])
df = pd.read_json("ssm.json") # temporary file > ssm.json
df = df["Parameters"]
a = map(lambda x: x,df)
df = pd.DataFrame(list(a))
df.to_csv (sys.argv[1], sep=",",index=False)
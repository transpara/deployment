import json
import random
import time
from copy import deepcopy
import os
import requests

# f = open("./metrics.txt", "w")
# for i in range(10000):
#     f.write(f"meter-monthly-consumption|{i}|0|1000\n")

TSTORE_HOST = os.getenv("TSTORE_HOST", "192.168.1.99")
TSTORE_PORT = os.getenv("TSTORE_PORT", "10001")

tstore = f"http://{TSTORE_HOST}:{TSTORE_PORT}/api/v1/write"   

dict = {  
    "labels":{},  
    "samples":[]  
}  


while True:
    try:
        f = open("./metrics.txt", "r")
        payload = []
        now_millis = list(str(int(time.time()*1000.0)))
        now_millis[-1] = 0
        now_millis[-2] = 0
        now_millis[-3] = 0
        #promscale doesnt like millisecond precision lol
        now_millis = int("".join(map(str, now_millis)))
        metrics = 0
        for line in f:
            metrics = metrics + 1
            split = line.split("|")
            metric = split[0]
            meter_id = split[1]
            start_range = split[2]
            end_range = split[3]
            new_dict = deepcopy(dict)
            new_dict["samples"].append([now_millis, random.randint(int(start_range), int(end_range))])
            new_dict["labels"] = {"__name__": f"{metric}", "meter_id": meter_id}
            payload.append(json.dumps(new_dict))
        streamed_json = "\n".join(payload)   
        response = requests.post(tstore, data=streamed_json)
        print(f"populataed {metrics} metrics")
        time.sleep(30)
    except BaseException as e:
        print(str(e))
        pass

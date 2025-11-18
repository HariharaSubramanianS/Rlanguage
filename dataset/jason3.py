import json

with open("data1.json", "r") as f:
    data = json.load(f)

print(data)
a = {
    "name": "balaji",
    "age": 25,
    "place": "chennai"
}

# Write JSON
file = open("data.json", "w")
file.write(str(a))
file.close()

# Read JSON
file = open("data.json", "r")
print(file.read())
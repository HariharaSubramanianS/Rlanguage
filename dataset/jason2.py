import json

# Step 1: Gather user input
data = {}
data['name'] = input("Enter your name: ")
data['age'] = int(input("Enter your age: "))
data['is_student'] = input("Are you a student? (yes/no): ").strip().lower() == "yes"

# Step 2: Write to JSON file
with open('data1.json', 'w') as f:
    json.dump(data, f, indent=4)

print("Data written to data1.json")
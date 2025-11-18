import sqlite3
import random

# Connect to SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect("school.db")
cursor = conn.cursor()

# Drop table if already exists (for rerun safety)
cursor.execute("DROP TABLE IF EXISTS students")

# Create student table
cursor.execute("""
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_name TEXT NOT NULL,
    class INTEGER NOT NULL,
    teacher_name TEXT NOT NULL,
    average_mark REAL
)
""")

# Sample data
student_names = [
    "Arun", "Bala", "Chitra", "Divya", "Elango", 
    "Farhan", "Gowri", "Hari", "Indira", "Jaya",
    "Karthik", "Lakshmi", "Meena", "Naveen", "Omkar",
    "Priya", "Qureshi", "Ravi", "Sandhya", "Tamil",
    "Uma", "Vignesh", "Waheeda", "Xavier", "Yamini"
]

teachers = ["Mr. Kumar", "Mrs. Anitha", "Mr. Ramesh", "Mrs. Kavitha", "Mr. Suresh"]

# Insert 25 students into table
for i in range(25):
    name = student_names[i]
    class_num = (i % 5) + 1   
    teacher = teachers[class_num - 1]
    avg_mark = round(random.uniform(40, 100), 2)  
    
    cursor.execute("""
    INSERT INTO students (student_name, class, teacher_name, average_mark)
    VALUES (?, ?, ?, ?)
    """, (name, class_num, teacher, avg_mark))

# Commit and close
conn.commit()

# Step 3: Data Analysis
print("\n=== Student Data Analysis ===\n")


# 1. Highest Mark Student
cursor.execute("SELECT student_name, average_mark FROM students ORDER BY average_mark DESC LIMIT 1")
print("Top Student:", cursor.fetchone())

# 2. Lowest Mark Student
cursor.execute("SELECT student_name, average_mark FROM students ORDER BY average_mark ASC LIMIT 1")
print("Lowest Student:", cursor.fetchone())

# 3. Class-wise Average Marks
cursor.execute("SELECT class, average_mark FROM students GROUP BY class")
print("\nClass-wise Average Marks:")
for row in cursor.fetchall():
    print(row)

# 4. Teacher-wise Average Marks
cursor.execute("SELECT teacher_name , average_mark FROM students GROUP BY teacher_name")
print("\nTeacher-wise Average Marks:")
for row in cursor.fetchall():
    print(row)

# 5. Pass/Fail Count (Pass mark = 50)
cursor.execute("SELECT COUNT(*) FROM students WHERE average_mark >= 50")
passed = cursor.fetchone()[0]

cursor.execute("SELECT COUNT(*) FROM students WHERE average_mark < 50")
failed = cursor.fetchone()[0]

print("\nPass Count:", passed)
print("Fail Count:", failed)

# 6. Total Students
cursor.execute("SELECT COUNT(*) FROM students")
print("\nTotal Students:", cursor.fetchone()[0])

# Close DB
conn.close
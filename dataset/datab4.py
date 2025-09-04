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
conn.close()

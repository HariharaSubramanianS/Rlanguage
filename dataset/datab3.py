import sqlite3
import random

# Connect to SQLite database (creates a new one if it doesn't exist)
conn = sqlite3.connect("company.db")
cursor = conn.cursor()

# Step 1: Create employee table
cursor.execute("""
CREATE TABLE IF NOT EXISTS employees (
    emp_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    designation TEXT NOT NULL,
    salary REAL NOT NULL,
    years_experience INTEGER NOT NULL
)
""")

# Step 2: Insert 20 Employee Records
names = ["Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Hannah",
         "Ivan", "Jack", "Karen", "Leo", "Mona", "Nina", "Oscar", "Paul",
         "Queen", "Ryan", "Sophia", "Tom"]

designations = ["Software Engineer", "Data Analyst", "Manager", "HR Executive", "Team Lead"]

# Insert random employee data
for name in names:
    designation = random.choice(designations)
    salary = random.randint(30000, 120000)       # Salary range
    exp = random.randint(1, 15)                  # Years of experience
    cursor.execute("INSERT INTO employees (name, designation, salary, years_experience) VALUES (?, ?, ?, ?)",
                   (name, designation, salary, exp))

conn.commit()

# Step 3: Data Analysis
print("\n=== Employee Data Analysis ===\n")

# 1. Average Salary
cursor.execute("SELECT AVG(salary) FROM employees")
print("Average Salary:", round(cursor.fetchone()[0], 2))

# 2. Highest Paid Employee
cursor.execute("SELECT name, designation, salary FROM employees ORDER BY salary DESC LIMIT 1")
print("Highest Paid Employee:", cursor.fetchone())

# 3. Salary by Designation
cursor.execute("SELECT designation, AVG(salary) FROM employees GROUP BY designation")
print("\nAverage Salary by Designation:")
for row in cursor.fetchall():
    print(row)

# 4. Most Experienced Employee
cursor.execute("SELECT name, designation, years_experience FROM employees ORDER BY years_experience DESC LIMIT 1")
print("\nMost Experienced Employee:", cursor.fetchone())

# 5. Total Payroll
cursor.execute("SELECT SUM(salary) FROM employees")
print("Total Payroll:", cursor.fetchone()[0])

# Close connection
conn.close()
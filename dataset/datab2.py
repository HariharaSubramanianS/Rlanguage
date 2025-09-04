import sqlite3

# Connect to SQLite database (program creates if not exists)
connection = sqlite3.connect("employee.db")
cursor = connection.cursor()

try:
    # 1. Create employee table
    create_table = '''
    CREATE TABLE IF NOT EXISTS employees(
        employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
        employee_name TEXT NOT NULL,
        employee_work TEXT NOT NULL,
        employee_salary REAL
    )
    '''
    cursor.execute(create_table)
    connection.commit()

    # 2. Insert sample employees
    insert_query = "INSERT INTO employees (employee_name, employee_work, employee_salary) VALUES (?, ?, ?)"
    employees = [
        ("Hari", "Software Developer", 50000),
        ("Afzal", "Data Analyst", 45000),
        ("Rukku", "HR Manager", 60000),
        ("Santhosh", "UI Designer", 40000)
    ]

    cursor.executemany(insert_query, employees)
    connection.commit()

    # 3. Read and display employees
    print("Employee Records:")
    result = cursor.execute("SELECT * FROM employees")
    for row in result.fetchall():
        print(row)

finally:
    connection.close()
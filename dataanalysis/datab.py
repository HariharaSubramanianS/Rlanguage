import sqlite3

# Connect to SQLite database (it will be created if it doesn't exist)
connection = sqlite3.connect("program.db")
cursor = connection.cursor()

try:
    # 1. Create table if not exists
    create_table = '''
    CREATE TABLE IF NOT EXISTS users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT
    )
    '''
    cursor.execute(create_table)
    connection.commit()

    # 2. Insert data
    insert_query = "INSERT INTO users (name, email) VALUES (?, ?)"
    cursor.execute(insert_query, ("Hari", "hari@example.com"))
    connection.commit()

    # 3. Read data
    print("All users:")
    result = cursor.execute("SELECT * FROM users")
    for row in result.fetchall():
        print(row)

    # 4. Update data
    update_query = "UPDATE users SET name = ? WHERE id = ?"
    cursor.execute(update_query, ("Afzal", 1))
    connection.commit()

    result = cursor.execute("SELECT * FROM users")
    print("After update:")
    for row in result.fetchall():
        print(row)

    # 5. Delete data
    delete_query = "DELETE FROM users WHERE id = ?"
    cursor.execute(delete_query, (1,))  # Note: comma to make it a tuple
    connection.commit()

    result = cursor.execute("SELECT * FROM users")
    print("After delete:")
    for row in result.fetchall():
        print(row)

finally:
    connection.close()
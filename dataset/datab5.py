import sqlite3
import pandas as pd

def csv_to_sqlite(csv_file, sqlite_file, table_name):
    df = pd.read_csv(csv_file)

    conn = sqlite3.connect(sqlite_file)
    df.to_sql(table_name, conn, if_exists='replace', index=False)

    conn.commit()
    conn.close()
    print(f"CSV data from '{csv_file}' has been written to '{sqlite_file}' in table '{table_name}'.")

csv_to_sqlite("healthcare_dataset.csv", "healthcare-sqlite", "health")



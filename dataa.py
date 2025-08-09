import pandas as pd
import random
from datetime import datetime, timedelta

# Sample district data
districts = [
    ("Northeast", "Manhattan, NY"),
    ("West", "Downtown, LA, CA"),
    ("South", "Buckhead, GA"),
    ("Midwest", "Loop, Chicago, IL"),
    ("Northeast", "Back Bay, Boston"),
    ("West", "SoMa, SF, CA"),
    ("South", "The Heights, TX"),
    ("Midwest", "Downtown, Detroit"),
    ("Northeast", "Fishtown, Philly"),
    ("West", "Capitol Hill, WA"),
    ("South", "French Quarter, LA"),
    ("Midwest", "Uptown, Minneapolis"),
    ("West", "Pearl District, OR"),
    ("Northeast", "Chelsea, NY"),
    ("South", "Hyde Park, Tampa"),
    ("West", "Beverly Hills, CA"),
    ("Midwest", "Short North, Columbus"),
    ("Northeast", "Downtown, Providence"),
    ("South", "Midtown, Atlanta"),
    ("West", "Hillcrest, San Diego"),
]

# Generate data
data = []
start_date = datetime(2025, 7, 1)

for i in range(1000):
    date = (start_date + timedelta(days=i % 10)).strftime('%Y-%m-%d')
    region, district = random.choice(districts)
    store_id = 100 + i
    units_sold = random.randint(50, 130)
    cost = random.randint(5000, 12000)
    profit = random.randint(1000, 4000)
    sales = cost + profit
    discount = random.choice([5, 6, 7, 8, 9, 10])
    satisfaction = round(random.uniform(4.0, 4.9), 1)

    data.append([
        date, region, district, store_id, units_sold,
        sales, cost, profit, discount, satisfaction
    ])

# Define column names
columns = [
    "Date", "Region", "District", "Store ID", "Units Sold",
    "Sales ($)", "Cost ($)", "Profit ($)", "Discount (%)", "Customer Satisfaction"
]

# Create DataFrame and save as CSV
df = pd.DataFrame(data, columns=columns)
df.to_csv("american_district_sales_data.csv", index=False)

print("CSV file 'american_district_sales_data.csv' has been saved.")
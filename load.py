import pandas as pd
from sqlalchemy import create_engine

# Load your Excel file into a DataFrame
df = pd.read_excel('sales_inventory.xlsx')

# PostgreSQL connection details
user = 'imrul'
password = 'imrul'
host = 'localhost'
port = '5432'
database = 'datacloud'
schema = 'public'  # Replace with your schema name

# Create the SQLAlchemy engine
connection_string = f'postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}'
engine = create_engine(connection_string)

# Write the DataFrame to a PostgreSQL table within the specified schema
df.to_sql('sales_inventory', engine, if_exists='replace', index=False, schema=schema)

# Close the connection
engine.dispose()

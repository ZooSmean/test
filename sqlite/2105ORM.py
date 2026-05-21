import sqlite3

class User:
    def __init__(self, id, name, age, email):
        self.id = id
        self.name = name
        self.age = age
        self.email = email

class SimpleORM:
    def __init__(self, db_name):
        self.conn = sqlite3.connect(db_name)
        self.cursor = self.conn.cursor()

    def create_table(self, table_name, **columns):
        columns_with_type = ', '.join([f'{col} {dtype}' for col, dtype in columns.items()])
        self.cursor.execute(f'CREATE TABLE IF NOT EXISTS {table_name} (id INTEGER PRIMARY KEY, {columns_with_type})')
        self.conn.commit()

    def insert(self, table_name, **data):
        columns = ', '.join(data.keys())
        placeholder = ', '.join(['?']*len(data))
        self.cursor.execute(f'INSERT INTO {table_name} ({columns}) VALUES({placeholder})', tuple(data.values()))
        self.conn.commit()

test = SimpleORM('test.db')
test.create_table('users', name='TEXT', age='INTEGER')
test.insert('users', name='Kate', age=27)
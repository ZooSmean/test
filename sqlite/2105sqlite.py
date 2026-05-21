import sqlite3

db = sqlite3.connect("exemple.db")

cursor = db.cursor()

cursor.execute("""
               CREATE TABLE IF NOT EXISTS users(
               id INTEGER PRIMARY KEY
               ,name TEXT NOT NULL
               ,age INTEGER
               )
               """)

try:
    cursor.execute("""INSERT INTO users(name, age) VALUES('Daniil', 11)""")
    cursor.execute("""INSERT INTO users(name, age) VALUES('X3', 2)""")
    raise Exception('Unknown error')
    db.commit()
except Exception as e:
    db.rollback()
    print('Error:', e)


cursor.execute("""SELECT * FROM users""")
users = cursor.fetchall()
for i in users:
    print(i)

db.close()

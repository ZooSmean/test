import sqlite3
import random

db = sqlite3.connect("exemple.db")

cursor = db.cursor()

cursor.execute("""
               CREATE TABLE IF NOT EXISTS users_1(
               id INTEGER PRIMARY KEY
               ,name TEXT NOT NULL
               ,age INTEGER
               ,email VARCHAR(50)
               )
               """)

random_names = ['Anna', 'Kate', 'Diana']
random_email = ['Anna@mail.ru', 'Kate@mail.ru', 'Diana@mail.ru']

for j in range(10):
    age = random.randint(1, 99)
    name = random.choice(random_names)
    email = random.choice(random_email)
    cursor.execute("""INSERT INTO users_1(name, age, email) VALUES(?, ?, ?)
               """, (name, age, email))

cursor.execute("""SELECT * FROM users_1""")
users = cursor.fetchall()
for i in users:
    print(i)


db.close()

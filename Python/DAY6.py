"""•Write a Script where establish a connection to db •Write a DDL to create a table (columns: Name, Rollno, Subject1, Subject2, Subject3)
•insert 5 rows with values
•Do a count() the table
•update query to modify existing records
•delete the table
•finally drop table """

import sqlite3
conn = sqlite3.connect('training.db')
c = conn.cursor()

c.execute('''CREATE TABLE markNew
            #(name varchar(20), rollno integer , sub1 integer, sub2 integer,sub3 )''')

c.execute("INSERT INTO markNew VALUES ('kiruthika',101,98,89,96)")
c.execute("INSERT INTO markNew VALUES ('kothai',102,78,76,96)")
c.execute("INSERT INTO markNew VALUES ('swathi',103,95,89,95)")
c.execute("INSERT INTO markNew VALUES ('priya',104,97,86,93)")
c.execute("update markNew SET sub1=99 where rollno=101")
c.execute("select count(name) from markNew ")
x=c.fetchone()
print(x)
c.execute("update markNew SET name='nithya' where name='priya'")
c.execute("select * from markNew")
result = c.fetchall() 
for r in result:
    print(r)

c.execute("drop table markNew")

conn.commit()
conn.close()

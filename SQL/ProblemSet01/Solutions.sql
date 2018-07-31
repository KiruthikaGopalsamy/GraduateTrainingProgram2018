<PROBLEM SET 01> JULY 31,2018
 SUBMITTED BY kiruthika.gopalsamy
 
CREATE TABLE GUEST (GUEST_NO CHAR(4) PRIMARY KEY, NAME CHAR(20),CITY CHAR(20));
INSERT INTO GUEST VALUES('G256','ADAM WAYNE','PITTSBURGH');
INSERT INTO GUEST VALUES('G367','TARA CUMMINGS','BALTIMORE');
INSERT INTO GUEST VALUES('G879','VANESSA PARRY','PITTSBURGH');
INSERT INTO GUEST VALUES('G230','TOM HANCOCK','PHILADELPHIA');
INSERT INTO GUEST VALUES('G467','ROBERT SWIFT','ATLANTA');
INSERT INTO GUEST VALUES('G190','EDWARD CANE','BALTIMORE');
mysql> select * from guest;
+----------+---------------+--------------+
| GUEST_NO | NAME          | CITY         |
+----------+---------------+--------------+
| G190     | EDWARD CANE   | BALTIMORE    |
| G230     | TOM HANCOCK   | PHILADELPHIA |
| G256     | ADAM WAYNE    | PITTSBURGH   |
| G367     | TARA CUMMINGS | BALTIMORE    |
| G467     | ROBERT SWIFT  | ATLANTA      |
| G879     | VANESSA PARRY | PITTSBURGH   |
+----------+---------------+--------------+
6 rows in set (0.06 sec)
CREATE TABLE HOTEL(HOTEL_NO VARCHAR(5) PRIMARY KEY,NAME VARCHAR(20),CITY VARCHAR(20));
INSERT INTO HOTELS VALUES("H111","EMPIRE HOTEL","NEW YORK");
INSERT INTO HOTELS VALUES("H235","PARK PLACE","NEW YORK");
INSERT INTO HOTELS VALUES("H432","BROWNSTONE HOTEL","TORONTO");
INSERT INTO HOTELS VALUES("H498","JAMES PLAZA","TORONTO");
INSERT INTO HOTELS VALUES("H193","DEVON HOTEL","BOSTON");
INSERT INTO HOTELS VALUES("H437","CLAIRMONT HOTEL","BOSTON");

mysql> select * from hotel;
+----------+------------------+----------+
| HOTEL_NO | NAME             | CITY     |
+----------+------------------+----------+
| H111     | EMPIRE HOTEL     | NEW YORK |
| H193     | DEVON HOTEL      | BOSTON   |
| H235     | PARK PLACE       | NEW YORK |
| H432     | BROWNSTONE HOTEL | TORONTO  |
| H437     | CLAIRMONT HOTEL  | BOSTON   |
| H498     | JAMES PLAZA      | TORONTO  |
+----------+------------------+----------+
6 rows in set (0.00 sec)
create table Room(Room_No varchar(20),Hotel_NO varchar(20) references Hotels(Hotel_NO),Type varchar(20),Price int(10),primary key(Room_No,Hotel_NO));
Query OK, 0 rows affected (0.08 sec)
INSERT INTO ROOM VALUES(313,'H111','S',145.00);
INSERT INTO ROOM VALUES(412,'H111','N',145.00);
INSERT INTO ROOM VALUES(1267,'H235','N',175.00);
INSERT INTO ROOM VALUES(1289,'H235','N',195.00);
INSERT INTO ROOM VALUES(876,'H432','S',124.00);
INSERT INTO ROOM VALUES(898,'H432','S',124.00);
INSERT INTO ROOM VALUES(345,'H498','N',160.00);
INSERT INTO ROOM VALUES(467,'H498','N',180.00);
INSERT INTO ROOM VALUES(1001,'H193','S',150.00);
INSERT INTO ROOM VALUES(1201,'H193','N',175.00);
INSERT INTO ROOM VALUES(257,'H437','N',140.00);
INSERT INTO ROOM VALUES(223,'H437','N',155.00);
mysql> select * from room;
+---------+----------+------+-------+
| Room_No | Hotel_NO | Type | Price |
+---------+----------+------+-------+
| 1001    | H193     | S    |   150 |
| 1201    | H193     | N    |   175 |
| 1267    | H235     | N    |   175 |
| 1289    | H235     | N    |   195 |
| 223     | H437     | N    |   155 |
| 257     | H437     | N    |   140 |
| 313     | H111     | S    |   145 |
| 345     | H498     | N    |   160 |
| 412     | H111     | N    |   145 |
| 467     | H498     | N    |   180 |
| 876     | H432     | S    |   124 |
| 898     | H432     | S    |   124 |
+---------+----------+------+-------+
12 rows in set (0.03 sec)
create table Booking(Hotel_NO varchar(20) references Hotel(Hotel_NO) ,Guest_No varchar(20) references Guest(Guest_No)  ,Date_from varchar(20),Date_to varchar(20),Room_No varchar(20) references room(Room_No),primary key(Hotel_NO,Guest_No,Room_No));
Query OK, 0 rows affected (0.20 sec)
INSERT INTO BOOKING VALUES('H111','G256','10-AUG-99','15-AUG-99',412);
 INSERT INTO BOOKING VALUES('H111','G367','18-AUG-99','21-AUG-99',412);
INSERT INTO BOOKING VALUES('H235','G879','05-SEP-99','12-SEP-99',1267);
 INSERT INTO BOOKING VALUES('H498','G230','15-SEP-99','18-SEP-99',467);
 INSERT INTO BOOKING VALUES('H498','G256','30-NOV-99','02-DEC-99',345);
INSERT INTO BOOKING VALUES('H498','G467','03-NOV-99','05-NOV-99',345);
 INSERT INTO BOOKING VALUES('H193','G190','15-NOV-99','19-NOV-99',1001);
 INSERT INTO BOOKING VALUES('H193','G367','12-SEP-99','14-SEP-99',1001); 
INSERT INTO BOOKING VALUES('H193','G367','01-OCT-99','06-OCT-99',1201);
INSERT INTO BOOKING VALUES('H437','G190','04-OCT-99','06-OCT-99',223);
INSERT INTO BOOKING VALUES('H437','G879','14-SEP-99','17-SEP-99',223);
mysql> select * from booking;
+----------+----------+-----------+-----------+---------+
| Hotel_NO | Guest_No | Date_from | Date_to   | Room_No |
+----------+----------+-----------+-----------+---------+
| H111     | G256     | 10-AUG-99 | 15-AUG-99 | 412     |
| H111     | G367     | 18-AUG-99 | 21-AUG-99 | 412     |
| H193     | G190     | 15-NOV-99 | 19-NOV-99 | 1001    |
| H193     | G367     | 12-SEP-99 | 14-SEP-99 | 1001    |
| H193     | G367     | 01-OCT-99 | 06-OCT-99 | 1201    |
| H235     | G879     | 05-SEP-99 | 12-SEP-99 | 1267    |
| H437     | G190     | 04-OCT-99 | 06-OCT-99 | 223     |
| H437     | G879     | 14-SEP-99 | 17-SEP-99 | 223     |
| H498     | G230     | 15-SEP-99 | 18-SEP-99 | 467     |
| H498     | G256     | 30-NOV-99 | 02-DEC-99 | 345     |
| H498     | G467     | 03-NOV-99 | 05-NOV-99 | 345     |
+----------+----------+-----------+-----------+---------+
11 rows in set (0.00 sec)
1.List full details of all hotels.
mysql> select *from hotel;
+----------+------------------+----------+
| HOTEL_NO | NAME             | CITY     |
+----------+------------------+----------+
| H111     | EMPIRE HOTEL     | NEW YORK |
| H193     | DEVON HOTEL      | BOSTON   |
| H235     | PARK PLACE       | NEW YORK |
| H432     | BROWNSTONE HOTEL | TORONTO  |
| H437     | CLAIRMONT HOTEL  | BOSTON   |
| H498     | JAMES PLAZA      | TORONTO  |
+----------+------------------+----------+
6 rows in set (0.00 sec)
2.List full details of all hotels in New York.
mysql> select * from hotel where city= 'new york';
+----------+--------------+----------+
| HOTEL_NO | NAME         | CITY     |
+----------+--------------+----------+
| H111     | EMPIRE HOTEL | NEW YORK |
| H235     | PARK PLACE   | NEW YORK |
+----------+--------------+----------+
3.List the names and cities of all guests, ordered according to their cities.
mysql> select  name,city from guest order by city;
+---------------+--------------+
| name          | city         |
+---------------+--------------+
| ROBERT SWIFT  | ATLANTA      |
| EDWARD CANE   | BALTIMORE    |
| TARA CUMMINGS | BALTIMORE    |
| TOM HANCOCK   | PHILADELPHIA |
| ADAM WAYNE    | PITTSBURGH   |
| VANESSA PARRY | PITTSBURGH   |
+---------------+--------------+
4.List all details for non-smoking rooms in ascending order of price.
 select *from room where type ='n' order by price;
+---------+----------+------+-------+
| Room_No | Hotel_NO | Type | Price |
+---------+----------+------+-------+
| 257     | H437     | N    |   140 |
| 412     | H111     | N    |   145 |
| 223     | H437     | N    |   155 |
| 345     | H498     | N    |   160 |
| 1201    | H193     | N    |   175 |
| 1267    | H235     | N    |   175 |
| 467     | H498     | N    |   180 |
| 1289    | H235     | N    |   195 |
+---------+----------+------+-------+

5.List the number of hotels there are.
 select count(*) from hotel;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
6.List the cities in which guests live. Each city should be listed only once.
 select distinct city from guest;
+--------------+
| city         |
+--------------+
| BALTIMORE    |
| PHILADELPHIA |
| PITTSBURGH   |
| ATLANTA      |
+--------------+
7.List the average price of a room.
select avg(price) as Avg_price from room;
+-----------+
| Avg_price |
+-----------+
|  155.6667 |
+-----------+
8.List hotel names, their room numbers, and the type of that room.
select name, room_no, type from hotel inner join room on room.hotel_no=hotel.hotel_no;
+------------------+---------+------+
| name             | room_no | type |
+------------------+---------+------+
| EMPIRE HOTEL     | 313     | S    |
| EMPIRE HOTEL     | 412     | N    |
| DEVON HOTEL      | 1001    | S    |
| DEVON HOTEL      | 1201    | N    |
| PARK PLACE       | 1267    | N    |
| PARK PLACE       | 1289    | N    |
| BROWNSTONE HOTEL | 876     | S    |
| BROWNSTONE HOTEL | 898     | S    |
| CLAIRMONT HOTEL  | 223     | N    |
| CLAIRMONT HOTEL  | 257     | N    |
| JAMES PLAZA      | 345     | N    |
| JAMES PLAZA      | 467     | N    |
+------------------+---------+------+
9.List the hotel names, booking dates, and room numbers for all hotels in New York.
mysql> select name,date_from,date_to,room_no from hotel inner join booking on booking.hotel_no=hotel.hotel_no where city='new york';
+--------------+-----------+-----------+---------+
| name         | date_from | date_to   | room_no |
+--------------+-----------+-----------+---------+
| EMPIRE HOTEL | 10-AUG-99 | 15-AUG-99 | 412     |
| EMPIRE HOTEL | 18-AUG-99 | 21-AUG-99 | 412     |
| PARK PLACE   | 05-SEP-99 | 12-SEP-99 | 1267    |
+--------------+-----------+-----------+---------+
10.What is the number of bookings that started in the month of September?
 select count(*) from booking where date_from like '__-SEP-99';
+----------+
| count(*) |
+----------+
|        4 |
+----------+
11.List the names and cities of guests who began a stay in New York in August.
 select name , city from hotel inner join booking on booking.hotel_no=hotel.hotel_no where city='NEW YORk' AND date_from like '__-AUG-99';
+--------------+----------+
| name         | city     |
+--------------+----------+
| EMPIRE HOTEL | NEW YORK |
| EMPIRE HOTEL | NEW YORK |
+--------------+----------+
2 rows in set (0.00 sec)

12.List the hotel names and room numbers of any hotel rooms that have not been booked.
select name ,room_no from hotel inner join room on room.hotel_no=hotel.hotel_no where room_no not in(select room_no from booking);
+------------------+---------+
| name             | room_no |
+------------------+---------+
| EMPIRE HOTEL     | 313     |
| PARK PLACE       | 1289    |
| BROWNSTONE HOTEL | 876     |
| BROWNSTONE HOTEL | 898     |
| CLAIRMONT HOTEL  | 257     |
+------------------+---------+
13.List the hotel name and city of the hotel with the highest priced room.
select name,city from hotel inner join room on room.hotel_no=hotel.hotel_no where price >=(select max(price ) from room);
+------------+----------+
| name       | city     |
+------------+----------+
| PARK PLACE | NEW YORK |
+------------+----------+
14.List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.
 select name,room_no,city,price from hotel inner join room on room.hotel_no=hotel.hotel_no where price<(select MIN(price) from room inner join hotel on hotel.hotel_no=room.hotel_no where city='Boston');
+------------------+---------+---------+-------+
| name             | room_no | city    | price |
+------------------+---------+---------+-------+
| BROWNSTONE HOTEL | 876     | TORONTO |   124 |
| BROWNSTONE HOTEL | 898     | TORONTO |   124 |
+------------------+---------+---------+-------+
2 rows in set (0.03 sec)
15.List the average price of a room grouped by city.
  select city, avg(price) from room inner join hotel on hotel.hotel_no=room.hotel_no group by city;
+----------+------------+
| city     | avg(price) |
+----------+------------+
| BOSTON   |   155.0000 |
| NEW YORK |   165.0000 |
| TORONTO  |   147.0000 |
+----------+------------+
3 rows in set (0.00 sec)

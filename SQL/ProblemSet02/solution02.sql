<PROBLEM SET 01> AUGUST 21,2018
 SUBMITTED BY kiruthika.gopalsamy




1.Write a valid SQL statement that calculates the total weight of all corn cobs that were picked from the garden:

sqlite> select sum(pi.weight) from picked pi inner join plant on pi.plantFK=plant.plantid where name='Corn';
17.54

2.For some reason Erin has change his location for picking the tomato to North. Write the corresponding query.
sqlite> update picked set locationFK=(select locationid  from location where name='North') where plantFk=(select plantid from plant where name='Tomato')and gardenerFk =(select gardenerid  from Gardener where name='Erin');
sqlite> select * from picked;
0|2|0|18-AUG-2012|28|2.32
0|3|1|16-AUG-2012|12|1.02
2|1|3|22-AUG-2012|52|12.96
2|2|2|28-AUG-2012|18|4.58
3|3|1|22-AUG-2012|15|3.84
4|2|0|16-JUL-2012|23|0.52

3.Insert a new column 'Exper' of type Number (30) to the 'gardener' table which stores Experience of the of person. How will you modify this to varchar2(30).

sqlite> alter table gardener add column Exper number(30);

4.Write a query to find the plant name which required seeds less than 20 which plant on 14-APR
sqlite> select name from plant pt inner join planted p on pt.plantid =p.plantFk where seeds<20 and date1='14-APR-2012';
Carrot



5.List the amount of sunlight and water to all plants with names that start with letter 'c' or letter 'r'.
sqlite> select name ,sunlight,water from plant where name like 'C%' or name like 'R%';
Carrot|0.26|0.82
Corn|0.44|0.76
Radish|0.28|0.84

6.Write a valid SQL statement that displays the plant name and the total amount of seed required for each plant that were plant in the garden. The output should be in descending order of plant name.
sqlite> select name,seeds from plant pt inner join planted p on p.plantFk=pt.plantid order by name desc;
Tomato|38
Radish|30
Lettuce|30
Corn|20
Corn|12
Carrot|28
Carrot|14
Beet|36

7.Write a valid SQL statement that calculates the average number of items produced per seed planted for each plant type:( (Average Number of Items = Total Amount Picked / Total Seeds Planted.)
sqlite> select name,sum(amount/seeds) as 'Average Number of Items' from plant p inner join picked pi  on  pi.plantFk=p.plantid inner join planted pt on pt.plantFk=p.plantid group by p.name;
Carrot|3
Corn|7
Radish|0
Tomato|0


8.Write a valid SQL statement that would produce a result set like the following:
 name |  name  |    date    | amount 
------|--------|------------|-------- 
 Tim  | Radish | 2012-07-16 |     23 
 Tim  | Carrot | 2012-08-18 |     28 

select g.name,p.name,To_char(pi.date1,'YYYY-MM-DD'),pi.amount from picked pi inner join plant p on p.plantid=pi.plantFk inner join gardener g on g.gardenerid=pi.gardenerFk where g.name='Tim'and amount between 23 and 28 order by amount;
Tim|Radish|16-JUL-2012|23
Tim|Carrot|18-AUG-2012|28



9.Find out persons who picked from the same location as he/she planted.
sqlite> select DISTINCT( g.name) from gardener g inner join planted p1 on g.gardenerid=p1.gardenerFK inner join picked p on p.gardenerFK=g.gardenerid where p1.locationFK=p.locationFK;
Father
Tim

10.Create a view that lists all the plant names picked from all locations except ’West’ in the month of August.


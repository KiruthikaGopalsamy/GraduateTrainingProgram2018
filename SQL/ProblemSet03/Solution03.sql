<PROBLEM SET 01> AUGUST 21,2018
 SUBMITTED BY kiruthika.gopalsamy





sqlite> create table Movie(mID int primary key, title text, year int, director text);
sqlite> create table Reviewer(rID int primary key , name text);
sqlite> create table Rating(rID int references Reviewer(rID), mID int references Movie(mID), stars int, ratingDate date);

sqlite> insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
sqlite> insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
sqlite> insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
sqlite> insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
sqlite> insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
sqlite> insert into Movie values(106, 'Snow White', 1937, null);
sqlite> insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
sqlite> insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');
sqlite> select * from Movie;
101|Gone with the Wind|1939|Victor Fleming
102|Star Wars|1977|George Lucas
103|The Sound of Music|1965|Robert Wise
104|E.T.|1982|Steven Spielberg
105|Titanic|1997|James Cameron
106|Snow White|1937|
107|Avatar|2009|James Cameron
108|Raiders of the Lost Ark|1981|Steven Spielberg
sqlite> insert into Reviewer values(201, 'Sarah Martinez');
sqlite> insert into Reviewer values(202, 'Daniel Lewis');
sqlite> insert into Reviewer values(203, 'Brittany Harris');
sqlite> insert into Reviewer values(204, 'Mike Anderson');
sqlite> insert into Reviewer values(205, 'Chris Jackson');
sqlite> insert into Reviewer values(206, 'Elizabeth Thomas');
sqlite> insert into Reviewer values(207, 'James Cameron');
sqlite> insert intoreviewer name, movie title, stars, and ratingDate values(208, 'Ashley White');
sqlite>
sqlite> select * from Reviewer;
201|Sarah Martinez
202|Daniel Lewis
203|Brittany Harris
204|Mike Anderson
205|Chris Jackson
206|Elizabeth Thomas
207|James Cameron
208|Ashley White
sqlite> insert into Rating values(201, 101, 2, '2011-01-22');
sqlite> insert into Rating values(201, 101, 4, '2011-01-27');
sqlite> insert into Rating values(202, 106, 4, null);
sqlite> insert into Rating values(203, 103, 2, '2011-01-20');
sqlite> insert into Rating values(203, 108, 4, '2011-01-12');
sqlite> insert into Rating values(203, 108, 2, '2011-01-30');
sqlite> insert into Rating values(204, 101, 3, '2011-01-09');
sqlite> insert into Rating values(205, 103, 3, '2011-01-27');
sqlite> insert into Rating values(205, 104, 2, '2011-01-22');
sqlite> insert into Rating values(205, 108, 4, null);
sqlite> insert into Rating values(206, 107, 3, '2011-01-15');
sqlite> insert into Rating values(206, 106, 5, '2011-01-19');
sqlite> insert into Rating values(207, 107, 5, '2011-01-20');
sqlite> insert into Rating values(208, 104, 3, '2011-01-02');
sqlite>
sqlite> select * from Rating;
201|101|2|2011-01-22
201|101|4|2011-01-27
202|106|4|
203|103|2|2011-01-20
203|108|4|2011-01-12
203|108|2|2011-01-30
204|101|3|2011-01-09
205|103|3|2011-01-27
205|104|2|2011-01-22
205|108|4|
206|107|3|2011-01-15
206|106|5|2011-01-19
207|107|5|2011-01-20
208|104|3|2011-01-02
1.Find the titles of all movies directed by Steven Spielberg. (1 point possible)
sqlite> select title from Movie where director='Steven Spielberg';
E.T.
Raiders of the Lost Ark

2.Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. (1 point possible)
sqlite> select distinct (m.year),r.stars from movie m inner join rating r on m.mID=r.mID  where r.stars=4 or r.stars=5 order by m.year;
1937|4
1937|5
1939|4
1981|4
2009|5

3.Find the titles of all movies that have no ratings. (1 point possible)
sqlite>  select title from movie where mID not in (select mID from rating);
Star Wars
Titanic
4.Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. (1 point possible)
sqlite> select name from Reviewer r1 inner join Rating r on r.rID=r1.rID where ratingDate is null;
Daniel Lewis
Chris Jackson

5.Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. (1 point possible)
sqlite> select  name,  title, stars, ratingDate from Reviewer r1 inner join rating  r on r.rID=r1.rID inner join Movie m on m.mID=r.mID order by name,title,stars;
Ashley White|E.T.|3|2011-01-02
Brittany Harris|Raiders of the Lost Ark|2|2011-01-30
Brittany Harris|Raiders of the Lost Ark|4|2011-01-12
Brittany Harris|The Sound of Music|2|2011-01-20
Chris Jackson|E.T.|2|2011-01-22
Chris Jackson|Raiders of the Lost Ark|4|
Chris Jackson|The Sound of Music|3|2011-01-27
Daniel Lewis|Snow White|4|
Elizabeth Thomas|Avatar|3|2011-01-15
Elizabeth Thomas|Snow White|5|2011-01-19
James Cameron|Avatar|5|2011-01-20
Mike Anderson|Gone with the Wind|3|2011-01-09
Sarah Martinez|Gone with the Wind|2|2011-01-22
Sarah Martinez|Gone with the Wind|4|2011-01-27


6.For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer's name and the title of the movie. (1 point possible)
sqlite> SELECT *
   FROM Reviewer rev
   INNER JOIN Rating r1 on r1.rID = rev.rID
   INNER JOIN Rating r2 on r2.rID = rev.rID and r2.mID = r1.mID
   INNER JOIN Movie m on m.mID = r1.mID
   WHERE r2.ratingDate > r1.ratingDate and r2.stars > r1.stars ;
Sarah Martinez|Gone with the Wind 
7.For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. (1 point possible)
sqlite> select title,stars from movie m inner join rating r on m.mID=r.mID group by m.mID having stars=max(stars) order by title;
Avatar|5
E.T.|3
Gone with the Wind|4
Raiders of the Lost Ark|4
Snow White|5
The Sound of Music|3

8.For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title. (1 point possible)
sqlite> select title,max(stars)-min(stars) as 'rating spread' from movie m inner join  rating r on m.mID=r.mID group by m.mID order by 'rating spread',title;
Avatar|2
E.T.|1
Gone with the Wind|2
Raiders of the Lost Ark|2
Snow White|1
The Sound of Music|1


9.Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980. (Make sure to calculate the average rating for each movie, then the average of those averages for movies before 1980 and movies after. Don't just calculate the overall average rating before and after 1980.) (1 point possible)

select (select avg(st)
   ...> from (select movie.mID, movie.year, avg(rating.stars) as st
   ...> from rating join movie on movie.mID=rating.mID
   ...> group by movie.mID)
   ...> where year<1980)
   ...>  -
   ...> (select avg(st)
   ...> from (select movie.mID, movie.year, avg(rating.stars) st
   ...> from rating join movie on movie.mID=rating.mID
   ...> group by movie.mID)
   ...> where year>1980);
0.0555555555555554

10.Find the names of all reviewers who rated Gone with the Wind. (1 point possible)
 select distinct r.name
   ...> from reviewer  r
   ...> inner join rating r1 on r1.rID=r.rID
   ...> inner join movie m on r1.mID=m.mID and title='Gone with the Wind';
Sarah Martinez
Mike Anderson

11.For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars. (1 point possible)
sqlite> select r.name ,m.title,r1.stars
   ...> from reviewer r
   ...> inner join rating r1 on r1.rID=r.rID
   ...> inner join movie m on m.mID=r1.mID where r.name= m. director;
James Cameron|Avatar|5

12.Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".) (1 point possible)
sqlite> SELECT distinct rev.name,m.title
   ...> FROM Reviewer rev
   ...> INNER JOIN Rating r1 on r1.rID = rev.rID
   ...>  INNER JOIN Movie m on m.mID = r1.mID
   ...>  order by rev.name,m.title;
Ashley White|E.T.
Brittany Harris|Raiders of the Lost Ark
Brittany Harris|The Sound of Music
Chris Jackson|E.T.
Chris Jackson|Raiders of the Lost Ark
Chris Jackson|The Sound of Music
Daniel Lewis|Snow White
Elizabeth Thomas|Avatar
Elizabeth Thomas|Snow White
James Cameron|Avatar
Mike Anderson|Gone with the Wind
Sarah Martinez|Gone with the Wind

13.Find the titles of all movies not reviewed by Chris Jackson. (1 point possible)
 sqlite> select distinct (m.title)
   ...> from movie m
   ...> inner join rating r on r.mID=m.mID and title  not in (
   ...> select m.title
   ...> from movie m
   ...> inner join rating r on r.mID=m.mID
   ...> inner join reviewer r1 on r1.rId=r.rID and r1.name='Chris Jackson');
Gone with the Wind
Snow White
Avatar

14.For all pairs of reviewers such that both reviewers gave a rating to the same movie, return the names of both reviewers. Eliminate duplicates, don't pair reviewers with themselves, and include each pair only once. For each pair, return the names in the pair in alphabetical order. (1 point possible)

 sqlite> select rev1.name,rev2.name
   ...> from Rating r1 join Rating r2 on r1.mID=r2.mID  and r1.rID<>r2.rID
   ...> join Reviewer rev1 on rev1.rID=r1.rID
   ...> join Reviewer rev2 on rev2.rID=r2.riD
   ...> where r1.rID<r2.rID
   ...> group by rev1.name,rev2.name;
Brittany Harris|Chris Jackson
Chris Jackson|Ashley White
Daniel Lewis|Elizabeth Thomas
Elizabeth Thomas|James Cameron
Sarah Martinez|Mike Anderson



15.For each rating that is the lowest (fewest stars) currently in the database, return the reviewer name, movie title, and number of stars. (1 point possible)
sqlite> select name,title, stars from movie m
   ...> inner join rating r on r.mID=m.mId
   ...> inner join reviewer r2 on r2.rID=r.rID
   ...> WHERE stars = (SELECT MIN(stars) FROM Rating);
Sarah Martinez|Gone with the Wind|2
Brittany Harris|The Sound of Music|2
Brittany Harris|Raiders of the Lost Ark|2
Chris Jackson|E.T.|2

16.List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order. (1 point possible)
sqlite> select title, avg(stars) as AVG_stars from movie inner join rating on movie.mID=rating.mID group by movie.mID order by  AVG_stars desc,title;
Snow White|4.5
Avatar|4.0
Raiders of the Lost Ark|3.33333333333333
Gone with the Wind|3.0
E.T.|2.5
The Sound of Music|2.5


17.Find the names of all reviewers who have contributed three or more ratings. (As an extra challenge, try writing the query without HAVING or without COUNT.) (1 point possible)

sqlite> select name from reviewer r inner join rating r1 on r1.rID= r.rID group by r.rID having count(stars)>=3;
Brittany Harris
Chris Jackson


18.Some directors directed more than one movie. For all such directors, return the titles of all movies directed by them, along with the director name. Sort by director name, then movie title. (As an extra challenge, try writing the query both with and without COUNT.) (1 point possible)

sqlite> select m1.title,m1.director from movie m1 inner join movie m2 on m1.director=m2.director and m1.mID<>m2.mID order by m1.director,m1.title;
Avatar|James Cameron
Titanic|James Cameron
E.T.|Steven Spielberg
Raiders of the Lost Ark|Steven Spielberg

19.Find the movie(s) with the highest average rating. Return the movie title(s) and average rating. (Hint: This query is more difficult to write in SQLite than other systems; you might think of it as finding the highest average rating and then choosing the movie(s) with that average rating.) (1 point possible)

sqlite> select title, max(avg1) from (select title,avg(stars)as avg1 from movie m inner join rating r on  r.mID=m.mID group by title);
Snow White|4.5

20.Find the movie(s) with the lowest average rating. Return the movie title(s) and average rating. (Hint: This query may be more difficult to write in SQLite than other systems; you might think of it as finding the lowest average rating and then choosing the movie(s) with that average rating.) (1 point possible)
sqlite> select title, min(avg1) from (select title,avg(stars)as avg1 from movie m inner join rating r on  r.mID=m.mID group by title);
E.T.|2.5

21.For each director, return the director's name together with the title(s) of the movie(s) they directed that received the highest rating among all of their movies, and the value of that rating. Ignore movies whose director is NULL. (1 point possible)
sqlite> select  director,title,max(stars) from movie
   ...> inner join rating r on r.mID=movie.mID
   ...> where  director is not null group by  director having max(stars);
James Cameron|Avatar|5
Robert Wise|The Sound of Music|3
Steven Spielberg|Raiders of the Lost Ark|4
Victor Fleming|Gone with the Wind|4



# (exp 2)  Design the above database using DDL and DML statements

```
CREATE TABLE Sailors (
   sid NUMBER,
   sname VARCHAR2(40),
   rating NUMBER,
   age NUMBER (4,1) );

CREATE TABLE Boats (
   bid NUMBER,
   bname VARCHAR2(20),
   color VARCHAR2(10) );

CREATE TABLE Reserves (
   sid NUMBER,
   bid NUMBER,
   day DATE );

```
![output](op36.png)

```
INSERT INTO Sailors 
VALUES (22,'Dustin', 7, 45.0);
INSERT INTO Sailors 
VALUES (29,'Brutus', 1,33.0);
INSERT INTO Sailors 
VALUES (31,'Lubber', 8,55.5);
INSERT INTO Sailors 
VALUES (32,'Andy',8,25.5);
INSERT INTO Sailors 
VALUES (55,'Rusty',10,35.0);
INSERT INTO Sailors 
VALUES (64,'Horatio',7,35.0);
INSERT INTO Sailors 
VALUES (71,'Zorba',10,16.0);
INSERT INTO Sailors 
VALUES (74,'Horatio',9,35.0);
INSERT INTO Sailors 
VALUES (85,'Art',3,25.5);
INSERT INTO Sailors 
VALUES (95,'Bob',3,63.5);

```
![output](op37.png)

```
INSERT INTO Boats 
VALUES (101,'Interlake','blue');
INSERT INTO Boats 
VALUES (102,'Interlake','red');
INSERT INTO Boats 
VALUES (103,'Clipper','green');
INSERT INTO Boats 
VALUES (104,'Marine','red');
```
![output](op38.png)

```
INSERT INTO Reserves 
VALUES (22,101,TO_DATE('10/10/98','DD/MM/YY'));
INSERT INTO Reserves 
VALUES (22,102,TO_DATE('10/10/98','DD/MM/YY'));
INSERT INTO Reserves 
VALUES (22,103,TO_DATE('10/08/98','DD/MM/YY'));
INSERT INTO Reserves 
VALUES (22,104,TO_DATE('10/07/98','DD/MM/YY'));
INSERT INTO Reserves 
VALUES (31,102,TO_DATE('11/10/98','DD/MM/YY'));
INSERT INTO Reserves 
VALUES (31,103,TO_DATE('11/06/98','DD/MM/YY'));
INSERT INTO Reserves 
VALUES (31,104,TO_DATE('11/12/98','DD/MM/YY'));
INSERT INTO Reserves 
VALUES (64,101,TO_DATE('09/05/98','DD/MM/YY'));
INSERT INTO Reserves 
VALUES (64,102,TO_DATE('09/08/98','DD/MM/YY'));
INSERT INTO Reserves 
VALUES (74,103,TO_DATE('09/08/98','DD/MM/YY'));

```
![output](op37.png)



# 1. Find the names and ages of all sailors

```
SELECT DISTINCT sname, age FROM Sailors;

```
![output](op39.png)


# 2. Find all sailors with rating above 7

```
SELECT * FROM Sailors WHERE rating > 7;

```
![output](op40.png)

 
# 3. Find the names of sailors who reserved boat number 103

```
SELECT s.sname FROM Sailors s, Reserves r WHERE s.sid = r.sid AND r.bid = 103;

```
![output](op41.png)




# 4. Find the sid of sailors who reserved a red boat

```
SELECT s.sid FROM Sailors s, Reserves r, Boats b WHERE s.sid = r.sid AND r.bid = b.bid AND b.color = 'red';

```
![output](op42.png)



# 5. Find the nmaes of sailors who reserved a red boat

```
SELECT s.sname FROM Sailors s, Reserves r, Boats b WHERE s.sid = r.sid AND r.bid = b.bid AND b.color = 'red';

```
![output](op43.png)



# 6. Find the colors of boats reserved by Lubber 

```
SELECT b.color FROM Sailors s, Reserves r, Boats b WHERE s.sid = r.sid AND r.bid = b.bid AND s.sname = 'Lubber';

```
![output](op44.png)



# 7. Find the names of sailors who have reserved atleast one boat 

```
SELECT DISTINCT s.sname FROM Sailors s, Reserves r WHERE s.sid = r.sid;

```
![output](op45.png)




# 8. Compute increments for the ratings of a persons who have sailed two different boats on the same day

```
SELECT DISTINCT s.sname, s.rating+1 FROM sailors s, Reserves r1, Reserves r2 
WHERE s.sid = r1.sid AND s.sid = r2.sid AND r1.day = r2.day 
AND r1.bid <> r2.bid;

```
![output](op46.png)

# 9. Find the ages of sailors whose name begins and ends with B and has atleast three charectors

```
SELECT age FROM sailors
WHERE Sname LIKE 'B%b' AND LENGTH(Sname) >= 3;

```
![output](op47.png)


# 10. Find the names of sailors who reserved a red boat or a green boat

```
SELECT DISTINCT s.sname FROM Sailors s, Reserves r, Boats b 
WHERE s.sid = r.sid AND r.bid = b.bid AND b.color = 'red'
UNION
SELECT DISTINCT s.sname FROM Sailors s, Reserves r, Boats b 
WHERE s.sid = r.sid AND r.bid = b.bid AND b.color = 'green';

```
![output](op48.png)



# 11. Find the names of sailors who reserved both  a red boat and a green boat

```
SELECT DISTINCT s.sname FROM sailors s, Reserves r, Boats b 
WHERE s.sid = r.sid AND r.bid = b.bid AND b.color = 'red'
INTERSECT
SELECT DISTINCT s.sname FROM Sailors s, Reserves r, Boats b 
WHERE s.sid = r.sid AND r.bid = b.bid AND b.color = 'green';

```
![output](op49.png)




# 12. Find the sids of all sailors who have reserved  red boats but not a green boats 

```
SELECT DISTINCT s.sid FROM Sailors s, Reserves r, Boats b 
WHERE s.sid = r.sid AND r.bid = b.bid AND b.color = 'red'
MINUS
SELECT DISTINCT s.sid FROM sailors s, Reserves r, Boats b 
WHERE s.sid = r.sid AND r.bid = b.bid AND b.color = 'green';

```

![output](op50.png)


# 13. Find all sids of sailors  who have a rating of 10 or have reserved a boat 104

```
SELECT sid FROM Sailors 
WHERE rating = 10
UNION
SELECT sid FROM Reserves 
WHERE bid = 104;

```
![output](op51.png)



# 14. Find the names of sailors who reserved boat 103
```
SELECT Sname FROM Sailors 
WHERE Sid IN (
SELECT Sid FROM Reserves WHERE bid=103);

```
![output](op52.png)



# 15. Find the names of a sailors who have reserved  a red boat

```
SELECT Sname FROM Sailors 
WHERE Sid IN (
SELECT Sid FROM Reserves WHERE bid IN (
SELECT bid FROM Boats WHERE color='red'));


```

![output](op53.png)


# 16. Find the name of a sailors who have reserved a boat number 103

```
SELECT Sname FROM Sailors 
WHERE Sid IN (
SELECT Sid FROM Reserves WHERE bid=103);

```

![output](op54.png)


# 17. Find the sailors whose rating is better than some sailor called Horatio

```
SELECT * FROM Sailors 
WHERE rating > ANY (
SELECT rating FROM Sailors WHERE Sname='Horatio');

```

![output](op55.png)


# 18.  Find the sailors whose rating is better than every sailor called Horatio

```
SELECT * FROM Sailors 
WHERE rating > ALL (
SELECT rating FROM Sailors WHERE Sname='Horatio');

```
![output](op56.png)




# 19. Find the sailors with highest rating 

```

SELECT * FROM Sailors 
WHERE rating = (
SELECT MAX(rating) FROM Sailors);


```
![output](op57.png)


# 20 . Find the names of sailors who have reserved both a red  and a green boat 

```
SELECT DISTINCT S.Sname FROM Sailors S 
WHERE S.Sid IN (
SELECT S.Sid FROM Reserves r WHERE r.bid IN (
SELECT b.bid FROM Boats b WHERE color='red')) AND Sid IN (
SELECT Sid FROM Reserves r WHERE r.bid IN (
SELECT b.bid FROM Boats b WHERE color='green'));


```

![output](op58.png)


# 21. Find  the names of the sailor who have reserved all boats
```
SELECT S.Sname FROM Sailors S, Reserves r 
WHERE S.Sid = r.Sid 
GROUP BY S.Sid, S.Sname 
HAVING COUNT(DISTINCT r.bid) = (
SELECT COUNT(*) FROM Boats);

```

![output](op59.png)



# 22. Find the average age of all sailors

```
SELECT AVG(age) FROM Sailors;


```
![output](op60.png)



# 23. Find the average age of sailor with rating of 10

```
SELECT AVG(age) FROM Sailors 
WHERE rating=10;

```
![output](op61.png)



# 24. Find the name and age of the oldest sailor

```
SELECT Sname, age FROM Sailors 
WHERE age = (
SELECT MAX(age) FROM Sailors);

```
![output](op62.png)



# 25. Count the numbers of sailors

```
SELECT COUNT(*) FROM Sailors;

```
![output](op63.png)


# 26. Count the numbers of different sailors names

```
SELECT COUNT(DISTINCT Sname) FROM Sailors;


```

![output](op64.png)


# 27. Find the names of sailors who are older than the oldest sailor with a rating of 10

```
SELECT Sname FROM Sailors 
WHERE age > (
SELECT MAX(age) FROM Sailors 
WHERE rating = 10);

```
![output](op65.png)




# 28. Find the age of youngest sailors for each rating level

```
SELECT rating, MIN(age) FROM Sailors 
GROUP BY rating;


```
![output](op66.png)




# 29. Find the age of youngest sailor who is eligible to vote(i.e.,atleast 18 years old) for each rating level with atleast two such sailors

```
SELECT S.rating, MIN(S.age) FROM Sailors S 
WHERE S.age >= 18 
GROUP BY S.rating 
HAVING COUNT(*) > 1;

```
![output](op67.png)



# 30. For each red boat, find the number of reservations for this boat

```
SELECT b.bid, COUNT(*) AS Reservationcount 
FROM Boats b, Reserves r 
WHERE b.bid = r.bid AND b.color = 'red' 
GROUP BY b.bid;


```
![output](op68.png)



# 31. Find the average age of sailors for each rating level that has atleast two sailors

```
SELECT S.rating, AVG(S.age) FROM Sailors S 
GROUP BY S.rating 
HAVING COUNT(*) > 1;


```

![output](op69.png)


# 32. Find the average age of sailors who are of voting age (i.e., atleast 18 years old)for each rating level with atleast two such sailors

```
SELECT S.rating, AVG(S.age) FROM Sailors S 
WHERE S.age >= 18 
GROUP BY S.rating 
HAVING COUNT(*) > 1;

```
![output](op70.png)



# 33. Find the average age of sailors who are of voting age (i.e., atleast 18 years old)for each rating level with atleast two such sailors
 
```
SELECT S.rating, AVG(S.age) FROM Sailors S 
WHERE S.age >= 18 
GROUP BY S.rating 
HAVING COUNT(*) > 1;

```
![output](op71.png)



# 34. Find those rating for which the average of sailors is the minimum overall ratings

```
SELECT S.rating FROM Sailors S 
GROUP BY S.rating 
HAVING AVG(S.age) <= ALL (
SELECT AVG(S2.age) FROM Sailors S2 
GROUP BY S2.rating);

```

![output](op72.png)

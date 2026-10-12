-- EXPERIMENT -2
--Design the above database using DDL and DML statements
CREATE TABLE Sailors (
    sid NUMBER,
    sname VARCHAR2(20),
    rating NUMBER,
    age NUMBER(4,1)
);

CREATE TABLE Boats (
    bid NUMBER,
    bname VARCHAR2(20),
    color VARCHAR2(10)
);

CREATE TABLE Reserves (
    sid NUMBER,
    bid NUMBER,
    day DATE
);


--Inserting values into sailors

INSERT INTO Sailors VALUES (22, 'Dustin', 7, 45.0);
INSERT INTO Sailors VALUES (29, 'Brutus', 1, 33.0);
INSERT INTO Sailors VALUES (31, 'Lubber', 8, 55.5);
INSERT INTO Sailors VALUES (32, 'Andy', 8, 25.5);
INSERT INTO Sailors VALUES (58, 'Rusty', 10, 35.0);
INSERT INTO Sailors VALUES (64, 'Horatio', 7, 35.0);
INSERT INTO Sailors VALUES (71, 'Zorba', 10, 16.0);
INSERT INTO Sailors VALUES (74, 'Horatio', 9, 35.0);
INSERT INTO Sailors VALUES (85, 'Art', 3, 25.5);
INSERT INTO Sailors VALUES (95, 'Bob', 3, 63.5);


-- Inserting values into boats

INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');

--Inserting values into Reserves

INSERT INTO Reserves VALUES (22, 101, TO_DATE('10/10/98', 'DD/MM/YY'));
INSERT INTO Reserves VALUES (22, 102, TO_DATE('10/10/98', 'DD/MM/YY'));
INSERT INTO Reserves VALUES (22, 103, TO_DATE('10/08/98', 'DD/MM/YY'));
INSERT INTO Reserves VALUES (22, 104, TO_DATE('10/07/98', 'DD/MM/YY'));
INSERT INTO Reserves VALUES (31, 102, TO_DATE('11/10/98', 'DD/MM/YY'));
INSERT INTO Reserves VALUES (31, 103, TO_DATE('11/06/98', 'DD/MM/YY'));
INSERT INTO Reserves VALUES (31, 104, TO_DATE('11/12/98', 'DD/MM/YY'));
INSERT INTO Reserves VALUES (64, 101, TO_DATE('09/05/98', 'DD/MM/YY'));
INSERT INTO Reserves VALUES (64, 102, TO_DATE('09/08/98', 'DD/MM/YY'));
INSERT INTO Reserves VALUES (74, 103, TO_DATE('09/08/98', 'DD/MM/YY'));



-- 2.1) Find the names and ages of all sailors

SELECT DISTINCT sname, age
FROM Sailors;



--2.2) Find all sailors with a rating above 7
SELECT *
FROM Sailors
WHERE rating > 7;



--2.3) Find the names of sailors who have reserved boat number 103
SELECT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
AND r.bid = 103;


 --2.4) Find the sids of sailors who have reserved a red boat
SELECT s.sid
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';


-- 2.5) Find the names of sailors who have reserved a red boat.
SELECT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red';



--2.6) Find the colors of boats reserved by Lubber.
SELECT b.color
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND s.sname = 'Lubber';


--2.7) Find the names of sailors who have reserved at least one boat.
SELECT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid;



--2.8) Compute increments for the ratings of persons who have sailed two different boats on the same day.
SELECT DISTINCT s.sname, s.rating + 1
FROM Sailors s, Reserves r1, Reserves r2
WHERE s.sid = r1.sid
AND s.sid = r2.sid
AND r1.day = r2.day
AND r1.bid <> r2.bid;


-- 2.9) Find the ages of sailors whose name begins and ends with B and has at least three characters.
SELECT age
FROM Sailors
WHERE sname LIKE 'B%B'
AND LENGTH(sname) >= 3;



-- 2.10) Find the names of sailors who have reserved a red boat or a green boat.
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red'

UNION

SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'green';



--2.11) Find the names of sailors who have reserved both a red boat and a green boat.
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red'

INTERSECT

SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'green';


-- 2.12) Find the sids of all sailors who have reserved red boats but not green boats.
SELECT DISTINCT s.sid
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'red'

MINUS

SELECT DISTINCT s.sid
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND b.color = 'green';



-- 2.13) Find all sids of sailors who have a rating of 10 or have reserved boat 104.
SELECT sid
FROM Sailors
WHERE rating = 10

UNION

SELECT sid
FROM Reserves
WHERE bid = 104;



--2.14) Find the names of sailors who have reserved boat 103.
SELECT sname
FROM Sailors
WHERE sid IN (
    SELECT sid
    FROM Reserves
    WHERE bid = 103
);



--2.15) Find the names of sailors who have reserved a red boat.
SELECT sname
FROM Sailors
WHERE sid IN (
    SELECT sid
    FROM Reserves
    WHERE bid IN (
        SELECT bid
        FROM Boats
        WHERE color = 'red'
    )
);



--2.16) Find the names of sailors who have reserved boat 103.
SELECT sname
FROM Sailors
WHERE sid IN (
    SELECT sid
    FROM Reserves
    WHERE bid = 103
);



--2.17) Find sailors whose rating is better than some sailor called Horatio.
SELECT *
FROM Sailors
WHERE rating > ANY (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);



--2.18) Find sailors whose rating is better than every sailor called Horatio.
SELECT *
FROM Sailors
WHERE rating > ALL (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);



--2.19) Find the sailors with the highest rating.
SELECT *
FROM Sailors
WHERE rating = (
    SELECT MAX(rating)
    FROM Sailors
);



--2.20) Find the sailors who have the same rating as the sailor named Horatio.
SELECT *
FROM Sailors
WHERE rating IN (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);



--2.21) Find the names of sailors who have reserved all boats.
SELECT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid
GROUP BY s.sid, s.sname
HAVING COUNT(DISTINCT r.bid) = (SELECT COUNT(*) FROM Boats);


--2.22) Find the average age of all sailors.
SELECT AVG(age)
FROM Sailors;



--2.23) Find the average age of sailors with a rating of 10.
SELECT AVG(age)
FROM Sailors
WHERE rating = 10;


--2.24) Find the name and age of the oldest sailor.
SELECT sname, age
FROM Sailors
WHERE age = (
    SELECT MAX(age)
    FROM Sailors
);



--2.25) Count the number of sailors.
SELECT COUNT(*)
FROM Sailors;



--2.26) Count the number of different sailors names.
SELECT COUNT(DISTINCT sname)
FROM Sailors;



--2.27) Find the names of sailors who are older than the oldest sailor with a rating of 10.
SELECT sname
FROM Sailors
WHERE age > (
    SELECT MAX(age)
    FROM Sailors
    WHERE rating = 10
);


--2.28) Find the age of the yougest sailor for each rating level.
SELECT rating, MIN(age)
FROM Sailors
GROUP BY rating;


-- 2.29) Find the age of the youngest sailor who is eligible to vote (i.e., is at least 18 years old ) for each rating level with atleast two such sailors. 
SELECT S.rating, MIN(S.age)
FROM Sailors S
WHERE S.age >= 18
GROUP BY S.rating
HAVING COUNT(*) > 1;



--2.30) For each red boat, find the number of reservations for this boat.
SELECT b.bid, COUNT(*) AS reservationcount
FROM Boats b, Reserves r
WHERE b.bid = r.bid
AND b.color = 'red'
GROUP BY b.bid;



--2.31) Find the average age of sailors for each rating level that has at least two sailors.
SELECT S.rating, AVG(S.age)
FROM Sailors S
GROUP BY S.rating
HAVING COUNT(*) > 1;


--2.32) Find the average age of sailors who are of voting age (i.e., at least 18 years old ) for each rating level that has at least two sailors.
SELECT S.rating, AVG(S.age)
FROM Sailors S
WHERE S.age >= 18
GROUP BY S.rating
HAVING COUNT(*) > 1;



--2.33) Find the average age of sailors who are of voting age (i.e., at least 18 years old ) for each rating level that has at least two sailors.
SELECT S.rating, AVG(S.age)
FROM Sailors S
WHERE S.age >= 18
GROUP BY S.rating
HAVING COUNT(*) > 1;



--2.34) Find those ratings for which the average age of sailors is the minimum over all ratings.
SELECT S.rating
FROM Sailors S
GROUP BY S.rating
HAVING AVG(S.age) <= ALL (
    SELECT AVG(S2.age)
    FROM Sailors S2
    GROUP BY S2.rating
);
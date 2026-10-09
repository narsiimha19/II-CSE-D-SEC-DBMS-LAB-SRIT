CREATE TABLE Sailors (
    sid NUMBER PRIMARY KEY,
    sname VARCHAR2(20),
    rating NUMBER,
    age NUMBER(4,1)
);
CREATE TABLE Boats (
    bid NUMBER PRIMARY KEY,
    bname VARCHAR2(20),
    color VARCHAR2(10)
);
CREATE TABLE Reserves (
    sid NUMBER,
    bid NUMBER,
    day DATE,
    CONSTRAINT reserves_pk PRIMARY KEY (sid, bid, day),
    CONSTRAINT reserves_sid_fk FOREIGN KEY (sid)
        REFERENCES Sailors(sid),
    CONSTRAINT reserves_bid_fk FOREIGN KEY (bid)
        REFERENCES Boats(bid)
);
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

INSERT INTO Boats VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats VALUES (102, 'Interlake', 'red');
INSERT INTO Boats VALUES (103, 'Clipper', 'green');
INSERT INTO Boats VALUES (104, 'Marine', 'red');

INSERT INTO Reserves VALUES (22, 101, TO_DATE('10/10/1998','DD/MM/YYYY'));
INSERT INTO Reserves VALUES (22, 102, TO_DATE('10/10/1998','DD/MM/YYYY'));
INSERT INTO Reserves VALUES (22, 103, TO_DATE('08/10/1998','DD/MM/YYYY'));
INSERT INTO Reserves VALUES (22, 104, TO_DATE('07/10/1998','DD/MM/YYYY'));

INSERT INTO Reserves VALUES (31, 102, TO_DATE('10/11/1998','DD/MM/YYYY'));
INSERT INTO Reserves VALUES (31, 103, TO_DATE('06/11/1998','DD/MM/YYYY'));
INSERT INTO Reserves VALUES (31, 104, TO_DATE('12/11/1998','DD/MM/YYYY'));

INSERT INTO Reserves VALUES (64, 101, TO_DATE('05/09/1998','DD/MM/YYYY'));
INSERT INTO Reserves VALUES (64, 102, TO_DATE('08/09/1998','DD/MM/YYYY'));

INSERT INTO Reserves VALUES (74, 103, TO_DATE('08/09/1998','DD/MM/YYYY'));
--Find the names and ages of all sailors
SELECT sname, age
FROM Sailors;
--find all saiors rating above 7.2
SELECT *FROM Sailors
WHERE rating > 7.2;

--find the names of saiors who have reserved boat number 1033
SELECT DISTINCT r.sid
FROM Reserves r
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red';

--find the sids of sailors who have reserved red boat
SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red';

--find the names of sailors who have reserved red boat
SELECT DISTINCT b.color
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE s.sname = 'Lubber';

--find the colors of boats reserved by lubber
SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid;
--compute increments
UPDATE Sailors
SET rating = rating + 1
WHERE sid IN (
    SELECT r1.sid
    FROM Reserves r1
    JOIN Reserves r2
      ON r1.sid = r2.sid
     AND r1.day = r2.day
     AND r1.bid <> r2.bid
);

--find the ages of sailoes whose name begins and ends with B
SELECT age
FROM Sailors
WHERE sname LIKE 'B%B'
AND LENGTH(sname) >= 3;

--find the names of saiors who have reserved both a red amd a green boat
SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color IN ('red', 'green');


SELECT s.sname
FROM Sailors s
WHERE EXISTS (
    SELECT 1
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE r.sid = s.sid
    AND b.color = 'red'
)
AND EXISTS (
    SELECT 1
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE r.sid = s.sid
    AND b.color = 'green'
);
SELECT DISTINCT r.sid
FROM Reserves r
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red'
AND r.sid NOT IN (
    SELECT r2.sid
    FROM Reserves r2
    JOIN Boats b2 ON r2.bid = b2.bid
    WHERE b2.color = 'green'
);

.SELECT sid
FROM Sailors
WHERE rating = 10

UNION

SELECT sid
FROM Reserves
WHERE bid = 1041;

SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
WHERE r.bid = 1031;

SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red';

SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
WHERE r.bid = 103;

SELECT *
FROM Sailors
WHERE rating > ANY (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);
--Find sailors whose rating is better than every sailor called Horatio
SELECT *
FROM Sailors
WHERE rating > ALL (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);
--Find the sailors wuth the highest rating
SELECT *
FROM Sailors
WHERE rating = (
    SELECT MAX(rating)
    FROM Sailors
);

-Find the names of sailors who have reserved both a red and a green boat.
SELECT s.sname
FROM Sailors s
WHERE s.sid IN (
    SELECT r.sid
    FROM Reserves r, Boats b
    WHERE r.bid = b.bid
    AND b.color = 'red'
)
AND s.sid IN (
    SELECT r.sid
    FROM Reserves r, Boats b
    WHERE r.bid = b.bid
    AND b.color = 'green'
);

--Find the names of sailors who have reserved all boats.
SELECT s.sname
FROM Sailors s
WHERE NOT EXISTS (
    SELECT b.bid
    FROM Boats b
    WHERE NOT EXISTS (
        SELECT r.bid
        FROM Reserves r
        WHERE r.sid = s.sid
        AND r.bid = b.bid
    )
);

--Find the average of all sailors
SELECT AVG(age) AS average_age
FROM Sailors;

--Find the average age of sailors with a rating of 10.
SELECT AVG(age) AS average_age
FROM Sailors
WHERE rating = 10;

--Find the average  of all sailors with rating of 10
SELECT sname, age
FROM Sailors
WHERE age = (
    SELECT MAX(age)
    FROM Sailors
);

--Find the name and age of the oldest sailor

SELECT sname, age
FROM Sailors
WHERE age = (
    SELECT MAX(age)
    FROM Sailors
);
--Count the number of sailors.

SELECT COUNT(*) AS sailor_count
FROM Sailors;

--Count the number of different sailor names.

SELECT COUNT(DISTINCT sname) AS different_names
FROM Sailors;
--Find the names of sailors who are older than the oldest sailor with a rating of 10.

SELECT sname
FROM Sailors
WHERE age > (
    SELECT MAX(age)
    FROM Sailors
    WHERE rating = 10
);
--Find the age of the youngest sailor for each rating level.

SELECT rating, MIN(age) AS youngest_age
FROM Sailors
GROUP BY rating;

--Find the age of the youngest sailor who is eligible to vote (at least 18 years) for each rating level with at least two such sailors.

SELECT rating, MIN(age) AS youngest_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
--For each red boat, find the number of reservations for this boat.

SELECT b.bid, COUNT(r.sid) AS reservation_count
FROM Boats b
LEFT JOIN Reserves r
ON b.bid = r.bid
WHERE b.color = 'red'
GROUP BY b.bid;

--Find the average age of sailors for each rating level that has at least two sailors.

SELECT rating, AVG(age) AS average_age
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;

--Find the average age of sailors who are of voting age (i.e., at least 18 years old) for each rating level that has at least two sailors.

SELECT rating, AVG(age) AS average_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;

--

--Find average age of voting-age sailors for each rating level having at least two such sailors.
SELECT rating, AVG(age) AS average_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;

--Find average age of voting-age sailors for each rating level having at least two such sailors


SELECT rating, AVG(age) AS average_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(age) >= 2;

--Find those ratings for which the average age of sailors is the minimum over all ratings.

SELECT rating, AVG(age) AS average_age
FROM Sailors
GROUP BY rating
HAVING AVG(age) = (
    SELECT MIN(avg_age)
    FROM (
        SELECT AVG(age) AS avg_age
        FROM Sailors
        GROUP BY rating
    )
);

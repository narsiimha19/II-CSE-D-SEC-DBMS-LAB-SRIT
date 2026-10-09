# (2b) 1.DISTINCT SNAME,AGE
...
SELECT DISTINCT SNAME, AGE
FROM SAILORS;
...
![output](op1.png)

# (2b) 2.Rating >7
...
SELECT *
FROM SAILORS
WHERE RATING > 7;
...
![output](EX2-op2.png)

# (2b) 3.Sailors who reserved Boat 103
...
SELECT S.SNAME
FROM SAILORS S, RESERVES R
WHERE S.SID = R.SID
AND R.BID = 103;
...
![output](EX2-op3.png)

# (2b) 4.SID of sailors who reserved red boats
...
SELECT S.SID
FROM SAILORS S, RESERVES R, BOATS B
WHERE S.SID = R.SID
AND R.BID = B.BID
AND B.COLOR = 'RED';
...
![output](EX2-op4.png)

# (2b) 5.Name of sailors who reserved red boats
...
SELECT S.SNAME
FROM SAILORS S, RESERVES R, BOATS B
WHERE S.SID = R.SID
AND R.BID = B.BID
AND B.COLOR = 'RED';
...
![output](EX2-op5.png)

# (2b) 6.color of boats reserved by LUBBER
...
SELECT B.COLOR
FROM SAILORS S, RESERVES R, BOATS B
WHERE S.SID = R.SID
AND R.BID = B.BID
AND S.SNAME = 'LUBBER';
...
![output](EX2-op6.png)

# (2b) 7.Sailors who made reservations
...
SELECT DISTINCT S.SNAME
FROM SAILORS S, RESERVES R
WHERE S.SID = R.SID;
...
![output](EX2-op7.png)

# (2b) 8.Increase rating by 1
...
UPDATE SAILORS
SET RATING = RATING + 1
WHERE SID IN
(
    SELECT R1.SID
    FROM RESERVES R1, RESERVES R2
    WHERE R1.SID = R2.SID
    AND R1.DAY = R2.DAY
    AND R1.BID <> R2.BID
);
...
![output](EX2-op8.png)

# (2b) 9.Age of sailors whose name starts and ends with B
...
SELECT SNAME, AGE
FROM SAILORS
WHERE SNAME LIKE 'B%';
...
![output](EX2-op9.png)

# (2b) 10.Sailors who reserved red OR green boats
...
SELECT DISTINCT S.SNAME
FROM SAILORS S, RESERVES R, BOATS B
WHERE S.SID = R.SID
AND R.BID = B.BID
AND B.COLOR = 'RED'

UNION

SELECT DISTINCT S.SNAME
FROM SAILORS S, RESERVES R, BOATS B
WHERE S.SID = R.SID
AND R.BID = B.BID
AND B.COLOR = 'GREEN';
...
![output](EX2-op10.png)

# (2b) 11.Sailors who reserved both red AND green boats
...
SELECT DISTINCT S.SNAME
FROM SAILORS S, RESERVES R, BOATS B
WHERE S.SID = R.SID
AND R.BID = B.BID
AND B.COLOR = 'RED'

INTERSECT

SELECT DISTINCT S.SNAME
FROM SAILORS S, RESERVES R, BOATS B
WHERE S.SID = R.SID
AND R.BID = B.BID
AND B.COLOR = 'GREEN';
...
![output](EX2-op11.png)

# (2b) 12.SID who reserved red but not green boats
...
SELECT DISTINCT R.SID
FROM RESERVES R, BOATS B
WHERE R.BID = B.BID
AND B.COLOR = 'RED'

MINUS

SELECT DISTINCT R.SID
FROM RESERVES R, BOATS B
WHERE R.BID = B.BID
AND B.COLOR = 'GREEN';
...
![output](EX2-op12.png)

# (2b) 13.SID with rating 10 OR reserved boat 104
...
SELECT SID
FROM SAILORS
WHERE RATING = 10

UNION

SELECT SID
FROM RESERVES
WHERE BID = 104;
...
![output](EX2-op13.png)

# (2b) 14.Sailors who reserved boat 103-subquery
...
SELECT S.SNAME
FROM SAILORS S
WHERE S.SID IN
(
    SELECT SID
    FROM RESERVES
    WHERE BID = 103
);
...
![output](EX2-op14.png)

# (2b) 15.Sailors Who reserved red boats-nested subquery
...
SELECT S.SNAME
FROM SAILORS S
WHERE S.SID IN
(
    SELECT R.SID
    FROM RESERVES R
    WHERE R.BID IN
    (
        SELECT B.BID
        FROM BOATS B
        WHERE B.COLOR = 'RED'
    )
);
...
![output](EX2-op15.png)

# (2b) 16.Sailors with rating greater than ANY Horatio rating
...
SELECT *
FROM SAILORS
WHERE RATING > ANY
(
    SELECT RATING
    FROM SAILORS
    WHERE SNAME = 'Horatio'
);
...
![output](EX2-op16.png)

# (2b) 17.Sailors with rating greater than ALL Horatio ratings
...
SELECT *
FROM SAILORS
WHERE RATING > ALL
(
    SELECT RATING
    FROM SAILORS
    WHERE SNAME = 'Horatio'
);
...
![output](EX2-op17.png)

# (2b) 18.sailors with maximum rating
...
SELECT *
FROM SAILORS
WHERE RATING =
(
    SELECT MAX(RATING)
    FROM SAILORS
);
...
![output](EX2-op18.png)

# (2b) 19.Sailors who reserved both red and green boats
...
SELECT DISTINCT S.SNAME
FROM SAILORS S
WHERE S.SID IN
(
    SELECT R.SID
    FROM RESERVES R
    WHERE R.BID IN
    (
        SELECT B.BID
        FROM BOATS B
        WHERE B.COLOR = 'RED'
    )
)
AND S.SID IN
(
    SELECT R.SID
    FROM RESERVES R
    WHERE R.BID IN
    (
        SELECT B.BID
        FROM BOATS B
        WHERE B.COLOR = 'GREEN'
    )
);
...
![output](EX2-op19.png)

# (2b) 20.sailors who reserved all boats
...
SELECT S.SNAME
FROM SAILORS S, RESERVES R
WHERE S.SID = R.SID
GROUP BY S.SNAME
HAVING COUNT(DISTINCT R.BID) =
(
    SELECT COUNT(*)
    FROM BOATS
);
...
![output](EX2-op20.png)

# (2b) 21.Average age of all sailors
...
SELECT AVG(AGE)
FROM SAILORS;
...
![output](EX2-op21.png)

# (2b) 22.Average age of sailors with rating 10
...
SELECT AVG(AGE)
FROM SAILORS
WHERE RATING = 10;
...
![output](EX2-op22.png)

# (2b) 23.Sailors with maximum age
...
SELECT SNAME, AGE
FROM SAILORS
WHERE AGE =
(
    SELECT MAX(AGE)
    FROM SAILORS
);
...
![output](EX2-op23.png)

# (2b) 24.Total number of sailors
...
SELECT COUNT(*)
FROM SAILORS;
...
![output](EX2-op24.png)

# (2b) 25.Number of different sailors names
...
SELECT COUNT(DISTINCT SNAME)
FROM SAILORS;
...
![output](EX2-op25.png)

# (2b) 26.Sailors older than all ratings-10 sailors
...
SELECT SNAME
FROM SAILORS
WHERE AGE >
(
    SELECT MAX(AGE)
    FROM SAILORS
    WHERE RATING = 10
);
...
![output](EX2-op26.png)

# (2b) 27.Minimum age for each rating
...
SELECT RATING, MIN(AGE)
FROM SAILORS
GROUP BY RATING;
...
![output](EX2-op27.png)

# (2b) 28.Minimum age for ratings having more than 1 sailors
...
SELECT S.RATING, MIN(S.AGE)
FROM SAILORS S
WHERE S.AGE >= 18
GROUP BY S.RATING
HAVING COUNT(*) > 1;
...
![output](EX2-op28.png)

# (2b) 29.Reservation count for each red boat
...
SELECT B.BID, COUNT(*) AS RESERVATION_COUNT
FROM BOATS B, RESERVES R
WHERE R.BID = B.BID
AND B.COLOR = 'RED'
GROUP BY B.BID;
...
![output](EX2-op29.png)

# (2b) 30.Average age for ratings having more than 1 sailor
...
SELECT S.RATING, AVG(S.AGE)
FROM SAILORS S
GROUP BY S.RATING
HAVING COUNT(*) > 1;
...
![output](EX2-op30.png)

# (2b) 31.Average age for sailors aged 18 and ratings having>1 sailors
...
SELECT S.RATING, AVG(S.AGE)
FROM SAILORS S
GROUP BY S.RATING
HAVING COUNT(*) > 1;
...
![output](EX2-op31.png)


# (2b) 32.same as above with columns alias
...

SELECT RATING, AVG(AGE) AS AVERAGE_AGE
FROM SAILORS
WHERE AGE >= 18
GROUP BY RATING
HAVING COUNT(*) > 1;
...
![output](EX2-op32.png)

# (2b) 33.Rating having the lowest average age
...

SELECT S.RATING
FROM SAILORS S
GROUP BY S.RATING
HAVING AVG(S.AGE) <= ALL
(
    SELECT AVG(S2.AGE)
    FROM SAILORS S2
    GROUP BY S2.RATING
);
...
![output](EX2-op33.png)


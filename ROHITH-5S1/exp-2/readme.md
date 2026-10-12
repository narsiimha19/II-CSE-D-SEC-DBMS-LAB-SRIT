# 2.1. Names and ages of all sailors
```
```
```
SELECT sname, age
FROM Sailors;
```
![output](1.jpeg)
```
# 2. Sailors with rating above 7
```
```
SELECT *
FROM Sailors
WHERE rating > 7;
```
![OUTPUT](2.jpeg)
```
# 3. Names of sailors who reserved boat 103
```
```
SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
WHERE r.bid = 103;
```
![OUTPUT](3.jpeg)
```
# 4. SIDs of sailors who reserved a red boat
```
```

SELECT DISTINCT r.sid
FROM Reserves r
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red';
```
![OUTPUT](4.jpeg)
```
# 5. Names of sailors who reserved a red boat
```
```
SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red';
```
![OUTPUT](5.jpeg)
```
# 6. Colors of boats reserved by Lubber
```
```
SELECT DISTINCT b.color
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE s.sname = 'Lubber';
```
![OUTPUT](6.jpeg)
```
# 7. Names of sailors who reserved at least one boat
```
```
SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid;
```
![OUTPUT](7.jpeg)
```
# 8. Ratings of persons who sailed two different boats on the same day
```
```
SELECT DISTINCT s.sname, s.rating
FROM Sailors s
JOIN Reserves r1 ON s.sid = r1.sid
JOIN Reserves r2 ON r1.sid = r2.sid
                  AND r1.day = r2.day
                  AND r1.bid <> r2.bid;
```
![OUTPUT](8.jpeg)
```
# 9. Ages of sailors whose name begins and ends with B and has at least 3 characters
```
```
SELECT age
FROM Sailors
WHERE sname LIKE 'B%B'
AND LENGTH(sname) >= 3;
```
![OUTPUT](9.jpeg)
```
# 10. Names of sailors who reserved a red boat OR a green boat
```
```
SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color IN ('red', 'green');
```
![OUTPUT](10.jpeg)
```
# 11. Names of sailors who reserved both red and green boats
```
```
SELECT DISTINCT s.sname
FROM Sailors s
WHERE s.sid IN (
    SELECT r.sid
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE b.color = 'red'
)
AND s.sid IN (
    SELECT r.sid
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE b.color = 'green'
);
```
![OUTPUT](11.jpeg)
```
# 12. SIDs of sailors who reserved red boats but NOT green boats
```
```
SELECT DISTINCT s.sid
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red'
AND s.sid NOT IN (
    SELECT r2.sid
    FROM Reserves r2
    JOIN Boats b2 ON r2.bid = b2.bid
    WHERE b2.color = 'green'
);
```
![OUTPUT](12.jpeg)
```
# 13. Ratings of sailors with rating 10 OR who reserved boat 104
```
```
SELECT DISTINCT s.rating
FROM Sailors s
LEFT JOIN Reserves r ON s.sid = r.sid
WHERE s.rating = 10
   OR r.bid = 104;
```
![OUTPUT](13.jpeg)
```
# 14. Names of sailors who reserved boat 103
```
```
SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
WHERE r.bid = 103;
```
![OUTPUT](14.jpeg)
```
# 15. Names of sailors who reserved a red boat
```
```
SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red';
```
![OUTPUT](15.jpeg)
```
# 16. Names of sailors who reserved boat 103
```
```
SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
WHERE r.bid = 103;
```
![OUTPUT](16.jpeg)
```
# 17. Sailors whose rating is better than SOME sailor named Horatio
```
```
SELECT *
FROM Sailors
WHERE rating > ANY (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);
```
![OUTPUT](17.jpeg)
```
# 18. Sailors whose rating is better than EVERY sailor named Horatio
```
```
SELECT *
FROM Sailors
WHERE rating > ALL (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);
```
![OUTPUT](18.jpeg)
```
# 19. Sailors with the highest rating
```
```
SELECT *
FROM Sailors
WHERE rating = (
    SELECT MAX(rating)
    FROM Sailors
);
```
![OUTPUT](19.jpeg)
```
# 20. Names of sailors who reserved both red and green boats
```
```
SELECT DISTINCT s.sname
FROM Sailors s
WHERE s.sid IN (
    SELECT r.sid
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE b.color = 'red'
)
AND s.sid IN (
    SELECT r.sid
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE b.color = 'green'
);
```
![OUTPUT](20.jpeg)
```
# 21. Names of sailors who reserved ALL boats
```
```
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
```
![OUTPUT](21.jpeg)
```
# 22. Average age of all sailors
```
```
SELECT AVG(age) AS average_age
FROM Sailors;
```
![OUTPUT](22.jpeg)
```
# 23. Average age of sailors with rating 10
```
```
SELECT AVG(age) AS average_age
FROM Sailors
WHERE rating = 10;
```
![OUTPUT](23.jpeg)
```
# 24. Name and age of the oldest sailor
```
```
SELECT sname, age
FROM Sailors
WHERE age = (
    SELECT MAX(age)
    FROM Sailors
);
```
![OUTPUT](24.jpeg)
```
# 25. Number of sailors
```
```
SELECT COUNT(*) AS number_of_sailors
FROM Sailors;
```
![OUTPUT](25.jpeg)
```
# 26. Number of different sailor names
```
```
SELECT COUNT(DISTINCT sname) AS different_names
FROM Sailors;
```
![OUTPUT](26.jpeg)
```
# 22. Average age of all sailors
```
```

SELECT AVG(age) AS average_age
FROM Sailors;
```
![OUTPUT](22.jpeg)
```
# 23. Average age of sailors with rating 10
```
```
SELECT AVG(age) AS average_age
FROM Sailors
WHERE rating = 10;
```
![OUTPUT](23.jpeg)
```
# 24. Name and age of the oldest sailor
```
```
SELECT sname, age
FROM Sailors
WHERE age = (
    SELECT MAX(age)
    FROM Sailors
);
```
![OUTPUT](24.jpeg)
```
# 25. Number of sailors
```
```
SELECT COUNT(*) AS number_of_sailors
FROM Sailors;
```
![OUTPUT](25.jpeg)
```
# 26. Number of different sailor names
```
```
SELECT COUNT(DISTINCT sname) AS different_names
FROM Sailors;
```
![OUTPUT](26.jpeg)
```
# 27. Sailors older than the oldest sailor with rating 10
SELECT sname, age
FROM Sailors
WHERE age > (
    SELECT MAX(age)
    FROM Sailors
);
![OUTPUT](27.jpeg)
# 28. Youngest sailor for each rating level
```
```
SELECT rating, MIN(age) AS youngest_age
FROM Sailors
```
![OUTPUT](28.jpeg)
```
```
```
SELECT rating, MIN(age) AS youngest_age
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![OUTPUT](29.jpeg)
```
# 30. Number of reservations for each red boat
SELECT b.bid, COUNT(r.sid) AS number_of_reservations
FROM Boats b
LEFT JOIN Reserves r ON b.bid = r.bid
WHERE b.color = 'red'
```
![OUTPUT](30.jpeg)
```
# 31. Average age for each rating having at least 2 sailors
```
```
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![OUTPUT](31.jpeg)
```
# 32. Average age of voting-age sailors for each rating having at least 2 voting-age sailors
```
```
SELECT rating, AVG(age) AS average_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![OUTPUT](32.jpeg)
```
# 33. Average age of voting-age sailors for each rating having at least 2 such sailors
```
```
SELECT rating, AVG(age) AS average_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
```
![OUTPUT](33.jpeg)
```
# 34. Rating(s) having the minimum average age
```
```
SELECT rating, AVG(age) AS average_age
FROM Sailors
GROUP BY rating
HAVING AVG(age) = (
    SELECT MIN(average_age)
    FROM (
        SELECT AVG(age) AS average_age
        FROM Sailors
        GROUP BY rating
    )
);
```
![OUTPUT](34.jpeg)
```SELECT rating, AVG(age) AS average_age
GROUP BY b.bid;
```
```
WHERE age >= 18
FROM Sailors
# 29. Youngest voting-age sailor for each rating having at least 2 voting-age sailors
GROUP BY rating;
```
```
    WHERE rating = 10
```

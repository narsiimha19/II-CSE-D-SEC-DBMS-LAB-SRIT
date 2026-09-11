--Find the names of sailors who are older than the oldest sailor with a rating of 10.

SELECT sname
FROM Sailors
WHERE age > (
    SELECT MAX(age)
    FROM Sailors
    WHERE rating = 10
);
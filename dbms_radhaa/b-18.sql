--Find sailors whose rating is better than every sailor called Horatio
SELECT *
FROM Sailors
WHERE rating > ALL (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio';
    
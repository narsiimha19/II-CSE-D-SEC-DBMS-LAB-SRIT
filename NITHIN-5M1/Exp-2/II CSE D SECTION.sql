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
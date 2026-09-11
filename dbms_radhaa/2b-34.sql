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

--Find the average age of sailors for each rating level that has at least two sailors.

SELECT rating, AVG(age) AS average_age
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;
2
--Find the average age of sailors who are of voting age (i.e., at least 18 years old) for each rating level that has at least two sailors.

SELECT rating, AVG(age) AS average_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;

--

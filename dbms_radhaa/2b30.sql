--Find the age of the youngest sailor who is eligible to vote (at least 18 years) for each rating level with at least two such sailors.

SELECT rating, MIN(age) AS youngest_age
FROM Sailors
WHERE age >= 18
GROUP BY rating
HAVING COUNT(*) >= 2;
--Find the age of the youngest sailor for each rating level.

SELECT rating, MIN(age) AS youngest_age
FROM Sailors
GROUP BY rating;

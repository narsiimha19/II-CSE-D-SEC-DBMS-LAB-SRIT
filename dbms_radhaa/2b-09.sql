--find the ages of sailoes whose name begins and ends with B
SELECT age
FROM Sailors
WHERE sname LIKE 'B%B'
AND LENGTH(sname) >= 3;

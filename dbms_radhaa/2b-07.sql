--Find the names of sailors who have reserved at least one boat. 7
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r
WHERE s.sid = r.sid;
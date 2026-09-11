--Find the names of sailors who reserved a red boat or a green boat.
SELECT DISTINCT s.sname
FROM Sailors s, Reserves r, Boats b
WHERE s.sid = r.sid
AND r.bid = b.bid
AND (b.color = 'red' OR b.color = 'green');
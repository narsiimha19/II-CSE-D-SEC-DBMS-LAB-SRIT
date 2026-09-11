SELECT s.sname
FROM Sailors s
WHERE EXISTS (
    SELECT 1
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE r.sid = s.sid
    AND b.color = 'red'
)
AND EXISTS (
    SELECT 1
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE r.sid = s.sid
    AND b.color = 'green'
);
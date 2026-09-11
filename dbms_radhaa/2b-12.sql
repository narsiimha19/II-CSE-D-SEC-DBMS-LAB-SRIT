SELECT DISTINCT r.sid
FROM Reserves r
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red'
AND r.sid NOT IN (
    SELECT r2.sid
    FROM Reserves r2
    JOIN Boats b2 ON r2.bid = b2.bid
    WHERE b2.color = 'green'
);
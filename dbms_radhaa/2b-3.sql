--find the names of saiors who have reserved boat number 1033
SELECT DISTINCT r.sid
FROM Reserves r
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red';

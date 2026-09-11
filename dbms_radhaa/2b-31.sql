--For each red boat, find the number of reservations for this boat.

SELECT b.bid, COUNT(r.sid) AS reservation_count
FROM Boats b
LEFT JOIN Reserves r
ON b.bid = r.bid
WHERE b.color = 'red'
GROUP BY b.bid;


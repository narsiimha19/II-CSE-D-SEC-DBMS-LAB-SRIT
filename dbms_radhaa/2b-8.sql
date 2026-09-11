--compute increments
UPDATE Sailors
SET rating = rating + 1
WHERE sid IN (
    SELECT r1.sid
    FROM Reserves r1
    JOIN Reserves r2
      ON r1.sid = r2.sid
     AND r1.day = r2.day
     AND r1.bid <> r2.bid
);
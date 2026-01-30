-- PROBLEM STATEMENT

-- 1. Identify customers who have completed the most bookings. What insights can you draw about their behavior?
SELECT 
    Customers.CustomerID,
    Customers.Name,
    COUNT(Bookings.BookingID) AS CompletedBookings
FROM Customers
JOIN Bookings
    ON Customers.CustomerID = Bookings.CustomerID
WHERE Bookings.Status = 'Completed'
GROUP BY Customers.CustomerID, Customers.Name
ORDER BY CompletedBookings DESC;

-- 2. Find the top 5 drivers who have completed the longest trips in terms of distance. What does this say about their working patterns?
SELECT 
    Driver.DriverID,
    Driver.Name,
    SUM(TripDetails.Distance) AS TotalDistance
FROM Driver
JOIN Cabs
    ON Driver.DriverID = Cabs.DriverID
JOIN Bookings
    ON Cabs.CabID = Bookings.CabID
JOIN TripDetails
    ON Bookings.BookingID = TripDetails.BookingID
WHERE Bookings.Status = 'Completed'
GROUP BY Driver.DriverID, Driver.Name
ORDER BY TotalDistance DESC
LIMIT 5;

-- 3. Analyze the average waiting time (difference between booking time and trip start time) for different pickup locations. How can this be optimized to reduce delays?
SELECT 
    Bookings.PickLocation,
    AVG(TIMESTAMPDIFF(MINUTE, Bookings.BookingTime, Bookings.StartTime)) AS AvgWaitingTime_Minutes
FROM Bookings
WHERE Bookings.Status = 'Completed'
  AND Bookings.StartTime IS NOT NULL
GROUP BY Bookings.PickLocation;
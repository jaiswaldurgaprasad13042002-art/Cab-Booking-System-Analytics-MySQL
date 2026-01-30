Create Database Project;
use Project;

-- 1. Customers
Create Table Customers (
CustomerID INT PRIMARY KEY,
Name varchar(100),
Phone varchar(100),
Email varchar(100),
JoinDate date
);

Insert into Customers(CustomerID, Name, Phone, Email, JoinDate) Values
(1, 'Chulbul Pandey', '9876543210', 'chulbul@example.com', '2024-01-10'),
(2, 'Ramesh Tiwari', '8765432109', 'ramesh@example.com', '2024-02-15'),
(3, 'SuryaKumar Yadav', '7654321098', 'SuryaK@example.com', '2024-03-01'),
(4, 'Honey Singh', '6543210987', 'Honey@example.com', '2024-04-05');

select * from Customers;

-- 2. Driver
Create Table Driver (
DriverID INT PRIMARY KEY,
Name varchar(100),
Phone varchar(100),
LicenseNumber varchar(100),
JoinDate date,
Rating Float
);

Insert into Driver(DriverID, Name, Phone, LicenseNumber, JoinDate, Rating) Values
(1, 'Sushant Singh', '9123456789', 'DL12345678', '2023-09-01', 4.5),
(2, 'Sunny Chaudhary', '9234567890', 'DL87654321', '2023-10-12', 3.2),
(3, 'Anshu P', '9345678901', 'DL23456789', '2024-01-20', 2.8),
(4, 'Alia Kapoor', '9456789012', 'DL34567890', '2024-03-15', 4.0);

select * from Driver;

-- 3. Cabs
Create Table Cabs(
CabID INT PRIMARY KEY,
DriverID INT,
CabType varchar(100),
PlateNumber varchar(100),
foreign key (DriverID) REFERENCES Driver(DriverID));

Insert into Cabs (CabID, DriverID, CabType, PlateNumber) Values
(1, 1, 'Sedan', 'KA01AB1234'),
(2, 2, 'SUV', 'KA01CD5678'),
(3, 3, 'Sedan', 'KA01EF9012'),
(4, 4, 'SUV', 'KA01GH3456');

select * from Cabs;

-- 4. Bookings
Create Table Bookings (
BookingID int primary key,
CustomerID INT,
CabID INT,
BookingTime datetime,
StartTime datetime,
EndTime datetime,
PickLocation varchar(100),
DropLocation varchar(100),
Status varchar(100),
foreign key (CustomerID) references Customers(CustomerID),
foreign key (CabID) references Cabs(CabID));

Insert into Bookings (BookingID, CustomerID, CabID, BookingTime, StartTime, EndTime, PickLocation, DropLocation, Status) Values
(101, 1, 1, '2025-05-01 08:00:00', '2025-05-01 08:10:00', '2025-05-01 08:40:00', 'Downtown', 'Airport', 'Completed'),
(102, 2, 2, '2025-05-01 09:00:00', NULL, NULL, 'Station', 'Mall', 'Cancelled'),
(103, 1, 3, '2025-05-02 10:00:00', '2025-05-02 10:15:00', '2025-05-02 10:50:00', 'Downtown', 'Hospital', 'Completed'),
(104, 3, 4, '2025-05-03 11:30:00', '2025-05-03 11:45:00', '2025-05-03 12:30:00', 'Mall', 'University', 'Completed'),
(105, 4, 1, '2025-05-04 14:00:00', NULL, NULL, 'Airport', 'Downtown', 'Cancelled');

select * from Bookings;

-- 5. Trip Details
Create Table TripDetails (
TripID INT primary key,
BookingID int,
Distance float,
Fare decimal(10,2),
DriverRating float,
foreign key (BookingID) references Bookings(BookingID));

Insert into TripDetails (TripID, BookingID, Distance, Fare, DriverRating) Values
(1001, 101, 12.5, 250.00, 5.0),
(1002, 103, 10.0, 200.00, 4.0),
(1003, 104, 15.0, 300.00, 3.5);

select * from TripDetails;

-- 6. Feedback
Create Table Feedback (
FeedID int primary key,
BookingID int,
CustomerFeedback text,
ReasonForCancellation varchar(100),
foreign key (BookingID) references Bookings(BookingID));

Insert into Feedback (FeedID, BookingID, CustomerFeedback, ReasonForCancellation) Values
(501, 102, 'Cab was late, had to cancel.', 'Driver Delay'),
(502, 105, 'Change of plans.', 'Customer Personal Reason');

select * from Feedback;
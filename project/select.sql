-- 1. Login User
-- select * from Users where username = 'username' and password = 'password';
select * from Users where username='user2' and password='123324';

-- 2. Past Booking
-- select * from BookingDetails where uid = 'username';
select * from BookingDetails where uid ='9';

-- 3. Schedule checking
-- select * from Bus as b inner join Schedule as s on b.bid = s.bid WHERE fromcity = 'fromCity' AND toCity = 'toCity';
select * from Bus as b inner join Schedule as s on b.bid = s.bid WHERE fromcity = 'Agra' AND toCity = 'Delhi';

-- 4. Number of bookings for a date and a bus.
-- select count(*) from BookingDetails where dateOfTravel = 'date of travel' AND bid = 'bid' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));
select count(*) from BookingDetails where dateOfTravel = '2018-06-07' AND bid = '2' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));

-- 5. Number of seats avaliable for a date for and a bus.
-- select (B.numSeat-count(*)) as numSeats From Bus as B INNER join  BookingDetails AS BD on B.bid = BD.bid where dateOfTravel = 'date of travel' AND B.bid = 'bid' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));
select (B.numSeat-count(*)) as numSeats From Bus as B INNER join  BookingDetails AS BD on B.bid = BD.bid where dateOfTravel = '2018-06-07' AND B.bid = '2' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));

-- 6. Number of seats avaliable for a date for all bus.
-- select (B.numSeat-count(*)) as numSeats From Bus as B INNER join  BookingDetails AS BD on B.bid = BD.bid where dateOfTravel = 'date of travel' AND B.bid = 'B.bid' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));
select (B.numSeat-count(*)) as numSeats From Bus as B INNER join  BookingDetails AS BD on B.bid = BD.bid where dateOfTravel = '2018-06-07' AND B.bid = B.bid AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2)) group by B.bid;

-- 7. Number of seats avaliable for a date for all bus with all BusInformation.
-- select B.*,(B.numSeat-count(*)) as numSeats From Bus as B INNER join  BookingDetails AS BD on B.bid = BD.bid where dateOfTravel = 'date of travel' AND B.bid = 'B.bid' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));
select B.*,(B.numSeat-count(*)) as numSeats From Bus as B INNER join  BookingDetails AS BD on B.bid = BD.bid where dateOfTravel = '2018-06-07' AND B.bid = '2' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));

-- 8. Add On fare percent.
DROP FUNCTION totalFare;
DELIMITER //

CREATE FUNCTION totalFare (bus_id int)
RETURNS int(11)

BEGIN
  declare tf int(11);
  declare Ac int(11);
  declare Meals int(11);
  declare Wifi int(11);
  declare Sleeper int(11);
  declare Washroom int(11);
  declare Ac_Per int(11);
  declare Meals_Per int(11);
  declare Wifi_Per int(11);
  declare Sleeper_Per int(11);
  declare Washroom_Per int(11);
  declare Base_Fare int(11);

  SELECT baseFare into Base_Fare FROM Bus where bid = bus_id;
  SELECT ac into Ac FROM Amenities where bid = bus_id;
  SELECT wifi into Wifi FROM Amenities where bid = bus_id;
  SELECT meals into Meals FROM Amenities where bid = bus_id;
  SELECT sleeper into Sleeper FROM Amenities where bid = bus_id;
  SELECT washroom into Washroom FROM Amenities where bid = bus_id;

  select percent into Ac_Per from AmenitiesShare where name='ac';
  select percent into Wifi_Per from AmenitiesShare where name='wifi';
  select percent into Meals_Per from AmenitiesShare where name='ac';
  select percent into Sleeper_Per from AmenitiesShare where name='sleeper';
  select percent into Washroom_Per from AmenitiesShare where name='washroom';

  set tf = ((Ac * Ac_Per + Meals * Meals_Per + Wifi * Wifi_Per + Sleeper * Sleeper_Per + Washroom + Washroom_Per) * Base_Fare) / 100;
  return tf;

END; //

DELIMITER ;

select bid, totalFare(bid) as totalFare from Bus where bid='2';

-- 9. cleanupBooking.
delete from BookingDetails WHERE status = 0 AND datediff(bookingDate, CURDATE()) > 2;

-- 10. Final booking.
-- INSERT into  BookingDetails values('bdid', 'uid', 'bid', 'dateOfTravel', 'bookingDate', 'direction', 'seatNo', 'totalFare', 'status');
insert into BookingDetails values ('11',10,'1','2018-02-07','2018-01-07',10,1,645,1);

-- 11. Cancellation.
DELETE from BookingDetails where bdid = '11' AND uid = '10';

-- 12. List of temporary booking with direction.
select * from BookingDetails as BD inner join Bus as B on B.bid = BD.bid WHERE status = 0 AND fromCity = 'Agra' AND toCity = "Delhi" AND direction = 1;

-- 13. List of temporary booking.
select bid, status, count(*) AS bookings from BookingDetails as BD where status = 0 group by bid;

-- 14. Create new admin.
insert into Users values ('12','Amit Kumar','us62','us621111@gmail.com',1,'123324','IIT Patna','7312319132');

-- 15. Each bus revenue.
select SUM(paymentAmount), count(*) AS count, BD.bid, direction from Payments as pa inner join BookingDetails as BD on BD.bdid = pa.bdid Group by BD.bid, BD.direction;

-- 16. Update booking status if cancellation is formed
update BookingDetails set status = -1 where datediff(bookingDate,CURDATE())>2 AND status = 0;

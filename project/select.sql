-- 1. Login User
select * from Users where username = 'username' and password = 'password';

-- 2. Past Booking
select * from BookingDetails where uid = 'username';

--3. Schedule checking
select * from Bus as b inner join Schedule as s on b.bid = s.bid WHERE formcity = 'fromCity' AND toCity = 'toCity';

--4. Number of bookings for a date and a bus.
select count(*) from BookingDetails where dateOfTravel = 'date of travel' AND bid = 'bid' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));

-- 5. Number of seats avaliable for a date for and a bus.
select (B.numSeat-count(*)) as numSeats From Bus as B INNER join  BookingDetails AS BD on B.bid = BD.bid where dateOfTravel = 'date of travel' AND B.bid = 'bid' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));

-- 6. Number of seats avaliable for a date for all bus.
select (B.numSeat-count(*)) as numSeats From Bus as B INNER join  BookingDetails AS BD on B.bid = BD.bid where dateOfTravel = 'date of travel' AND B.bid = 'B.bid' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));

-- 7. Number of seats avaliable for a date for all bus with all BusInformation.
select B.*,(B.numSeat-count(*)) as numSeats From Bus as B INNER join  BookingDetails AS BD on B.bid = BD.bid where dateOfTravel = 'date of travel' AND B.bid = 'B.bid' AND (status = 1 or (status = 0 AND datediff(bookingDate, CURDATE()) <= 2));

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

select bid, totalFare(bid) from Bus;

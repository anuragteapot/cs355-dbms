drop database bus;
create database bus;
  use bus;

  --
  -- 1. Table structure for table `Users`
  --

  CREATE TABLE IF NOT EXISTS Users (
    uid int(11) NOT NULL AUTO_INCREMENT,
    name varchar(400) NOT NULL DEFAULT '',
    username varchar(150) NOT NULL DEFAULT '',
    email varchar(100) NOT NULL DEFAULT '',
    admin tinyint(4) NOT NULL DEFAULT 0,
    password varchar(100) NOT NULL DEFAULT '',
    address varchar(100) NOT NULL DEFAULT '',
    phonenumber varchar(15) NOT NULL DEFAULT 0,
    PRIMARY KEY (uid)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

  --
  -- 2. Table structure for table `BusInformation`
  --

  CREATE TABLE IF NOT EXISTS Bus (
    bid int(11) primary key,
    name varchar(100) not null unique,
    numSeat int(11) not null,
    fromCity varchar(10) not null,
    toCity varchar(10) not null,
    baseFare int(11) not null
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

  --
  -- 3. Table structure for table `BookingDetails`
  --

  CREATE TABLE IF NOT EXISTS BookingDetails (
    bdid int(11) primary key AUTO_INCREMENT,
    uid int(11),
    bid int(10),
    dateOfTravel Date,
    bookingDate Date NOT NULL,
    seatNo int(11) not null,
    direction int(11) NOT NULL COMMENT 'UP 0 | Down 1',
    totalFare int(11) not null,
    status int(4) COMMENT 'DONE 1 | Pending 0',
    constraint Fk_Users Foreign key(uid)references Users(uid) on delete cascade,
    constraint Fk_Bus Foreign key(bid)references Bus(bid) on delete cascade
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

  --
  -- 4. Table structure for table `Payments`
  --

  CREATE TABLE IF NOT EXISTS Payments (
    pid int(11) AUTO_INCREMENT primary key,
    bdid int(11),
    paymentDate Date,
    paymentAmount int(11) not null,
    status int(4) COMMENT 'DONE 1 | Pending 0 | FAILED -1',
    constraint Fk_User_Payments Foreign key(bdid)references BookingDetails(bdid) on delete cascade
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

  --
  -- 5. Table structure for table `Amenities`
  --

  CREATE TABLE IF NOT EXISTS Amenities (
    ac tinyint(4) COMMENT 'Avaliable 1 | NotAvaliable 0',
    wifi tinyint(4) COMMENT 'Avaliable 1 | NotAvaliable 0',
    sleeper tinyint(4) COMMENT 'Avaliable 1 | NotAvaliable 0',
    washroom tinyint(4) COMMENT 'Avaliable 1 | NotAvaliable 0',
    meals tinyint(4) COMMENT 'Avaliable 1 | NotAvaliable 0',
    bid int(10) NOT NULL primary key,
    constraint FK_BusA Foreign Key(bid) references Bus(bid) on delete cascade
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

  --
  -- 6. Table structure for table `AmenitiesShare`
  --

  CREATE TABLE IF NOT EXISTS AmenitiesShare (
    Name varchar(11) primary Key,
    Percent int (11)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

  --
  -- 7. Table structure for table `Schedule`
  --

  CREATE TABLE IF NOT EXISTS Schedule (
    bid int(11) NOT NULL primary key,
    arrival varchar(50) NOT NULL,
    departure varchar(50) NOT NULL,
    direction tinyint(4) NOT NULL COMMENT 'UP 0 | Down 1',
    constraint FK_BusS Foreign Key(bid) references Bus(bid) on delete cascade
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

  --
  -- 6. Table structure for table `TotalFare`
  --
  CREATE TABLE IF NOT EXISTS TotalFare (
    bid int(10) NOT NULL primary key,
    totalFare int(11),
    constraint FK_BusT Foreign Key(bid) references Bus(bid) on delete cascade
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;


  -- Triggers
  -- create trigger cleanupBooking BEFORE INSERT on BookingDetails FOR EACH ROW
  --   delete from BookingDetails where bdid in (select bdid from Payments WHERE status = 0) AND  datediff(bookingDate, CURDATE()) > 2;

  create trigger update_Booking_status  AFTER UPDATE on Payments FOR EACH ROW
    update BookingDetails as b set b.status = NEW.status where b.bdid = NEW.bdid;

  -- create trigger insert_Booking_status AFTER INSERT on Payments FOR EACH ROW
  --   update BookingDetails as b set b.status = NEW.status where b.bdid = NEW.bdid;

  create trigger insert_Payments AFTER INSERT on BookingDetails FOR EACH ROW
    insert into Payments(bdid, paymentDate,paymentAmount,status) values(NEW.bdid, NEW.bookingDate, NEW.totalFare, NEW.status);

  -- Insert into Users
  insert into Users values ('1','Amit','user2','uservns1111@gmail.com',0,'123324','IIT Patna','7376319132');
  insert into Users values ('2','Abhinav','user3','user@gmail.com',0,'234','IIT Patna','7376349112');
  insert into Users values ('3','Abhishek','user4','anuruser@gmail.com',0,'123','IIT Patna','7376359132');
  insert into Users values ('4','Vikash','user5','userns1111@gmail.com',0,'345','IIT Patna','7376319132');
  insert into Users values ('5','Dinesh','user6','useragvns1111@gmail.com',0,'123','IIT Patna','7876349132');
  insert into Users values ('6','Dinesh','user7','anuragvnsuser@gmail.com',0,'3251','IIT Patna','7876149132');
  insert into Users values ('7','Anurag','user8','anuragvns11user@gmail.com',0,'23452','IIT Patna','7356349132');
  insert into Users values ('8','Dinesh','user9','anuragvuser@gmail.com',0,'2351','IIT Patna','7376341132');
  insert into Users values ('9','Anurag','user10','anurauser@gmail.com',0,'24521','IIT Patna','7376649132');
  insert into Users values ('10','Anurag','user1','uservns1411@gmail.com',1,'2123','IIT Patna','7316349132');

  -- Insert into Users
  insert into Bus values ('1','Bus1',45,'Agra','Delhi',1245);
  insert into Bus values ('2','Bus2',35,'Varanasi','Delhi',1125);
  insert into Bus values ('3','Bus3',35,'Varanasi','Agra',1555);
  insert into Bus values ('4','Bus4',45,'Goa','Delhi',2225);
  insert into Bus values ('5','Bus5',30,'Goa','Agra',2225);
  insert into Bus values ('6','Bus6',45,'Goa','Varanasi',1665);
  insert into Bus values ('7','Bus7',45,'Bangalore','Delhi',1990);
  insert into Bus values ('8','Bus8',35,'Bangalore','Goa',1210);
  insert into Bus values ('9','Bus9',45,'Bangalore','Agra',1110);
  insert into Bus values ('10','Bus10',30,'Agra','Kerala',1700);

  -- Insert into BookingDetails
  insert into BookingDetails values ('1',1,'1','2018-02-07','2018-01-07',1,1,1231,1);
  insert into BookingDetails values ('2',2,'2','2018-06-07','2018-02-02',2,0,2132,0);
  insert into BookingDetails values ('3',3,'3','2018-06-07','2018-05-07',3,1,2343,1);
  insert into BookingDetails values ('4',4,'1','2018-08-07','2018-07-07',4,0,2342,1);
  insert into BookingDetails values ('5',5,'1','2018-09-07','2018-08-07',5,1,5252,0);
  insert into BookingDetails values ('6',6,'2','2018-02-07','2018-03-07',6,1,1245,1);
  insert into BookingDetails values ('7',7,'2','2018-03-07','2018-02-07',7,0,5745,0);
  insert into BookingDetails values ('8',8,'3','2018-01-07','2018-01-07',8,1,1145,0);
  insert into BookingDetails values ('9',9,'1','2018-01-07','2018-01-07',9,0,4645,1);
  insert into BookingDetails values ('10',10,'1','2018-02-07','2018-01-07',10,1,645,1);

  -- Insert into Users
  insert into Amenities values (1,0,1,1,1,1);
  insert into Amenities values (0,0,1,0,1,2);
  insert into Amenities values (0,0,1,1,0,3);
  insert into Amenities values (0,0,1,1,1,4);
  insert into Amenities values (1,0,1,0,1,5);
  insert into Amenities values (1,0,1,1,0,6);
  insert into Amenities values (1,0,0,1,1,7);
  insert into Amenities values (0,0,0,0,0,8);
  insert into Amenities values (1,0,0,0,0,9);
  insert into Amenities values (1,1,1,1,1,10);

  -- Insert into AmenitiesShare
  insert into AmenitiesShare values ('ac',10);
  insert into AmenitiesShare values ('wifi',15);
  insert into AmenitiesShare values ('sleeper',5);
  insert into AmenitiesShare values ('washroom',5);
  insert into AmenitiesShare values ('meals',20);

  -- Insert into Schedule
  insert into Schedule values (1,'12:00 AM','21:00 PM',0);
  insert into Schedule values (2,'12:00 AM','24:00 PM',0);
  insert into Schedule values (3,'13:00 AM','05:00 PM',0);
  insert into Schedule values (4,'12:00 AM','24:00 PM',0);
  insert into Schedule values (5,'15:00 AM','01:00 PM',0);
  insert into Schedule values (6,'14:00 AM','24:00 PM',0);
  insert into Schedule values (7,'12:00 AM','13:00 PM',0);
  insert into Schedule values (8,'16:00 AM','24:00 PM',0);
  insert into Schedule values (9,'12:00 AM','24:00 PM',0);
  insert into Schedule values (10,'12:00 AM','18:00 PM',0);


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

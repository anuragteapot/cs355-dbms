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
    direction int(11) NOT NULL COMMENT 'UP 0 | Down 1',
    seatNo int(11) not null,
    totalFare int(11) not null,
    status int(4) COMMENT 'DONE 1 | Pending 0',
    constraint Fk_Users Foreign key(uid)references Users(uid),
    constraint Fk_Bus Foreign key(bid)references Bus(bid)
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
    constraint Fk_User_Payments Foreign key(bdid)references BookingDetails(bdid)
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
    constraint FK_BusA Foreign Key(bid) references Bus(bid)
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
    constraint FK_BusS Foreign Key(bid) references Bus(bid)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

  --
  -- 6. Table structure for table `TotalFare`
  --
  CREATE TABLE IF NOT EXISTS TotalFare (
    bid int(10) NOT NULL primary key,
    totalFare int(11),
    constraint FK_BusT Foreign Key(bid) references Bus(bid)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;


  -- Triggers
  -- create trigger cleanupBooking BEFORE INSERT on BookingDetails FOR EACH ROW
  --   delete from BookingDetails where bdid in (select bdid from Payments WHERE status = 0) AND  datediff(bookingDate, CURDATE()) > 2;

  create trigger update_Booking_status  AFTER UPDATE on Payments FOR EACH ROW
    update BookingDetails as b set b.status = NEW.status where b.bdid = NEW.bdid;

  create trigger insert_Booking_status AFTER INSERT on Payments FOR EACH ROW
    update BookingDetails as b set b.status = NEW.status where b.bdid = NEW.bdid;

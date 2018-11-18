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
insert into BookingDetails values ('2',2,'2','2018-06-07','2018-02-02',2,1,2132,0);
insert into BookingDetails values ('3',3,'3','2018-06-07','2018-05-07',3,1,2343,1);
insert into BookingDetails values ('4',4,'1','2018-08-07','2018-07-07',4,1,2342,1);
insert into BookingDetails values ('5',5,'1','2018-09-07','2018-08-07',5,1,5252,0);
insert into BookingDetails values ('6',6,'2','2018-02-07','2018-03-07',6,1,1245,1);
insert into BookingDetails values ('7',7,'2','2018-03-07','2018-02-07',7,1,5745,0);
insert into BookingDetails values ('8',8,'3','2018-01-07','2018-01-07',8,1,1145,0);
insert into BookingDetails values ('9',9,'1','2018-01-07','2018-01-07',9,1,4645,1);
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

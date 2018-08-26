-- Drop database
drop database db_lab3;

-- Create database
create database db_lab3;

-- Use database
use db_lab3;

-- Create tables
create table product(
  productId int NOT NULL,
  productName varchar(50),
  categoryName varchar(50),
  packageDesc varchar(50),
  price decimal(9,2),
PRIMARY KEY (productId)
);

create table customer(
  customerId int NOT NULL PRIMARY KEY,
  password VARCHAR(20) NOT NULL,
  cname VARCHAR(50) NOT NULL,
  street VARCHAR(50),
  city VARCHAR(20),
  state VARCHAR(2),
  zipcode VARCHAR(10),
  phone VARCHAR(10),
  email VARCHAR(30) NOT NULL
);

create table orders(
  orderId int NOT NULL PRIMARY KEY,
  customerId integer,
  totalAmount decimal(9,2),
  CONSTRAINT FK_Orders_Customer FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

create table orderedProduct(
  orderId int NOT NULL,
  productId int NOT NULL,
  quantity int,
  price decimal(9,2),
  PRIMARY KEY (orderId, productId),
  CONSTRAINT FK_OrderedProduct_Order FOREIGN KEY (orderId) REFERENCES orders(orderId),
  CONSTRAINT FK_OrderedProduct_Product FOREIGN KEY (productId) REFERENCES product (productId)
);

-- Trigger

create trigger `change_orderProduct`
AFTER UPDATE on orderedProduct FOR EACH ROW
update orders set orders.totalAmount = NEW.price * NEW.quantity where orderId = NEW.orderId;

create trigger `delete_order` BEFORE delete on customer FOR EACH ROW
delete from orders where customerId = old.customerId;
create trigger `delete_orderProduct` BEFORE delete on orders FOR EACH ROW
delete from orderedProduct where orderId = old.orderId;

-- Insert into product
insert into product values (1,'pa','ca','pde1','90.00');
insert into product values (2,'pb','cb','pde2','20.00');
insert into product values (3,'pc','cc','pde3','30.00');
insert into product values (4,'pd','cd','pde4','40.00');

-- Insert into customer
insert into customer values (1,'pa1','cn1','st1','ct1','s1','10020','726467373','abc@gmail.com');
insert into customer values (2,'pa2','cn2','st2','ct2','s2','10050','726467673','abc@gmail.com');
insert into customer values (3,'pa3','cn3','st3','ct3','s3','10020','726467373','abc@gmail.com');
insert into customer values (4,'pa4','cn4','st4','ct4','s4','10220','726467673','abc@gmail.com');

-- Insert into orders
insert into orders values ('1',1,'90.00');
insert into orders values ('2',2,'40.00');
insert into orders values ('3',3,'20.00');
insert into orders values ('4',4,'50.00');

-- Insert into orderedProduct
insert into orderedProduct values (1,1,'23','30.00');
insert into orderedProduct values (2,2,'25','70.00');
insert into orderedProduct values (3,3,'43','20.00');
insert into orderedProduct values (4,4,'63','60.00');

-- Select
select * from product;
select * from customer;
select * from orders;
select * from orderedProduct;

-- Update
update orderedProduct set price = '50.40' where orderId = 2;

-- Delete
delete from customer where customerId = 4;

-- Select
select * from product;
select * from customer;
select * from orders;
select * from orderedProduct;

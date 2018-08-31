-- Drop database
drop database db_item;

-- Create database
create database db_item;

-- Use database
use db_item;

-- Create table
create table item(
    product varchar(16),
    quantity integer,
    price integer,
    cost integer
);

-- Insert
insert into item(product,quantity,price) values ('Winter Tire','4','90.00');
insert into item(product,quantity,price) values ('Winter Duo','2','50.00');
insert into item(product,quantity,price) values ('Winter Man','3','40.00');

-- Select
select * from item;

-- Trigger
CREATE TRIGGER `before_item_update`
BEFORE UPDATE ON item FOR EACH ROW
SET NEW.cost = NEW.price * NEW.quantity;

-- Update
UPDATE item set price = '9';

select * from item;

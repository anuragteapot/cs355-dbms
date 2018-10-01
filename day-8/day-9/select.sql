-- Q.1
Create Unique index index1 on Customer(customer_id);

ALTER TABLE Orders add Type VARCHAR(20) not null;
update Orders set type = Product_Code where Product_Code like 'cd%';

Create Unique index index2 on Orders(Order_No, Customer_Id,Product_Code,Type);

-- Q.2
ALTER TABLE Employees add income_ix int;
update Employees set income_ix = (Salary + (Salary * Commission_Pct));
select First_Name,Last_Name,income_ix from Employees where income_ix > 15000;
Create Unique index index3 on Employees(income_ix);

use task7

-- 1
create table Employees (
	Id int ,
	[name] varchar(50) ,
	salary decimal
)

-- 2
alter table Employees
ADD Department varchar(50)

-- 3
alter table Employees
drop column salary 

-- 4
exec sp_rename 'Employees.Department' , 'DeptName' , 'COLUMN'

-- 5
create table Projects (
	projectId int,
	projectName varchar
)

-- 6
alter table Employees
alter column Id int not null 

alter table Employees
add constraint primary_column primary key (Id)

-- 7
alter table Employees
add constraint unique_column unique(name)

-- 8
create table Customers (
	CustomerId int,
	FirstName varchar,
	LastName varchar,
	Email varchar,
	[Status] varchar
)

-- 9
alter table Customers
add constraint unique_name unique(FirstName , LastName)

-- 10
create table Orders (
	orderId int ,
	customerId int ,
	orderDate datetime ,
	totalAmount decimal
)

-- 11
alter table Orders
add constraint check_total check(totalAmount > 0)

-- 12
create schema Sales
alter schema Sales transfer dbo.Orders

-- 13
Exec sp_rename 'Sales.Orders' , 'SalesOrders'
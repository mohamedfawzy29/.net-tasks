create database HospitalDB

use HospitalDB

create schema BarwonHealth

create table BarwonHealth.Doctor
(
	doc_id int primary key identity(1,1),
	Name varchar(30),
	Email varchar(70),
	phone varchar(15),
	Specialty varchar(100),
	years_of_exp int
)

create table BarwonHealth.Patient
(
	UR_number int primary key identity(1,1),
	Name varchar(30),
	age int,
	address varchar(100),
	Email varchar(70) null,
	phone varchar(15),
	Midcare_number varchar(20),
	doctor_id int references BarwonHealth.Doctor(doc_id)
)

create table BarwonHealth.Pharma_company
(
	Comp_Name varchar(50) primary key,
	Phone varchar(15),
	address varchar(100)
)	

create table BarwonHealth.Drug
(
	Trade_name varchar(50) primary key,
	strength varchar(20),
	Company varchar(50) references BarwonHealth.Pharma_company(Comp_Name) on delete cascade,
)

create table BarwonHealth.Prescribes
(
	Patient_number int references BarwonHealth.Patient(UR_number),
	Drug_name varchar(50) references BarwonHealth.Drug(Trade_name),
	Doctor_id int references BarwonHealth.Doctor(doc_id),
	Date date,
	Quantity varchar(20),
	primary key (Patient_number, Drug_name, Doctor_id)
)

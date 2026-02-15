use HospitalDB

-- 1
select * from BarwonHealth.Doctor

-- 2
select * from BarwonHealth.Patient order by age 

-- 3
select * from BarwonHealth.Patient order by UR_number offset 5 rows fetch next 10 rows only

-- 4
select top 5 * from BarwonHealth.Doctor order by doc_id

-- 5
select distinct address , UR_number , Name , age , Email , phone , Midcare_number , doctor_id from BarwonHealth.Patient;

-- 6
select * from BarwonHealth.Patient where age = 25 

-- 7
select * from BarwonHealth.Patient where Email is null

-- 8
select * from BarwonHealth.Doctor where years_of_exp > 5 and Specialty = 'Cardiology'

-- 9 
select * from BarwonHealth.Doctor where Specialty in ('Oncology', 'Dermatology')

-- 10
select * from BarwonHealth.Patient where age between 18 and 30

-- 11
select * from BarwonHealth.Doctor where Name like 'Dr%'

-- 12
select Name as DoctorName, Email as DoctorEmail from BarwonHealth.Doctor

-- 13
select Patient_number , Drug_name , BarwonHealth.Prescribes.doctor_id , Date , Quantity ,Name as patientName 
from BarwonHealth.Prescribes join BarwonHealth.Patient 
on BarwonHealth.Prescribes.Patient_number = BarwonHealth.Patient.UR_number

-- 14
select doctor_id , count(*) as num_Of_patients_forDoc 
from BarwonHealth.Patient group by doctor_id

-- 15
select doctor_id , count(*) as num_Of_patients_forDoc 
from BarwonHealth.Patient group by doctor_id having count(*) > 3

-- 16
select * from BarwonHealth.Patient where 
exists (
	select * from BarwonHealth.Prescribes 
	where BarwonHealth.Patient.UR_number = BarwonHealth.Prescribes.Patient_number
)

-- 17
select Name ,'patient' as type from BarwonHealth.Patient union select Name ,'doctor' as type  from BarwonHealth.Doctor

-- 18
insert into BarwonHealth.Doctor (Name, Email, phone, Specialty, years_of_exp) 
values ('Dr. Ahmed sayed', 'ahmedsayed123@gmail.com' , '01125769980' , 'Cardiology' , 8)

-- 19
insert into BarwonHealth.Patient (Name, Age, address, Email, phone, Midcare_number, doctor_id)
values 
	('Sara Ahmed', 30, '123 Main St', 'sara888@gmail.com', '01017892230', '90599430234', 11),
	('Ramy Mahmoud', 23, '12 Abas St Nasr City', 'ramyM43@gmail.com', '01226897231', '10129430338', 11)

-- 20
update BarwonHealth.Doctor set phone = '01146607541' where doc_id = 3

-- 21 
update BarwonHealth.Patient set Midcare_number = '23235234955' from BarwonHealth.Patient
join BarwonHealth.Prescribes on BarwonHealth.Patient.UR_number = BarwonHealth.Prescribes.Patient_number
join BarwonHealth.Doctor on BarwonHealth.Prescribes.Doctor_id = BarwonHealth.Doctor.doc_id
where BarwonHealth.Doctor.doc_id = 3

-- 22
delete from BarwonHealth.Patient where UR_number = 8

-- 23
begin transaction

insert into BarwonHealth.Doctor (Name, Email, phone, Specialty, years_of_exp)
values ('Dr. Amr Mohamed', 'amrmoo2001@gmail.com' , '01555769483' , 'Oncology' , 2)

insert into BarwonHealth.Patient (Name, Age, address, Email, phone, Midcare_number, doctor_id)
values ('Omar Amr', 10, '45 El Nasr St', null , '01017892230', '42839430214', 12)

commit
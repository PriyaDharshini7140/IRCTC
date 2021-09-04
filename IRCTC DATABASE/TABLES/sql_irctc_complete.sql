--user--juhi
CREATE TABLE TBL_USER(USER_ID INT PRIMARY KEY,
USERNAME VARCHAR(50)NOT NULL,
PASSWORD VARCHAR(15) NOT NULL,
SEC_QUESTION VARCHAR(50) NOT NULL ,
SEC_ANSWER VARCHAR(50) NOT NULL,
FULL_NAME VARCHAR(50) NOT NULL,
DOB DATE NOT NULL,
MAIL_ID VARCHAR(100)NOT NULL,
GENDER VARCHAR(10)NOT NULL,
MOBILE_NO VARCHAR(10) NOT NULL,
DOOR_NO VARCHAR(20)NOT NULL,
STREET_NAME VARCHAR(40)NOT NULL,
CITY VARCHAR(30)NOT NULL,
PINCODE VARCHAR(10)NOT NULL,
CREATED_BY VARCHAR(20)NOT NULL,
CREATED_DATE DATETIME NOT NULL DEFAULT GETDATE(),
MODIFIED_BY VARCHAR(20)NOT NULL,
MODIFIED_DATE DATETIME NOT NULL DEFAULT GETDATE(),
RECORDSTATUS BIT DEFAULT 1,
ROWGUID VARCHAR(MAX) DEFAULT NEWID());
drop table TBL_USER
--trainmaster--dinesh
CREATE TABLE TRAIN_DETAILS(TRAIN_ID INT PRIMARY KEY,
TRAIN_NAME VARCHAR(50) NOT NULL,
ORGIN_ID INT FOREIGN KEY(ORGIN_ID) REFERENCES PLACE(PLACE_ID),
DESTINATION_ID INT FOREIGN KEY(DESTINATION_ID) REFERENCES PLACE(PLACE_ID),
ARRIVAL_TIME DATETIME NOT NULL,
DEPARTURE_TIME DATETIME NOT NULL,
JOURNEY_CLASS VARCHAR(50) NOT NULL,
CREATED_BY VARCHAR(50) NOT NULL DEFAULT 'ADMIN',
CREATED_DATE DATETIME NOT NULL DEFAULT GETDATE(),
MODIFIED_BY VARCHAR(50) NOT NULL DEFAULT 'ADMIN',
MODIFIED_DATE DATETIME NOT NULL DEFAULT GETDATE(),
RECORD_STATUS BIT DEFAULT 1,
ROWGUID VARCHAR(MAX) DEFAULT NEWID());

INSERT INTO TBL_USER (USER_ID,USERNAME,PASSWORD,
SEC_QUESTION,SEC_ANSWER,FULL_NAME,DOB,MAIL_ID,GENDER,MOBILE_NO,DOOR_NO,STREET_NAME,CITY,PINCODE,CREATED_BY,MODIFIED_BY) 
VALUES ( 5,
			'sAM',
			'sAM123',
			 'nick name' ,
			'ram2',
			'sAMKRISH' ,
			'2021/01/21' ,
			 'RAM@GMAIL.COM',
			'MALE' ,
			'9876512345',
			'A13',
			'ABS ROOD' ,
			'CHENNAI',
			'678987',
			'ram',
			'ram' )

--booking--priyadasrhini
drop table Booking
create table Booking(booking_id int primary key,
u_id int FOREIGN KEY(u_id) REFERENCES TBL_USER(USER_ID),
train_id int FOREIGN KEY(train_id) REFERENCES TRAIN_DETAILS(TRAIN_ID),
passenger_count int not null,
totalamount int not null,
seat_count int not null,
pnr_no varchar(20) not null,
booking_status int FOREIGN KEY(booking_status) REFERENCES booking_status(status_id),
booking_date datetime not null default getdate(),
CreatedBy varchar(20) not null,
CreatedDate datetime not null default getdate(),
modifiedBy varchar(20) not null,
modifiedDate datetime not null default getdate(),
RecordStatus Bit default 1,
RowGuid varchar(Max) default newid())

select * from Booking
drop table Booking

create table booking_status(status_id INT PRIMARY KEY,status_ VARCHAR(20),
CreatedBy varchar(20) not null,
CreatedDate datetime not null default getdate(),
modifiedBy varchar(20) not null,
modifiedDate datetime not null default getdate(),
RecordStatus Bit default 1,
RowGuid varchar(Max) default newid())

INSERT INTO booking_status(status_id,status_,CreatedBy,modifiedBy) VALUES(2,'WAITLLIST','PRIYA','PRIYA')





--passenger--afreen
drop table PASSENGER

CREATE TABLE PASSENGER(PASS_ID INT PRIMARY KEY NOT NULL,
B_ID INT,
RECORD_STATUS BIT DEFAULT 1,
PASS_NAME VARCHAR(100) NOT NULL,
AGE INT NOT NULL,
GENDER VARCHAR(50) NOT NULL,
BERTH VARCHAR(50),
SENIOR_CITIZEN VARCHAR(3),
NATIONALITY VARCHAR(50),
ID_CARD VARCHAR(50) NOT NULL,
ID_NO VARCHAR(50) NOT NULL,
CREATED_BY VARCHAR(50) DEFAULT 'AFREEN',
CREATED_DATETIME DATETIME DEFAULT GETDATE())
--payment--divya

create table Tbl_payments_detail(payment_ID int not null primary key,
userID int foreign key(userID) references TBL_USER(USER_ID),
bID int
foreign key(bID) references booking(booking_id),
amount int not null,
mode varchar(50) not null,
status varchar(20) not null,
CreatedBy varchar(50) not null,
CreatedDate datetime not null default getdate(),
ModifiedBy varchar(50) not null,
ModifiedDate datetime not null default getdate(),
RecordStatus bit default 1,
RowGUID varchar(max) default newid());

DROP TABLE Tbl_payments_detail
--freight--sandhya

create table irctc_freight1(b_id int not null primary key,
user_id int not null foreign key(user_id) references tbl_user(user_id), 
freight_name varchar(50) not null,
freight_type int not null foreign key(freight_type) references freight_type(freight_type_id),
from_place  int not null foreign key(from_place) references place(place_id),
to_place  int not null foreign key(to_place) references place(place_id),
departure  varchar(50) not null,
arrival  varchar(50) not null,
createdBy varchar(50) not null default 'Sandhya',
createdDate datetime not null default getDate(),
modifiedBy varchar(50) not null default 'Sandhya',
modifiedDate datetime not null default getDate(),
RecordStatus bit default 1,
RowGUID varchar(max) default newid());

create table freight_type(freight_type_id int primary key,freight_type varchar(20) not null unique);

alter table freight_type add createdBy varchar(50) not null default 'Sandhya',
createdDate datetime not null default getDate(),
modifiedBy varchar(50) not null default 'Sandhya',
modifiedDate datetime not null default getDate(),
RecordStatus bit default 1,
RowGUID varchar(max) default newid();

--contact us-thirupurasundhari
create table tbl_contact1 ( contact_id int primary key, 
contact_date datetime default getdate(), 
user_Name varchar(50) not null,
mob_no  varchar(10) not null,
email_id varchar(50) not null, 
contact_message varchar(100) not null,
status varchar(50) not null default 'message received',
created_by varchar(50) not null default 'tripu',
created_date datetime not null default getdate(),
modified_by varchar(50) not null,
modified_date datetime not null default getdate(),
recordstatus bit default 1,
rowguid varchar(max) default newid())

--location table--sandhya
truncate table place
create table place(place_id int primary key,place_name varchar(20) not null unique,createdBy varchar(50) not null default 'Sandhya',
createdDate datetime not null default getDate(),
modifiedBy varchar(50) not null default 'Sandhya',
modifiedDate datetime not null default getDate(),
RecordStatus bit default 1,
RowGUID varchar(max) default newid())
select *   from place
insert into place(place_id,place_name) values(1,'chennai')
insert into place(place_id,place_name) values(2,'bangalore')
insert into place(place_id,place_name) values(3,'mumbai')
insert into place(place_id,place_name) values(4,'Delhi')


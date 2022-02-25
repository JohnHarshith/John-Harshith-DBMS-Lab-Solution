create database if not exists `order-directory`;
use `order-directory`;

create table if not exists supplier(
	SUPP_ID int primary key,
    SUPP_NAME varchar(50),
    SUPP_CITY varchar(50),
    SUPP_PHONE varchar(50));
    
create table if not exists customer(
	CUS_ID int primary key,
    CUS_NAME varchar(50),
    CUS_PHONE varchar(10),
    CUS_CITY varchar(30),
    CUS_GENDER char);

create table if not exists category(
	CAT_ID int primary key,
    CAT_NAME varchar(50));

create table if not exists product(
	PRO_ID int primary key,
    PRO_NAME varchar(50) null default null,
    PRO_DESC varchar(50) null default null,
    CAT_ID int not null,
    foreign key (CAT_ID) references supplier(SUPP_ID));
    
create table if not exists product_details(
	PROD_ID int primary key,
    PRO_ID int not null,
    SUPP_ID int not null,
    PROD_PRICE int not null,
    foreign key (PRO_ID) references product(PRO_ID),
    foreign key (SUPP_ID) references supplier(SUPP_ID));

create table if not exists `order`(
	ORD_ID int primary key,
    ORD_AMOUNT int not null,
    ORD_DATE date,
    CUS_ID int not null,
    PROD_ID int not null,
    foreign key (PROD_ID) references product_details(PROD_ID),
    foreign key (CUS_ID) references customer(CUS_ID));
    
create table if not exists rating(
	RAT_ID int primary key,
    RAT_RATSTARS int not null,
    CUS_ID int not null,
    SUPP_ID int not null,
    foreign key (CUS_ID) references customer(CUS_ID),
    foreign key (SUPP_ID) references supplier(SUPP_ID));
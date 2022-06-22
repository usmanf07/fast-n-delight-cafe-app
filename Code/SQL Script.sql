create database fastcafe; 
use fastcafe;

Create Table User(
	userId int NOT NULL,
    name varchar(200),
    phoneNumber varchar(200),
    email varchar(400),
    password varchar(200),
    userType int,
	CONSTRAINT PK_USER PRIMARY KEY (userId)
);

insert into User values(1, "Customer", "03200450039", "1@1.com", "1", 1);
insert into User values(17, "Employee1", "03200450039", "2@2.com", "2", 2);
insert into User values(3, "Admin", "0320045303", "3@3.com", "3", 3);
insert into User values(4, "deliveryboy", "0320045303", "4@4.com", "4", 4);

Create Table Customer(
	customerId int,
    frequentCustomer bool DEFAULT 0,
	CONSTRAINT PK_Customer PRIMARY KEY (customerId),
	CONSTRAINT FK_CUSTOMER_ID  FOREIGN KEY (customerId) REFERENCES User(userId) on update cascade on delete cascade
);

insert into Customer values(1, false);
insert into Customer values(2, false);

Create Table CreditCard(
    creditid int auto_increment ,
    ccNum varchar(16),
    expMonth int,
    expYear int,
    cvv int,
	CONSTRAINT PK_CREDITCARD PRIMARY KEY (creditid),
    CONSTRAINT FK_CREDITCARD_ID  FOREIGN KEY (creditid) REFERENCES Customer(customerId) on update cascade on delete cascade
);

insert into CreditCard values(1, "4246293820271923","9", "2024", "263");
insert into CreditCard values(2, NULL, NULL, NULL, NULL);

Create Table Order_(
	orderId int auto_increment,
    customerID int,
    orderDate date,
    orderTime time,
    orderType varchar(50),
    orderStatus varchar(50),
    totalBill float,
	CONSTRAINT PK_ORDER PRIMARY KEY (orderId),
    CONSTRAINT FK_CUSTOMER_ORDER FOREIGN KEY (customerID) REFERENCES User(userID) on update cascade on delete cascade
);

insert into Order_ values(1, 1, "2022-09-24", "15:40:29", "Takeaway", "Preparing", 400);
insert into Order_ values(2, 1, "2022-05-24", "18:29:49", "Delivery", "Completed", 1200);
insert into Order_ values(3, 1, "2022-05-26", "18:29:49", "Delivery", "Completed", 1200);


Create Table Item(
	itemId int ,
	name_ varchar(200),
	description_ varchar(500),
    type_ int,
    price float,
    stock int,
    imagePath varchar(1024),
    availabilityStatus bool,
	CONSTRAINT PK_ITEM PRIMARY KEY (itemId)
);

insert into Item values (1, "Club Sandwich", "A sandwich of three slices of bread with two layers of meat (such as turkey) and lettuce, tomato, and mayonnaise.", 1, 299, 10,"https://static.toiimg.com/photo/83740315.cms",true);
insert into Item values (2, "Chicken Biryani", "A savory chicken and rice dish that includes layers of chicken, rice, and aromatics that are steamed together.", 2, 150, 20,"https://static.toiimg.com/photo/54308405.cms",true);
insert into Item values (3, "White Rice", "White Boiled/Steamed Rice", 2, 100, 20,"https://w2t5x8m2.rocketcdn.me/wp-content/uploads/2017/03/1200x1200-boiled-fluffy-rice.jpg",true);
insert into Item values (4, "Chicken Shawarma", "well-marinated chicken, layered on a vertical rotisserie or spit where it's slow-roasted for days--in its own juices and fat--until perfectly tender and extra flavorful!", 3, 250, 10,"https://static.toiimg.com/thumb/64696930.cms?imgsize=329052&width=800&height=800",false);
insert into Item values (5, "French Fries", "Long, thin pieces of potato fried in oil", 1, 100, 10,"https://static.toiimg.com/photo/54659021.cms",true);

create table orderItem(
	orderId int,
	itemId int,
    quantity int,
    
    CONSTRAINT PK_ITEM PRIMARY KEY (orderId, itemId),
	CONSTRAINT FK_ITEM_ORDERID  FOREIGN KEY (orderID) REFERENCES Order_(orderID) on update cascade on delete cascade,
    CONSTRAINT FK_ITEM FOREIGN KEY (itemID) REFERENCES Item(itemid)
);

insert into orderItem values(1, 3, 1);
insert into orderItem values(1, 2, 2);
insert into orderItem values(2, 3, 1);

Create table Menu(
	menuID int,
    itemId int,
    CONSTRAINT PK_MENU PRIMARY KEY (menuID, itemId),
	CONSTRAINT FK_MENU  FOREIGN KEY (itemId) REFERENCES Item(ItemId) on update cascade
);

insert into Menu values(1, 1);
insert into Menu values(1, 2);
insert into Menu values(1, 3);
insert into Menu values(1, 4);
insert into Menu values(1, 5);

Create table Voucher(
	voucherID int,
    discount float,
    expiryDate date,
    voucherCode varchar(10),
    customerID int,
    redemptionStatus bool,
    CONSTRAINT PK_VOUCHER PRIMARY KEY (voucherID, customerID),
    CONSTRAINT FK_CUSTOMER_VOUCHER FOREIGN KEY (customerID) REFERENCES User(userID) on update cascade on delete cascade
);

insert into Voucher values(1, 100, "2022-06-22", "27JSOW294O", 1, false);
insert into Voucher values(2, 200, "2022-06-25", "284USW28OI", 1, false);
insert into Voucher values(3, 200, "2022-06-25", "JSIW24YAKA", 1, true);

Create Table Table_(
	tableID int,
	capacity int,
	reservedStatus bool,
    CONSTRAINT PK_RESERVATION PRIMARY KEY (tableID)
);
insert into table_ values(0, 0, false);
insert into table_ values(1, 10, false);
insert into table_ values(2, 10, false);
insert into table_ values(3, 7, false);
insert into table_ values(4, 6, true);
insert into table_ values(5, 3, false);
insert into table_ values(6, 8, false);
insert into table_ values(7, 4, false);
insert into table_ values(8, 8, true);
insert into table_ values(9, 4, false);
insert into table_ values(10, 4, false);

Create Table ReserveTable(
	reservationID int,
	tableID int,
	reservationDate Date,
    reservationTime Time,
    reservationApproved bool,
    reservedBy int,
    CONSTRAINT PK_RESERVATION PRIMARY KEY (reservationID),
	CONSTRAINT FK_RESERVATION_TABLE FOREIGN KEY (tableID) REFERENCES Table_(tableid),
    CONSTRAINT FK_RESERVATION_CUSTOMER FOREIGN KEY (reservedBy) REFERENCES User(userID) on update cascade on delete cascade
);

insert into ReserveTable values(1, 4, "2022-05-24", "15:40:29", true, 1);
insert into ReserveTable values(2, 4, "2022-05-24", "15:40:29", true, 1);
insert into ReserveTable values(3, 4, "2022-05-24", "15:40:29", true, 2);
insert into ReserveTable values(4, 5, "2022-05-27", "15:40:29", false, 1);
insert into ReserveTable values(5, 5, "2022-05-27", "15:40:29", false, 1);

Create Table location(
	locationid int,
	locName varchar(50),
    CONSTRAINT PK_LOC PRIMARY KEY (locationid)
);

insert into location values(1, "Happy Burger");
insert into location values(2, "Library");
insert into location values(3, "Civil Department");
insert into location values(4, "Electrical Department");
insert into location values(5, "Civil Department");
insert into location values(6, "New Auditorium");
insert into location values(7, "Rose Garden");
insert into location values(8, "Front Lawn");

Create Table orderLocation(
	locationid int,
    orderid int,
    CONSTRAINT PK_LOC PRIMARY KEY (locationid, orderid),
	CONSTRAINT FK_ORDERID  FOREIGN KEY (orderID) REFERENCES Order_(orderID) on update cascade on delete cascade,
    CONSTRAINT FK_LOC FOREIGN KEY (locationid) REFERENCES Location(locationid)
);

insert into orderLocation values (2, 2);

select * from User;
select * from Customer;
select * from Order_;
select * from Item;
select * from Menu;


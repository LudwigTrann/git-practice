-- create database
create database finalProject;
use finalProject;

-- create table user

create table `client`
(
	id int primary key auto_increment,
    username varchar(50) not null,
    password varchar(500) not null,
    fullname varchar(500) not null,
    phonenumber varchar(25) not null,
    email varchar(500) not null,
    address varchar(500) not null,
    role_id int not null default 0
);

-- create table category
create table category
(
	id int primary key auto_increment,
    name varchar(500) not null
);

-- create table product

create table `product`
(
	id int primary key auto_increment,
    name varchar(500) not null unique,
    price double not null,
    quantity int not null,
    image varchar(500) not null,
    `desc` varchar(500) not null,
    category_id int not null,
    `status` varchar(128) default 'active',
    foreign key(category_id) references category(id),
    sold int
);

-- create table order for total price
create table `orderAdmin`
(
	order_id int primary key auto_increment,
    client_id int not null,
    foreign key(client_id) references client(id),
    create_date datetime default now(),
    totalPrice double,
    status varchar(500) default 'In Process',
    address varchar(500),
    note varchar(500),
    payment varchar(500) default 'C.O.D'
);

create table `cart`
(
	`No` int primary key auto_increment,
    client_id int,
    foreign key(client_id) references client(id),
    product_id int,
    product_name varchar (500) not null,
    price double not null,
    quantity int not null,
    product_image varchar(500) not null,
    status varchar(500) default 'In Cart',
    order_id int,
    foreign key(order_id) references orderAdmin(order_id)
);
-- add category
insert into category values (1,'Phone');
insert into category values (2,'Watch');
insert into category values (3,'Speaker');

-- add admin account, role_id: admin is 1 and user is 0,
-- Password admin: Abcd@123
insert into client values (1,'admin','wZ+O/1Ysjpvt9shTC++GNiQBlOI=@Abcd@123','Admin Account','123','adminAccount@gmail.com','Hanoi',1);

	-- add product to database
	-- insert phones to products
insert into product (name, price, quantity, image, `desc`, category_id) values ('Iphone 15 Pro Max', 2000, 100, 'iphone15promax.jpg', 'Lasted iphone released 2023', 1);
insert into product (name, price, quantity, image, `desc`, category_id) values ('Iphone 15 Pro', 1899, 100, 'iphone15pro.jpg', 'Lasted iphone released 2023', 1);
insert into product (name, price, quantity, image, `desc`, category_id) values ('Iphone 15 Plus', 1299, 100, 'iphone15plus.jpg', 'Lasted iphone released 2023', 1);
insert into product (name, price, quantity, image, `desc`, category_id) values ('Iphone 15', 990, 100, 'iphone15.jpg', 'Lasted iphone released 2023', 1);
-- insert watches to products
insert into product (name, price, quantity, image, `desc`, category_id) values ('Apple Watch SE 2020', 1200, 100, 'se2020.jpg', 'Lasted watch apple released 2023', 2);
insert into product (name, price, quantity, image, `desc`, category_id) values ('Garmin Felix 7x', 1399, 100, 'garmin.jpg', 'Lasted watch garmin released 2023', 2);
insert into product (name, price, quantity, image, `desc`, category_id) values ('Samsung Watch 6', 1000, 100, 'watch6.jpg', 'Lasted watch samsung released 2023', 2);
insert into product (name, price, quantity, image, `desc`, category_id) values ('Apple Watch Series 9', 1399, 100, 'series9.jpg', 'Lasted watch apple released 2023', 2);
-- insert speaker and headphones to products
insert into product (name, price, quantity, image, `desc`, category_id) values ('Air Pod 3', 600, 100, 'airpod3.jpg', 'Lasted ear phone released 2023', 3);
insert into product (name, price, quantity, image, `desc`, category_id) values ('Air Pod Pro', 799, 100, 'airpodpro.jpg', 'Lasted ear phone released 2023', 3);
insert into product (name, price, quantity, image, `desc`, category_id) values ('Sony Hi-End', 599, 100, 'sony.jpg', 'Lasted Sony head phone released 2023', 3);
insert into product (name, price, quantity, image, `desc`, category_id) values ('Edifier', 499, 100, 'edifier.jpg', 'Lasted Edifier released 2023', 3);


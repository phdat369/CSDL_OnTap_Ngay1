create database ontapngay1;
use ontapngay1;

create table customers (
    id int primary key auto_increment,
    full_name varchar(100) not null,
    phone varchar(15) unique,
    address varchar(255),
    customer_type enum('normal','vip') default 'normal'
);

create table products (
    id int primary key auto_increment,
    product_name varchar(100) not null,
    category varchar(50),
    price decimal(10,2) check (price > 0),
    stock int default 0 check (stock >= 0)
);

create table orders (
    id int primary key auto_increment,
    customer_id int,
    order_date datetime default current_timestamp,
    status enum('completed','cancelled') default 'completed',
    foreign key (customer_id) references customers (id)
);
drop table order_details;
create table order_details (
    id int primary key auto_increment,
    order_id int,
    product_id int,
    quantity int check (quantity > 0),
    total_price decimal(10,2),
    foreign key (order_id) references orders (id),
    foreign key (product_id) references products (id),
    unique(order_id,product_id)
);

insert into customers (full_name, phone, address, customer_type) 
values ('nguyen van a', '090000001', 'hcm', 'vip'),
       ('tran thi b', '090000002', 'hn', 'normal'),
	   ('le van c', '090000003', 'dn', 'vip'),
       ('pham thi d', '090000004', 'ht', 'normal'),
       ('hoang van e', '090000005', 'hp', 'vip'),
       ('do thi f', '090000006', 'pq', 'normal'),
	   ('vu van g', '090000007', 'na', 'vip');
       

insert into products (product_name, category, price, stock) 
values ('iphone 13', 'electronics', 20000000, 10),
       ('samsung s22', 'electronics', 18000000, 8),
       ('laptop dell', 'electronics', 25000000, 5),
       ('ao thun', 'fashion', 200000, 50),
       ('quan jean', 'fashion', 400000, 30),
       ('giay sneaker', 'fashion', 800000, 20),
       ('ban hoc', 'furniture', 1500000, 0),
       ('ghe van phong', 'furniture', 1200000, 15),
       ('tu quan ao', 'furniture', 3000000, 5),
       ('tai nghe', 'electronics', 500000, 0);

insert into orders (customer_id, status) 
values (1, 'completed'),
	   (2, 'completed'),
       (3, 'cancelled'),
       (4, 'completed'),
       (5, 'cancelled');
       
insert into order_details (order_id, product_id, quantity, total_price) 
values (1, 1, 1, 20000000),
       (1, 4, 2, 400000),
       (1, 7, 1, 1500000),
	   (2, 2, 1, 18000000),
       (2, 5, 2, 800000),
       (3, 3, 1, 25000000),
       (3, 6, 1, 800000),
       (4, 4, 3, 600000),
       (4, 8, 1, 1200000),
       (5, 1, 2, 40000000),
       (5, 9, 1, 3000000),
       (5, 5, 1, 400000);
       
update products
set stock = stock - 5
where id = 1 and stock >= 5;

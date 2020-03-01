create table item(
    id int primary key auto_increment,
    name varchar(100),
    dat date,
    img varchar(100),
    desc varchar(200),
    type varchar(100)
);

create table orde(
    id int primary key auto_increment,
    fin int,
    date date,
    cost int
);

create table user(
    id int primary key auto_increment,
    username varchar(100),
    password varchar(100),
    money int,
    address varchar(100),
    phone varchar(100)
);

create table order_item(
    orderid int references orde(id),
    itemid int references item(id),
    num int
);

create table user_order(
    userid int references user(id),
    orderid int references orde(id)
);
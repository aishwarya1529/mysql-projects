CREATE DATABASE ecommerce_project;
USE ecommerce_project;

CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(50),
    PRIMARY KEY (customer_id)
);
select * from customers;
CREATE TABLE products (
    product_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    status ENUM('Pending', 'Shipped', 'Delivered') NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (first_name, last_name,gender, email, phone, address, city, state) VALUES
       ('John', 'Doe','male', 'johndoe@email.com', '123-456-7890', '123 Main St', 'Anytown', 'CA'),
	   ('Jane', 'Smith','male', 'janesmith@email.com', '555-555-1212', '456 Oak St', 'Smalltown', 'CA'),
       ('genie', 'Johnson', 'female','geniejohnson@email.com', '987-654-3210', '789 Maple St', 'Bigtown', 'CA'),
       ('Michael', 'Johnson','male','michaelj@gmail.com','155-299-1111','444 elm st','Anothertown','CA'),
       ('anne', 'frank','female','annef@gmail.com','666-578-4534', '789 Oak St', 'Somewhere','CA'),
       ('David', 'Brown','male', 'davidbrown@gmail.com','654-675-9999', '321 Maple St', 'Anywhere','CA'),
       ('Emily', 'Wilson','female','emilywilson@gmail.com','787-987-123', '567 Pine St', 'Nowhere','CA'),
       ('eliza','thomas','female','elizathomas@gmail.com','124-976-5647','333 oak st','smalltown','CA'),
       ('ana','watson','female','anawatson@gmail.com','234-354-2345','411 maple st','anywhere','CA'),
       ('evaa','williams','female','evaa@gmail.com','989-453-2344','122 W st','somewhere','CA'),
       ('warner','davis','male','warnerd@gmail.com','234-777-4566','47 CA 110','anywhere','CA'),
       ('jenifer','miller','female','jeniferm@gmail.com','324-090-5543','20 cooper square','bigtown','CA'),
       ('maria','garcia','female','mariaw@gmail.com','222-939-3029','202 pine st','nowhere','CA'),
       ('abbey','wilson','male','abbeyw@gmail.com','123-020-1334','123 W st','anywhere','CA'),
       ('robin','evans','male','robine@gmail.com','246-356-0293','222 cooper','somewhere','CA'),
       ('miley','kelly','female','mileyk@gmail.com','756-304-3955','77 R st','anywhere','CA'),
       ('deryl','griffin','male','derylg@gmail.com','444-678-4356','224 maple st','smalltown','CA'),
       ('lara','lopez','female','laral@gmail.com','232-324-2332','443 W st','bigtown','CA'),
       ('ellie','clark','female','elliec@gmail.com','788-090-8777','21 elm st','somewhere','CA'),
       ('beth','scott','female','beths@gmail.com','623-666-3222','55 W st','bigtown','CA');

INSERT INTO products (name, description, category, price) VALUES
    ('T-Shirt', 'Plain cotton t-shirt', 'Clothing', 19.99),
    ('Hoodie', 'Hooded sweatshirt', 'Clothing', 39.99),
    ('Sneakers', 'Low-top canvas sneakers', 'Shoes', 59.99),
    ('Watch', 'Analog wristwatch', 'Accessories', 99.99),
    ('Backpack', 'Canvas backpack', 'Accessories', 49.99);


INSERT INTO orders (customer_id, order_date, status) VALUES
    (1, '2023-07-01 22:00:00', 'delivered'),
    (2, '2023-07-02 23:00:00', 'delivered'),
    (3, '2023-07-03 22:00:00', 'Delivered'),
    (4, '2023-07-08 15:00:00', 'Delivered'),
    (5,'2023-07-10 16:00:00', 'Shipped'),
    (6,'2023-07-21 08:00:00', 'delivered'),
    (7,'2023-08-01 10:00:00', 'delivered'),
    (8,'2023-08-06 09:00:00', 'delivered'),
    (9, '2023-08-11 07:00:00', 'Pending'),
    (10, '2023-08-14 17:00:00', 'delivered'),
    (11, '2023-09-05 23:00:00', 'delivered'),
    (12, '2023-09-08 11:00:00', 'Delivered'),
    (13, '2023-09-24 10:00:00', 'Delivered'),
    (14, '2023-09-25 01:00:00', 'shipped'),
    (15, '2023-10-12 06:00:00', 'delivered'),
    (16, '2023-10-15 10:00:00', 'shipped'),
    (17, '2023-10-20 20:00:00', 'Pending'),
    (18, '2023-10-22 23:00:00', 'Delivered'),
    (19, '2023-10-24 00:00:00', 'Delivered'),
    (20, '2023-10-25 12:00:00', 'shipped'),
    (12, '2023-10-29 10:00:00', 'Delivered'),
    (5, '2023-10-06 23:00:00', 'Delivered'),
    (16, '2023-11-12 00:00:00', 'pending'),
    (5, '2023-11-15 11:00:00', 'delivered'),
    (1, '2023-11-21 01:00:00', 'delivered'),
    (14, '2023-11-22 09:00:00', 'delivered'),
    (8, '2023-11-28 22:00:00', 'shipped'),
    (14, '2023-11-30 08:00:00', 'delivered'),
    (15, '2023-11-05 12:00:00', 'pending'),
    (5, '2023-12-08 19:00:00', 'delivered'),
    (15, '2023-12-10 20:00:00', 'delivered'),
    (5, '2023-12-11 23:00:00', 'shipped'),
    (11, '2023-12-15 00:00:00', 'pending'),
    (20, '2023-12-25 21:00:00', 'shipped'),
    (18, '2023-12-30 04:00:00', 'delivered'),
    (5, '2023-12-30 02:00:00', 'shipped')
    ;
select * from orders;
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 19.99),
(1, 3, 1, 59.99),
(2, 2, 1, 39.99),
(2, 4, 1, 99.99),
(2, 5, 1, 49.99),
(3, 1, 3, 19.99),
(3, 3, 2, 59.99),
(3, 5, 2, 49.99),
(4, 3, 5, 59.99),
(5, 1, 2, 19.99),
(5, 2, 1, 39.99),
(6, 3, 1, 59.99),
(6, 3, 2, 59.99),
(6, 4, 1, 99.99),
(7, 5, 2, 49.99),
(7, 1, 2, 19.99),
(8, 5, 1, 49.99),
(8, 3, 1, 59.99),
(9, 1, 1, 19.99),
(10, 1, 1, 19.99),
(11, 3, 1, 59.99),
(11, 1, 2, 19.99),
(12, 4, 1, 99.99),
(13, 2, 1, 39.99),
(14, 4, 1, 99.99),
(15, 2, 1, 39.99),
(15, 3, 1, 59.99),
(16, 1, 1, 19.99),
(17, 3, 1, 59.99),
(18, 2, 2, 39.99),
(19, 5, 2, 49.99),
(20, 3, 1, 59.99),
(20, 5, 1, 49.99),
(21, 5, 1, 49.99),
(21, 1, 1, 19.99),
(22, 4, 1, 99.99),
(23, 5, 1, 49.99),
(24, 1, 1, 19.99),
(25, 3, 2, 59.99),
(25, 5, 1, 49.99),
(26, 1, 2, 19.99),
(27, 2, 3, 39.99),
(28, 5, 1, 49.99),
(28, 4, 1, 99.99),
(29, 1, 2, 19.99),
(30, 3, 1, 59.99),
(30, 3, 1, 59.99),
(31, 2, 1, 39.99),
(32, 3, 1, 59.99),
(32, 2, 1, 39.99),
(33, 2, 1, 39.99),
(34, 3, 1, 59.99),
(35, 5, 1, 49.99),
(35, 2, 1, 39.99);
-- total orders
select distinct count(order_id) from orders;
-- total customers
select count(distinct(customer_id)) from customers;
-- total sales
select round(sum(price*quantity)) as 'total sales'
from order_items;
-- storing total sales for later use
set @ts=(select round(sum(price*quantity)) as 'total sales'
from order_items);
select @ts;
-- minimum and maximum order date
select min(order_date) as min_orderdate ,max(order_date) as max_orderdate from orders;
-- total products
select count(distinct(product_id)) from products;

-- gender based segmentation

select c.gender, count(o.order_id) orders, sum(oi.price*quantity) sales
from orders o
join order_items oi
on o.order_id=oi.order_id
join customers c
on c.customer_id=o.customer_id
group by c.gender
order by 3 desc;
-- ==> Women tend to shop more than men

select c.city, count(o.order_id) orders, sum(oi.price*quantity) sales
from orders o
join order_items oi
on o.order_id=oi.order_id
join customers c
on c.customer_id=o.customer_id
group by c.city
order by 3 desc;


-- RFM ----------------

select customer_id,
datediff(curdate(),max(order_date)) as recency,
count(o.order_id) as frequency,
round(sum(price*quantity)) as monetary
from orders o
join order_items oi
on o.order_id=oi.order_id
group by customer_id
order by customer_id;


-- creating a view to get rfm effectively
drop view get_rfm;
create view get_rfm As(
with temp_table as (
select c.customer_id,c.gender,
datediff(curdate(),max(order_date)) as recency,
count(o.order_id) as frequency,
round(sum(price*quantity)) as monetary
from orders o
join order_items oi
on o.order_id=oi.order_id
left join customers c
on c.customer_id=o.customer_id
group by c.customer_id
order by c.customer_id)
select t.customer_id,t.gender,concat(first_name,' ',last_name) as customer_name,recency,frequency,monetary
from temp_table as t
left outer join customers as c
on t.customer_id=c.customer_id
order by t.customer_id
);
-- calculate rmf scores
create table rfm_scores as
(
select *,
ntile(5) over (order by recency desc) as r_score,
ntile(5) over (order by frequency) as f_score,
ntile(5) over (order by monetary) as m_score
from get_rfm
order by customer_id
);
select * from rfm_scores; 

-- calculating the total RFM score and code for segmentation purpose
with rfm_scores as
(
select *,
ntile(5) over (order by recency desc) as r_score,
ntile(5) over (order by frequency) as f_score,
ntile(5) over (order by monetary) as m_score
from get_rfm
order by customer_id
)
select *,(r_score+f_score+m_score)/3 as avg_rfm_score,
r_score+f_score+m_score as rfm_score,
concat(r_score,f_score,m_score) as rfm
from rfm_scores;
select * from rfm_scores;
select * from rfm_combined;

create table rfm_combined as
select *,cast((cast(r_score as float)+f_score+m_score )/3 as decimal(6,2)) avg_rfm_score,
(r_score+f_score+m_score) as rfm_score,
concat(r_score,f_score,m_score) as rfm
from rfm_scores;
select * from rfm_scores;

-- creating a view of customer segmentation and rfm
drop view customer_segments;
create view customer_segments as 
select *,case
when r_score>=4 and f_score=5 and m_score>=4 then 'Champion customer'
when r_score>=4 and f_score>=4 and m_score>=3 then 'Loyal customer'
when r_score>=3 and f_score>=2 and m_score>=1 then 'regular customer'
when r_score<=2 and (f_score between 1 and 2) then 'At risk customer'
when r_score=1  then'churned customer'                             -- stopped purchasing from a certain period of time

end as Customer_segment,
case
when rfm_score>=1 and rfm_score<=5 then 'Low value'
when rfm_score>=5 and rfm_score<=10 then 'Mid value'
when rfm_score>=10 and rfm_score<=15 then 'High value'
end as Value_segment
from rfm_combined;
select * from customer_segments;

-- distribution of customers by value segment
select value_segment ,count(customer_id) as customer_count
from customer_segments
group by value_segment
order by customer_count;

-- ==> we have the highest Mid value customer

-- distribution of customers by customer segment
select customer_segment,count(customer_id) as customer_count
from customer_segments
group by customer_segment
order by customer_count;

-- ==> company have (15%)champion customer,(15%) churned customers,(20%) loyal customers,
--     (25%) at risk customers and (25%) regular customers

-- distribution of customers across diff RFM segments within each value segment
select value_segment,customer_segment,
count(customer_id) as customer_count
from customer_segments
group by customer_segment,value_segment
order by value_segment,customer_count desc;

-- ==> at risk customers are equally distributed among mid value and low value segment
-- ==> regular customers are equally distributed among high value and mid value segment
-- ==> churned customers are present in mid value segment
-- ==> loyal and champion customers are in high value segment
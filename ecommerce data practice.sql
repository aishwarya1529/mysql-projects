CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(20),
    PRIMARY KEY (customer_id)
);

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

INSERT INTO customers (first_name, last_name, email, phone, address, city, state, zip) VALUES
    ('John', 'Doe', 'johndoe@email.com', '123-456-7890', '123 Main St', 'Anytown', 'CA', '12345'),
    ('Jane', 'Smith', 'janesmith@email.com', '555-555-1212', '456 Oak St', 'Smalltown', 'CA', '67890'),
    ('Bob', 'Johnson', 'bobjohnson@email.com', '987-654-3210', '789 Maple St', 'Bigtown', 'CA', '45678');

INSERT INTO products (name, description, category, price) VALUES
    ('T-Shirt', 'Plain cotton t-shirt', 'Clothing', 19.99),
    ('Hoodie', 'Hooded sweatshirt', 'Clothing', 39.99),
    ('Sneakers', 'Low-top canvas sneakers', 'Shoes', 59.99),
    ('Watch', 'Analog wristwatch', 'Accessories', 99.99),
    ('Backpack', 'Canvas backpack', 'Accessories', 49.99);

INSERT INTO orders (customer_id, order_date, status) VALUES
    (1, '2022-01-01 10:00:00', 'Pending'),
    (2, '2022-01-02 11:00:00', 'Shipped'),
    (3, '2022-01-03 12:00:00', 'Delivered'),
    (2,'2022-01-04 09:00:00', 'Shipped'),
    (1, '2022-02-01 10:00:00', 'Pending'),
    (2, '2022-03-01 11:00:00', 'Shipped'),
    (3, '2022-04-01 12:00:00', 'Delivered');

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
(7, 5, 2, 49.99);

select name, count(*) as times_ordered
from order_items oi
join products p on oi.product_id = p.product_id
group by p.name 
order by times_ordered desc;

select concat(first_name,' ',last_name) as customer,name,count(*)
from order_items as oi
join orders as o
on o.order_id=oi.order_id
join products p
on oi.product_id=p.product_id
join customers c
on c.customer_id=o.customer_id
group by c.customer_id,oi.product_id;

select  month(order_date)as monthly,avg(price*quantity)
from orders o
join order_items oi
on o.order_id=oi.order_id
group by monthly;
select order_date,month(order_date) from orders;

with tot_per_order as(
	select order_id,sum(quantity*price) as total
    from order_items
    group by order_id
                      )
select month(order_date) as month,avg(total) as avg_order_value
from orders o
 join tot_per_order on o.order_id = tot_per_order.order_id
 group by month;
 
 with tot_per_order as (
    select order_id, sum(quantity * price) as total
    from order_items
    group by order_id
                      )
select month(order_date) as month, avg(total) as avg_order_value
from orders o join
     tot_per_order
         on o.order_id = tot_per_order.order_id
group by month;
select avg(quantity),name
from order_items oi
join products p
on oi.product_id=p.product_id
group by name;
select product_id, avg(quantity)
from order_items
group by product_id;
with cte as(
select category,o.order_id,customer_id,(quantity * p.price) as total
from products p
join order_items oi
on p.product_id=oi.product_id
join orders o
on o.order_id=oi.order_id
where o.status='delivered')

select category,sum(total)/count(distinct customer_id)
from cte
group by category;
with cte as
    (select category, o.order_id,customer_id, (quantity * p.price) as total
    from products p
    join order_items oi on p.product_id = oi.product_id
    join orders o on o.order_id = oi.order_id
    WHERE o.status = 'Delivered')

select category, sum(total) / count(distinct customer_id)
from cte
group by category;

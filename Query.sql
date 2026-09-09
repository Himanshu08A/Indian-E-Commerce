-- Creating Database 
CREATE DATABASE Indian_e_commerce

--Create customers table with primary key
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    gender VARCHAR(20),
    age INTEGER,
    age_group VARCHAR(30),
    date_of_birth DATE,
    email VARCHAR(150),
    phone VARCHAR(20),
    city VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10),
    registration_date DATE,
    customer_tier VARCHAR(30),
    total_orders INTEGER,
    total_spent NUMERIC(12,2)
);

--Create products table with primary key
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    brand VARCHAR(100),
    original_price NUMERIC(12,2),
    discount_percent NUMERIC(5,2),
    discount_amount NUMERIC(12,2),
    selling_price NUMERIC(12,2),
    stock_quantity INTEGER,
    weight_kg NUMERIC(10,3),
    avg_rating NUMERIC(2,1),
    total_reviews INTEGER
);

-- Create sales table with primary key
CREATE TABLE sales (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id	VARCHAR(50),
    product_id VARCHAR(50),
    order_date DATE,
    order_time TIME,
    delivery_date DATE,
    quantity INTEGER,
    unit_price NUMERIC(12,2),
    order_value	NUMERIC(12,2),
    shipping_cost NUMERIC(12,2),
    coupon_code VARCHAR(50),
    coupon_discount	NUMERIC(12,2),
    total_amount NUMERIC(12,2),
    payment_mode VARCHAR(30),
    order_status VARCHAR(30),
    rating NUMERIC(2,1),
    review_text	TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    customer_age INTEGER,
    customer_age_group VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES public.customers (customer_id),
    FOREIGN KEY (product_id) REFERENCES public.products (product_id)
);

-- Optional: indexes on foreign key columns

CREATE INDEX idx_sales_customer_id
ON sales (customer_id);

CREATE INDEX idx_sales_product_id
ON sales (product_id);

-- Check tables column
SELECT *
FROM customers;

SELECT *
FROM products;

SELECT *
FROM sales;

-- Store data into tables
COPY customers
FROM 'D:\Data Analysis Project\Indian E-Commerce\Indian e-commerce csv files\customers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY products
FROM 'D:\Data Analysis Project\Indian E-Commerce\Indian e-commerce csv files\products.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY sales
FROM 'D:\Data Analysis Project\Indian E-Commerce\Indian e-commerce csv files\sales.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Check data in tables
SELECT *
FROM customers
LIMIT 10;

SELECT *
FROM products
LIMIT 10;

SELECT *
FROM sales
LIMIT 10;

-- Total sales
SELECT  
    SUM(total_amount) AS total_sales
FROM sales;

-- Total number of sales
SELECT  
    COUNT(order_id) AS total_orders
FROM sales;

-- Average order value
SELECT 
    AVG(total_amount) AS avg_order_value
FROM sales;

-- Total quantity sold
SELECT 
    SUM(quantity) AS total_qty_sold
FROM sales;

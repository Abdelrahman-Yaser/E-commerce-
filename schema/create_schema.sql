-- Create Category table
CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create Product table
CREATE TABLE Product (
    product_id SERIAL PRIMARY KEY,
    category_id INT REFERENCES Category(category_id),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    stock INT NOT NULL
);

-- Create Customer table
CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(200) NOT NULL
);

-- Create Orders table
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    order_date TIMESTAMP DEFAULT NOW(),
    total_amount NUMERIC(10,2) NOT NULL
);

-- Create OrderItem table
CREATE TABLE OrderItem (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    product_id INT REFERENCES Product(product_id),
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL
);

-- Insert sample categories
INSERT INTO Category (category_name) VALUES
('Electronics'),
('Clothing'),
('Books');

-- Insert sample products
INSERT INTO Product (category_id, name, description, price, stock) VALUES
(1, 'Laptop', 'High performance laptop', 1200.00, 10),
(1, 'Headphones', 'Noise cancelling headphones', 150.00, 50),
(2, 'T-Shirt', 'Cotton T-shirt', 20.00, 100);

-- Insert sample customers
INSERT INTO Customer (first_name, last_name, email, password) VALUES
('John', 'Doe', 'john@example.com', 'hashed-password'),
('Jane', 'Smith', 'jane@example.com', 'hashed-password');

-- Insert sample orders
INSERT INTO Orders (customer_id, total_amount) VALUES
(1, 1350.00),
(2, 20.00);

-- Insert Order Items
INSERT INTO OrderItem (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 1, 150.00),
(2, 3, 1, 20.00);

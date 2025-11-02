create database FDTP;
use FDTP;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    street_address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10)
);
CREATE TABLE Restaurant (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address TEXT,
    city VARCHAR(50),
    rating DECIMAL(2,1)
);

CREATE TABLE Menu_Item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    prep_time_minutes INT,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

CREATE TABLE Delivery_Partner (
    partner_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone_number VARCHAR(15) UNIQUE,
    vehicle_type VARCHAR(50),
    rating DECIMAL(2,1)
);

CREATE TABLE `Order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    order_time DATETIME NOT NULL,
    total_amount DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);


CREATE TABLE Order_Item (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (item_id) REFERENCES Menu_Item(item_id)
);


CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    partner_id INT,
    dispatch_time DATETIME,
    delivery_time DATETIME,
    predicted_time_minutes INT,
    actual_time_minutes INT,
    distance_km DECIMAL(5,2),
    weather_condition VARCHAR(50),
    traffic_level VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (partner_id) REFERENCES Delivery_Partner(partner_id)
);


INSERT INTO Customer (first_name, last_name, phone_number, email, street_address, city, state, postal_code)
VALUES
('Amit', 'Sharma', '9876543210', 'amit.sharma@gmail.com', '12 MG Road', 'Mumbai', 'Maharashtra', '400001'),
('Priya', 'Verma', '9876501234', 'priya.verma@yahoo.com', '45 Nehru Nagar', 'Delhi', 'Delhi', '110001'),
('Rahul', 'Patel', '9812345678', 'rahul.patel@gmail.com', '78 Park Street', 'Kolkata', 'West Bengal', '700016'),
('Sneha', 'Nair', '9823456789', 'sneha.nair@gmail.com', '56 Marine Drive', 'Mumbai', 'Maharashtra', '400002'),
('Rohan', 'Mehta', '9898765432', 'rohan.mehta@gmail.com', '23 Brigade Road', 'Bengaluru', 'Karnataka', '560001'),
('Anita', 'Kaur', '9888123456', 'anita.kaur@gmail.com', '9 Sector 17', 'Chandigarh', 'Chandigarh', '160017'),
('Vikram', 'Singh', '9876123450', 'vikram.singh@gmail.com', '4 Connaught Place', 'Delhi', 'Delhi', '110001'),
('Nisha', 'Reddy', '9834567890', 'nisha.reddy@gmail.com', '11 Jubilee Hills', 'Hyderabad', 'Telangana', '500033'),
('Arjun', 'Joshi', '9811765432', 'arjun.joshi@gmail.com', '88 FC Road', 'Pune', 'Maharashtra', '411004'),
('Kavita', 'Das', '9845098765', 'kavita.das@gmail.com', '3 Lake View', 'Kolkata', 'West Bengal', '700029');


INSERT INTO Restaurant (name, address, city, rating)
VALUES
('Spice Villa', '14 Park Street', 'Kolkata', 4.3),
('Punjabi Tadka', '56 MG Road', 'Mumbai', 4.1),
('Taste of South', '22 Brigade Road', 'Bengaluru', 4.4),
('Biryani House', '11 Connaught Place', 'Delhi', 4.0),
('Urban Grill', '19 Sector 17', 'Chandigarh', 4.5),
('Curry Leaf', '87 Jubilee Hills', 'Hyderabad', 4.2),
('Green Bowl', '45 FC Road', 'Pune', 4.3),
('Flavors of India', '32 Marine Drive', 'Mumbai', 4.6),
('Royal Dine', '10 Nehru Place', 'Delhi', 4.4),
('Sweet Tooth', '90 Lake Town', 'Kolkata', 4.7);


INSERT INTO Menu_Item (restaurant_id, item_name, price, prep_time_minutes)
VALUES
(1, 'Paneer Butter Masala', 220.00, 20),
(1, 'Veg Biryani', 180.00, 25),
(2, 'Dal Makhani', 200.00, 18),
(3, 'Masala Dosa', 150.00, 15),
(4, 'Chicken Biryani', 250.00, 30),
(5, 'Grilled Sandwich', 120.00, 10),
(6, 'Hyderabadi Biryani', 240.00, 28),
(7, 'Caesar Salad', 180.00, 12),
(8, 'Butter Chicken', 260.00, 25),
(9, 'Chole Bhature', 160.00, 18);


INSERT INTO Delivery_Partner (first_name, last_name, phone_number, vehicle_type, rating)
VALUES
('Ravi', 'Kumar', '9876000001', 'Bike', 4.2),
('Sunil', 'Patil', '9876000002', 'Scooter', 4.4),
('Manoj', 'Singh', '9876000003', 'Bike', 4.3),
('Asha', 'Rao', '9876000004', 'Cycle', 4.1),
('Deepak', 'Meena', '9876000005', 'Scooter', 4.5),
('Farhan', 'Ali', '9876000006', 'Bike', 4.2),
('Geeta', 'Pillai', '9876000007', 'Scooter', 4.0),
('Harish', 'Kaur', '9876000008', 'Bike', 4.6),
('Imran', 'Khan', '9876000009', 'Scooter', 4.3),
('Jyoti', 'Das', '9876000010', 'Bike', 4.5);


INSERT INTO `Order` (customer_id, restaurant_id, order_time, total_amount, status)
VALUES
(1, 1, '2025-10-30 12:15:00', 400.00, 'Delivered'),
(2, 2, '2025-10-30 13:00:00', 200.00, 'Delivered'),
(3, 3, '2025-10-30 13:30:00', 150.00, 'Delivered'),
(4, 4, '2025-10-30 14:00:00', 250.00, 'Delivered'),
(5, 5, '2025-10-30 14:30:00', 120.00, 'Delivered'),
(6, 6, '2025-10-30 15:00:00', 240.00, 'Delivered'),
(7, 7, '2025-10-30 15:30:00', 180.00, 'Delivered'),
(8, 8, '2025-10-30 16:00:00', 260.00, 'Delivered'),
(9, 9, '2025-10-30 16:30:00', 160.00, 'Delivered'),
(10, 10, '2025-10-30 17:00:00', 220.00, 'Delivered');


INSERT INTO Order_Item (order_id, item_id, quantity)
VALUES
(1, 1, 2),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 2),
(9, 10, 1),
(10, 2, 1);


INSERT INTO Delivery (order_id, partner_id, dispatch_time, delivery_time, predicted_time_minutes, actual_time_minutes, distance_km, weather_condition, traffic_level)
VALUES
(1, 1, '2025-10-30 12:25:00', '2025-10-30 12:50:00', 25, 25, 4.2, 'Clear', 'Medium'),
(2, 2, '2025-10-30 13:10:00', '2025-10-30 13:30:00', 20, 20, 3.5, 'Clear', 'Low'),
(3, 3, '2025-10-30 13:40:00', '2025-10-30 14:00:00', 20, 20, 2.8, 'Cloudy', 'Low'),
(4, 4, '2025-10-30 14:10:00', '2025-10-30 14:45:00', 35, 35, 6.0, 'Rainy', 'High'),
(5, 5, '2025-10-30 14:40:00', '2025-10-30 15:00:00', 20, 20, 3.2, 'Clear', 'Medium'),
(6, 6, '2025-10-30 15:10:00', '2025-10-30 15:40:00', 30, 30, 5.0, 'Cloudy', 'Medium'),
(7, 7, '2025-10-30 15:40:00', '2025-10-30 16:00:00', 20, 20, 2.5, 'Clear', 'Low'),
(8, 8, '2025-10-30 16:10:00', '2025-10-30 16:40:00', 30, 30, 4.8, 'Clear', 'Medium'),
(9, 9, '2025-10-30 16:40:00', '2025-10-30 17:05:00', 25, 25, 4.1, 'Rainy', 'High'),
(10, 10, '2025-10-30 17:10:00', '2025-10-30 17:35:00', 25, 25, 4.0, 'Clear', 'Medium');



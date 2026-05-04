-- ==== CREATING A TABLE AND INSERTING FIELDS

CREATE TABLE manufacturer (
car_id INT PRIMARY KEY,
car_name VARCHAR(200) NOT NULL,
car_model VARCHAR(200) NOT NULL,
vehicle_type VARCHAR(200) NOT NULL,
fuel_capacity DECIMAL(10, 2),
fuel_efficiency INT NOT NULL
);

CREATE TABLE sales (
sales_id INT PRIMARY KEY,
sales DECIMAL(10, 2) NOT NULL,
price DECIMAL(10, 2) NOT NULL,
vehicle_type VARCHAR(100) NOT NULL,
car_id INT,
FOREIGN KEY(car_id) REFERENCES manufacturer (car_id)
);

SHOW CREATE TABLE sales;

ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;

ALTER TABLE sales
ADD CONSTRAINT fk_sales
FOREIGN KEY (car_id) REFERENCES manufacturer(car_id);

ALTER TABLE sales
DROP CONSTRAINT fk_sales; 

ALTER TABLE sales
ADD COLUMN year_resale_value INT NOT NULL;

CREATE TABLE car_spec (
car_spec_id INT PRIMARY KEY,
engine_size DECIMAL(10, 2) NOT NULL,
horsepower INT NOT NULL,
wheelbase DECIMAL(10, 2) NOT NULL,
width DECIMAL(10, 2) NOT NULL,
length DECIMAL(10, 2) NOT NULL,
power_perf_factor DECIMAL(10, 2) NOT NULL,
curb_weight DECIMAL(10, 2) NOT NULL,
car_id INT,
sales_id INT,
FOREIGN KEY(car_id) REFERENCES manufacturer(car_id),
FOREIGN KEY(sales_id) REFERENCES sales(sales_id)
);

-- ==== ADDING RECORDS TO TABLE FIELDS

INSERT INTO manufacturer (car_id, car_name, car_model, vehicle_type, fuel_capacity, fuel_efficiency) 
VALUES
(1101, 'Acura', 'Integra', 'Passenger', 13.2, 28),
(1102, 'Acura', 'TL', 'Car', 17.2, 28),
(1103, 'Acura', 'CL', 'Passsenger', 17.2, 26),
(1104, 'Acura', 'RL', 'Passenger', 18, 22),
(1105, 'Audi', 'A4', 'Car', 16, 4),
(1106, 'Audi', 'A6', 'Car', 18.5, 22),
(1107, 'Audi', 'A8', 'Passenger', 23.7, 21),
(1108, 'BMW', '323i', 'Car', 16.6, 26),
(1109, 'BMW', '328i', 'Passenger', 16.6, 24),
(1110, 'BMW', '528i', 'Car', 18.5, 25)
;


INSERT INTO sales ( sales_id, sales, price, vehicle_type, car_id, year_resale_value )
 VALUES
(1001, 169190.90, 21500.50, 'passenger', 1101, 16360.90),
(1002, 393845.50, 28405.00, 'car', 1102, 19875.00),
(1003, 141149.50, 30129.70, 'passenger', 1103, 18225.25),
(1004, 858865.00, 42000.00, 'passenger', 1104, 29725.50),
(1005, 203975.60, 2395.50, 'car', 1105, 22255.50),
(1006, 18787.50, 33955.90, 'car', 1106, 23555.00),
(1007, 138000.00, 62000.00, 'passenger',  1107, 39000.00),
(1008, 197475.75, 26995.50, 'car', 1108, 45955.50),
(1009, 923195.00, 33400.00, 'passenger', 1109, 28675.50),
(1010, 175270.00, 389050.00, 'car', 1110, 36125.90);



INSERT INTO car_spec(car_spec_id, engine_size, horsepower, wheelbase, width, length, power_perf_factor, curb_weight, car_id, sales_id)
VALUES
(20101, 1.8, 140, 101.2, 67.3, 172.4, 58.28, 2.64, 1101, 1001),
(20102, 3.2, 225, 108.1, 70.3, 192.9, 98.37, 3.52, 1102,1002),
(20103, 2.5, 125, 100.5, 65.5, 162.5, 80.33, 3.45, 1103, 1003),
(20104, 3.0, 140, 105.2, 76.4, 172.7, 65.8, 2.75, 1104, 1004),
(20105, 1.9, 160, 110.7, 55.8, 150.3, 78.4, 3.42, 1105,1005),
(20106, 3.5, 210, 102.8, 67.3, 192.9, 98.27, 3.50, 1106,1006),
(20107, 2.5, 160, 115.7, 67.3, 172.4, 65.8, 3.45, 1107, 1007),
(20108, 1.8, 225, 113.7, 70.5, 175.8, 58.34, 2.70, 1108,1008),
(20109, 3.0, 220, 120.7, 76.4, 162.5, 80.33, 3.45, 1109,1009),
(20110, 1.9, 145, 108.2, 56.5, 175.8, 65.8, 2.64, 1110, 1010)
;


SELECT *
FROM manufacturer;
 
 SELECT *
 FROM sales;
 
 SELECT *
 FROM car_spec;
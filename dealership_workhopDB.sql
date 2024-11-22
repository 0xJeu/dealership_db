CREATE DATABASE dealership_workshop;
USE dealership_workshop;

CREATE TABLE dealerships (
	dealership_id int NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(12),
	PRIMARY KEY (dealership_id)
);

CREATE TABLE vehicles (
	VIN int NOT NULL,
    `Year` INT,
    Make VARCHAR(50),
    Model VARCHAR(50),
    VehicleType VARCHAR(50),
    Color VARCHAR(15),
    Odometer INT,
    Price FLOAT,
	PRIMARY KEY (VIN)
);



CREATE TABLE inventory(
	dealership_id INT,
    VIN INT
);


CREATE TABLE sales_contracts(
	ContractID int NOT NULL AUTO_INCREMENT,
	date VARCHAR(50),
    VIN INT,
    CustomerName VARCHAR(50),
    Email VARCHAR(50),
    VehicleSold BOOLEAN,
    TotalPrice FLOAT,
    MonthlyPayment FLOAT,
    SalesTaxAmount FLOAT,
    RecordingFee INT,
    ProcessingFee INT,
    WantToFinance BOOLEAN,
    PRIMARY KEY(ContractID),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE lease_contracts(
	ContractID int NOT NULL AUTO_INCREMENT,
	date VARCHAR(50),
    VIN INT,
    CustomerName VARCHAR(50),
    Email VARCHAR(50),
    VehicleSold BOOLEAN,
    TotalPrice FLOAT,
    MonthlyPayment FLOAT,
    ExpectedEndingValue FLOAT,
    LeaseFee FLOAT,
    PRIMARY KEY(ContractID),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO dealerships (name, address, phone) VALUES
('Dallas Auto Mall', '1234 Elm St, Dallas, TX', '2145551234'),
('Metroplex Motors', '5678 Oak St, Dallas, TX', '2145555678'),
('Lone Star Cars', '9101 Pine St, Dallas, TX', '2145559101'),
('Texas Car Emporium', '1122 Maple St, Dallas, TX', '2145551122'),
('Prestige Auto Group', '3344 Cedar St, Dallas, TX', '2145553344');

INSERT INTO vehicles (VIN, `Year`, Make, Model, VehicleType, Color, Odometer, Price) VALUES
(1234567, 2022, 'Toyota', 'Camry', 'Sedan', 'Silver', 15000, 25000.00),
(2345678, 2021, 'Honda', 'CR-V', 'SUV', 'Blue', 22000, 27500.50),
(3456789, 2023, 'Ford', 'F-150', 'Truck', 'Red', 5000, 45000.00),
(4567890, 2020, 'Chevrolet', 'Malibu', 'Sedan', 'Black', 35000, 18500.75),
(5678901, 2022, 'Nissan', 'Rogue', 'SUV', 'White', 18000, 26000.25);

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, 1234567),
(1, 2345678),
(2, 3456789),
(3, 4567890),
(5, 5678901);

INSERT INTO sales_contracts (date, VIN, CustomerName, Email, VehicleSold, TotalPrice, MonthlyPayment, SalesTaxAmount, RecordingFee, ProcessingFee, WantToFinance) VALUES
('2024-11-22', 1234567, 'John Doe', 'john.doe@email.com', TRUE, 27000.00, 450.00, 1687.50, 100, 200, TRUE),
('2024-11-21', 2345678, 'Jane Smith', 'jane.smith@email.com', TRUE, 29500.50, 491.67, 1843.78, 100, 200, TRUE),
('2024-11-20', 3456789, 'Bob Johnson', 'bob.johnson@email.com', TRUE, 48000.00, 800.00, 3000.00, 100, 200, FALSE),
('2024-11-19', 4567890, 'Alice Brown', 'alice.brown@email.com', TRUE, 20000.75, 333.35, 1250.05, 100, 200, TRUE),
('2024-11-18', 5678901, 'Charlie Davis', 'charlie.davis@email.com', TRUE, 28000.25, 466.67, 1750.02, 100, 200, FALSE);

INSERT INTO lease_contracts (date, VIN, CustomerName, Email, VehicleSold, TotalPrice, MonthlyPayment, ExpectedEndingValue, LeaseFee) VALUES
('2024-11-22', 1234567, 'Eva Wilson', 'eva.wilson@email.com', TRUE, 27000.00, 375.00, 15000.00, 500.00),
('2024-11-21', 2345678, 'Frank Miller', 'frank.miller@email.com', TRUE, 29500.50, 410.42, 16500.00, 550.00),
('2024-11-20', 3456789, 'Grace Taylor', 'grace.taylor@email.com', TRUE, 48000.00, 666.67, 27000.00, 750.00),
('2024-11-19', 4567890, 'Henry Clark', 'henry.clark@email.com', TRUE, 20000.75, 277.79, 11000.00, 450.00),
('2024-11-18', 5678901, 'Ivy Martinez', 'ivy.martinez@email.com', TRUE, 28000.25, 388.89, 15500.00, 525.00);



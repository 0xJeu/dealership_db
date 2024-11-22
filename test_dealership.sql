USE dealership_workshop;

-- 1. Get all dealerships
SELECT *
FROM dealerships;

-- 2. Find all vehicles for a specific dealership
SELECT d.name,v.*
FROM inventory i
	JOIN vehicles v ON (i.VIN = v.VIN)
	JOIN dealerships d ON (i.dealership_id = d.dealership_id)
WHERE d.name LIKE "Dallas%"
;

-- 3. Find a car by VIN
SELECT *
FROM vehicles
WHERE VIN = 1234567;

-- 4. Find the dealership where a certain car is located, by VIN
SELECT d.name, d.address
FROM inventory i
	JOIN vehicles v ON (i.VIN = v.VIN)
	JOIN dealerships d ON (i.dealership_id = d.dealership_id)
WHERE i.VIN = 5678901;

-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT d.name, v.*
FROM inventory i
	JOIN vehicles v ON (i.VIN = v.VIN)
	JOIN dealerships d ON (i.dealership_id = d.dealership_id)
WHERE v.VehicleType = "SUV";

-- 6. Get all sales information for a specific dealer for a specific date range
SELECT d.name, s.*
FROM inventory i
	JOIN vehicles v ON (i.VIN = v.VIN)
	JOIN dealerships d ON (i.dealership_id = d.dealership_id)
    JOIN sales_contracts s ON (i.VIN = s.VIN)
WHERE s.date BETWEEN "2024-11-19" AND "2024-11-22" AND d.name LIKE "Dallas%"; 
    



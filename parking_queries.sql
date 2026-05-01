-- =============================================
-- parking_queries.sql
-- SQL Queries for Parking Infrastructure DB
-- =============================================

-- 1. INSERT: Add a new parking meter
INSERT INTO Street_Parking_Meter VALUES
('M006', '600 N CENTRAL AVE', '04-37000', 'Single', '1HR/8AM-6PM', TRUE, TRUE, FALSE, FALSE);

-- 2. UPDATE: Deactivate a parking meter
UPDATE Street_Parking_Meter
SET active = FALSE
WHERE meter_number = 'M006';

-- 3. DELETE: Remove an inactive parking meter
DELETE FROM Street_Parking_Meter
WHERE meter_number = 'M006' AND active = FALSE;

-- 4. SELECT 1: Find all commercial parcels with estimated parking spaces
SELECT apn, property_type, total_square_footage, total_estimated_parking_spaces
FROM Parcel
WHERE property_type = 'Commercial'
ORDER BY total_estimated_parking_spaces DESC;

-- 5. SELECT 2: Find all active ADA accessible meters in Phoenix
SELECT m.meter_number, m.street_address, m.type, m.rate_time_limit
FROM Street_Parking_Meter m
JOIN City c ON m.city_fips_code = c.fips_code
WHERE m.active = TRUE
AND m.ada_accessible = TRUE
AND c.name = 'Phoenix';

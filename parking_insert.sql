-- =============================================
-- parking_insert.sql
-- =============================================

-- 1. County
INSERT INTO County VALUES ('04013', 'Maricopa County');

-- 2. City
INSERT INTO City VALUES ('04-37000', 'Phoenix');

-- 3. Census Block Group
INSERT INTO Census_Block_Group VALUES ('1001', '04013', 1200, 3400, 4600);
INSERT INTO Census_Block_Group VALUES ('1002', '04013', 800,  2100, 2900);
INSERT INTO Census_Block_Group VALUES ('1003', '04013', 950,  2800, 3750);

-- 4. Parcel
INSERT INTO Parcel VALUES ('123-45-678', '1001', '04013', 'R101', 'Residential', 2500.00, 1995, 2, -112.0740, 33.4484);
INSERT INTO Parcel VALUES ('234-56-789', '1001', '04013', 'C201', 'Commercial',  15000.00, 2003, 45, -112.0750, 33.4490);
INSERT INTO Parcel VALUES ('345-67-890', '1002', '04013', 'R101', 'Residential', 1800.00, NULL, 1, -112.0800, 33.4500);
INSERT INTO Parcel VALUES ('456-78-901', '1002', '04013', 'C201', 'Commercial',  22000.00, 2010, 80, -112.0810, 33.4510);
INSERT INTO Parcel VALUES ('567-89-012', '1003', '04013', 'I301', 'Industrial',  50000.00, 1988, 120, -112.0820, 33.4520);

-- 5. Street Parking Meter
INSERT INTO Street_Parking_Meter VALUES ('M001', '100 N 1ST AVE',    '04-37000', 'Single', '1HR/7AM-6PM', TRUE,  TRUE,  FALSE, FALSE);
INSERT INTO Street_Parking_Meter VALUES ('M002', '200 N CENTRAL AVE','04-37000', 'Single', '2HR/8AM-5PM', TRUE,  FALSE, FALSE, FALSE);
INSERT INTO Street_Parking_Meter VALUES ('M003', '300 W WASHINGTON', '04-37000', 'Multi',  '30MIN/9AM-6PM',TRUE, TRUE,  FALSE, TRUE);
INSERT INTO Street_Parking_Meter VALUES ('M004', '400 E JEFFERSON',  '04-37000', 'Single', '1HR/7AM-6PM', FALSE, FALSE, TRUE,  FALSE);
INSERT INTO Street_Parking_Meter VALUES ('M005', '500 N 3RD ST',     '04-37000', 'Multi',  '2HR/8AM-6PM', TRUE,  TRUE,  FALSE, FALSE);

-- 6. Parking Meter Block
INSERT INTO Parking_Meter_Block VALUES ('PMB001', '04-37000', 33.44830, -112.07380);
INSERT INTO Parking_Meter_Block VALUES ('PMB002', '04-37000', 33.44920, -112.07450);
INSERT INTO Parking_Meter_Block VALUES ('PMB003', '04-37000', 33.45010, -112.07520);

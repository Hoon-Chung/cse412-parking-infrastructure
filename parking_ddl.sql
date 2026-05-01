CREATE TABLE County (
    fips_code       CHAR(5)         PRIMARY KEY,
    name            VARCHAR(100)    NOT NULL
);

CREATE TABLE City (
    fips_code       VARCHAR(10)     PRIMARY KEY,
    name            VARCHAR(100)    NOT NULL
);

CREATE TABLE Census_Block_Group (
    census_block_group_id           CHAR(4)         NOT NULL,
    county_fips_code                CHAR(5)         NOT NULL,
    total_on_street_parking         INTEGER,
    total_off_street_parking        INTEGER,
    total_all_types_parking         INTEGER,
    PRIMARY KEY (census_block_group_id, county_fips_code),
    FOREIGN KEY (county_fips_code) REFERENCES County(fips_code)
);

CREATE TABLE Parcel (
    apn                             VARCHAR(20)     NOT NULL,
    census_block_group_id           CHAR(4)         NOT NULL,
    county_fips_code                CHAR(5)         NOT NULL,
    property_use_code               VARCHAR(20),
    property_type                   VARCHAR(100),
    total_square_footage            DECIMAL(12, 2),
    year_of_construction            INTEGER,
    total_estimated_parking_spaces  INTEGER,
    longitude_centroid              DECIMAL(9, 6),
    latitude_centroid               DECIMAL(9, 6),
    PRIMARY KEY (apn, census_block_group_id, county_fips_code),
    FOREIGN KEY (census_block_group_id, county_fips_code)
        REFERENCES Census_Block_Group(census_block_group_id, county_fips_code)
);

CREATE TABLE Street_Parking_Meter (
    meter_number        VARCHAR(20)     NOT NULL,
    street_address      VARCHAR(200)    NOT NULL,
    city_fips_code      VARCHAR(10)     NOT NULL,
    type                VARCHAR(50),
    rate_time_limit     VARCHAR(100),
    active              BOOLEAN,
    ada_accessible      BOOLEAN,
    motorcycle_only     BOOLEAN,
    bike_rack           BOOLEAN,
    PRIMARY KEY (meter_number, street_address),
    FOREIGN KEY (city_fips_code) REFERENCES City(fips_code)
);

CREATE TABLE Parking_Meter_Block (
    parking_meter_block_id  VARCHAR(20)     NOT NULL,
    city_fips_code          VARCHAR(10)     NOT NULL,
    latitude                DECIMAL(9, 6)   NOT NULL,
    longitude               DECIMAL(9, 6)   NOT NULL,
    PRIMARY KEY (latitude, longitude),
    FOREIGN KEY (city_fips_code) REFERENCES City(fips_code)
);

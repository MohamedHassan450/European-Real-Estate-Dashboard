CREATE TABLE european_real_estate_dim 
(
    property_id SERIAL PRIMARY KEY,
    listing_date DATE,
    property_type VARCHAR(50),
    listing_type VARCHAR(50),
    address TEXT,
    city VARCHAR(100),
    country VARCHAR(100),
    bedrooms INT,
    bathrooms INT,
    square_meters INT,
    year_built INT,
    sale_price_eur VARCHAR,
    monthly_rent_eur VARCHAR,
    price_per_sqm VARCHAR,
    days_on_market INT,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    last_sold_price_eur VARCHAR,
    parking_spots INT,
    gym BOOLEAN,
    swimming_pool BOOLEAN,
    elevator BOOLEAN,
    furnishing_status VARCHAR(50),
    energy_rating VARCHAR(10),
    floor_number INT
);

ALTER TABLE european_real_estate_dim 
ALTER COLUMN property_id TYPE VARCHAR(20);

\copy european_real_estate_dim from 'C:\Users\moham\OneDrive\Documents\Database\Not Used Yet\Europen Real Estate\EU_Real_Estate_Dataset.csv' with(format csv,HEADER true,DELIMITER',',ENCODING 'UTF8')

----------------------------------------------------------------------------------------------------------------------------------------------------

--Fix issues
UPDATE european_real_estate_dim
Set sale_price_eur = replace(sale_price_eur,' ','');

--
ALTER TABLE european_real_estate_dim
ALTER COLUMN sale_price_eur TYPE NUMERIC(15,2)
USING trim(sale_price_eur)::NUMERIC(15,2);

UPDATE european_real_estate_dim
Set monthly_rent_eur = replace(monthly_rent_eur,',','');

--
ALTER TABLE european_real_estate_dim
ALTER COLUMN monthly_rent_eur TYPE NUMERIC(15,2)
USING trim(monthly_rent_eur)::NUMERIC(15,2);

--
UPDATE european_real_estate_dim
Set price_per_sqm = replace(price_per_sqm,',','');

ALTER TABLE european_real_estate_dim
ALTER COLUMN price_per_sqm TYPE NUMERIC(15,2)
USING trim(price_per_sqm)::NUMERIC(15,2);

--

UPDATE european_real_estate_dim
Set last_sold_price_eur = replace(last_sold_price_eur,',','');


ALTER TABLE european_real_estate_dim
ALTER COLUMN last_sold_price_eur TYPE NUMERIC(15,2)
USING trim(last_sold_price_eur)::NUMERIC(15,2);
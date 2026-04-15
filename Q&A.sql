--Some Status
SELECT 
    ed.country,
    round(avg(ed.sale_price_eur)) As Average_property_price,
    round(avg(ed.monthly_rent_eur)) As Average_Rent_price,
    count(ed.country)
From european_real_estate_dim as ed
GROUP BY ed.country
ORDER BY round(avg(ed.sale_price_eur)) DESC;

--------------------------------------------------------------------------------------------------------

--How do property prices and price per square meter vary across countries and cities?
SELECT 
    ed.country,
    ed.city,
    Round(AVG(ed.sale_price_eur)) as avg_property_price,
    Round(AVG(ed.price_per_sqm)) as avg_price_per_sqm
From european_real_estate_dim as ed
GROUP BY ed.country , ed.city
ORDER BY Round(AVG(ed.sale_price_eur)) DESC;

--------------------------------------------------------------------------------------------------------

--Which locations and property types have the highest average listing values?
SELECT
    ed.city,
    ed.property_type,
    Round(AVG(ed.sale_price_eur)) as avg_property_price,
    Rank() Over (Partition by ed.city ORDER By Round(AVG(ed.sale_price_eur)) )
From european_real_estate_dim as ed
GROUP BY ed.city,ed.property_type;

--------------------------------------------------------------------------------------------------------

--Highest cities by apartment and villa prices
SELECT
    ed.city,
    ROUND(AVG(CASE WHEN ed.property_type = 'Apartment' THEN ed.sale_price_eur END)) AS Average_apartment_price,
    ROUND(AVG(CASE WHEN ed.property_type = 'Villa' THEN ed.sale_price_eur END)) AS Average_villa_price
FROM european_real_estate_dim AS ed
GROUP BY ed.city
ORDER BY Average_apartment_price DESC, Average_villa_price DESC;

--------------------------------------------------------------------------------------------------------

--Does number of bedrooms and bathroom affect property price ?
SELECT 
    ed.bedrooms,
    ed.bathrooms,
    Round(AVG(ed.sale_price_eur)) as average_price
From european_real_estate_dim as ed 
WHERE ed.bedrooms != 0 and ed.bathrooms != 0
GROUP BY ed.bedrooms,ed.bathrooms
ORDER BY Round(AVG(ed.sale_price_eur)) DESC;

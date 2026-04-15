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

--How do property characteristics such as size, bedrooms, bathrooms, and building age influence pricing?
SELECT 
    ed.bedrooms,
    ed.bathrooms,
    Round(AVG(ed.sale_price_eur)) as average_price
From european_real_estate_dim as ed 
WHERE ed.bedrooms != 0 and ed.bathrooms != 0
GROUP BY ed.bedrooms,ed.bathrooms
ORDER BY Round(AVG(ed.sale_price_eur)) DESC;

--------------------------------------------------------------------------------------------------------

--Do properties with premium amenities (parking, elevators, gyms, pools) command higher prices?
SELECT
    CASE 
        WHEN parking_spots > 0 
          OR elevator = TRUE 
          OR gym = TRUE 
          OR swimming_pool = TRUE 
        THEN 'Premium Amenities'
        ELSE 'Standard'
    END AS property_category,
    ROUND(AVG(sale_price_eur)) AS avg_sale_price,
    ROUND(AVG(price_per_sqm)) AS avg_price_per_sqm,
    COUNT(*) AS total_listings
FROM european_real_estate_dim
WHERE sale_price_eur IS NOT NULL
GROUP BY property_category
ORDER BY avg_sale_price DESC;

--------------------------------------------------------------------------------------------------------

--Which cities might present the most attractive opportunities for real estate investors?
SELECT
    ed.city,
    Round(AVG(ed.sale_price_eur)) as Avg_Property_Price,
    count(ed.property_id) as Total_Units_Sold,
    Round(AVG(ed.days_on_market)) as avg_days_on_market
From european_real_estate_dim as ed
where ed.sale_price_eur is not NULL
GROUP BY ed.city
ORDER BY Total_Units_Sold DESC;

--------------------------------------------------------------------------------------------------------

--Are there locations that show high property values but lower market activity?
SELECT
    country,
    city,
    ROUND(AVG(sale_price_eur)) AS avg_sale_price,
    ROUND(AVG(price_per_sqm)) AS avg_price_per_sqm,
    ROUND(AVG(days_on_market)) AS avg_days_on_market,
    COUNT(*) AS total_listings
FROM european_real_estate_dim
WHERE sale_price_eur IS NOT NULL
  AND days_on_market IS NOT NULL
GROUP BY country, city
HAVING AVG(sale_price_eur) > (
    SELECT AVG(sale_price_eur) FROM european_real_estate_dim
)
   AND AVG(days_on_market) > (
    SELECT AVG(days_on_market) FROM european_real_estate_dim
)
ORDER BY avg_sale_price DESC, avg_days_on_market DESC;

--------------------------------------------------------------------------------------------------------

--Which properties stay longest on the market, and what factors might explain it?
SELECT
    property_type,
    country,
    city,
    ROUND(AVG(days_on_market)) AS avg_days_on_market,
    ROUND(AVG(sale_price_eur)) AS avg_sale_price,
    ROUND(AVG(price_per_sqm)) AS avg_price_per_sqm,
    AVG(bedrooms) AS avg_bedrooms,
    AVG(bathrooms) AS avg_bathrooms,
    AVG(square_meters) AS avg_size_sqm,
    COUNT(*) AS total_listings
FROM european_real_estate_dim
WHERE days_on_market IS NOT NULL
GROUP BY property_type, country, city
ORDER BY avg_days_on_market DESC
LIMIT 15;

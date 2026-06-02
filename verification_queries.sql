

-- SELECT 
--  COUNT(*) AS total_rows,
--   SUM(CASE WHEN rate IS NULL THEN 1 ELSE 0 END) AS missing_rating,
--   SUM(CASE WHEN approx_cost_for_two_people IS NULL THEN 1 ELSE 0 END) AS csot_for_two_people
-- FROM 
--   production_zomato

--  Use Case 1 - Neighborhood Benchmarking

--        The Neighborhood Saturation Index (Window Functions)
-- The Business Problem: An investor wants to open a restaurant but
--  doesn't know where to go. We need to identify which neighborhoods 
--  (location) are highly competitive and crowded, and what the baseline
--   pricing/ratings look like there.

-- WITH NeighborhoodMetrics AS (
--     SELECT 
--         name,
--         location,
--         cuisines,
--         rate,
--         approx_cost_for_two_people,
--         -- Calculate structural benchmarks across the neighborhood
--         COUNT(*) OVER(PARTITION BY location) AS total_restaurants_in_area,
--         ROUND(AVG(rate) OVER(PARTITION BY location), 2) AS avg_neighborhood_rating,
--         ROUND(AVG(approx_cost_for_two_people) OVER(PARTITION BY location), 0) AS avg_neighborhood_cost
--     FROM production_zomato
--     WHERE rate IS NOT NULL AND approx_cost_for_two_people IS NOT NULL
-- )
-- SELECT 
--     location,
--     total_restaurants_in_area,
--     avg_neighborhood_rating,
--     avg_neighborhood_cost,
--     COUNT(DISTINCT cuisines) AS unique_cuisine_count
-- FROM NeighborhoodMetrics
-- GROUP BY location, total_restaurants_in_area, avg_neighborhood_rating, avg_neighborhood_cost
-- ORDER BY total_restaurants_in_area DESC;


-- Use Case 2: Identifying the Local Market Leaders (DENSE_RANK)

--            The Business Problem: We need to find out who the absolute 
-- "Kings" of each neighborhood are based on customer engagement 
-- (votes), so our dashboard can showcase regional market leaders 
-- dynamically.

-- Use Case 2 - Top 3 Most Popular Restaurants Per Location
-- 

-- WITH RankedRestaurants AS (
--     SELECT 
--         name,
--         location,
--         cuisines,
--         votes,
--         rate,
--         DENSE_RANK() OVER(PARTITION BY location ORDER BY CAST(votes AS INT) DESC) as popularity_rank
--     FROM production_zomato
--     WHERE votes IS NOT NULL
-- )
-- SELECT 
--     location,
--     popularity_rank,
--     name,
--     cuisines,
--     votes,
--     rate
-- FROM RankedRestaurants
-- WHERE popularity_rank <= 3
-- ORDER BY location ASC, popularity_rank ASC;


-- Use Case 3: Feature Impact Analysis (Online Ordering vs. Table Booking)
-- The Business Problem: 

--      Does offering convenience features actually 
-- translate to better ratings and higher price thresholds, or is it an 
-- unnecessary operational overhead?

-- Use Case 3 - Feature Feature Impact Metrics

-- SELECT 
--     online_order,
--     book_table,
--     COUNT(*) as total_restaurants,
--     ROUND(AVG(rate), 2) as average_rating,
--     ROUND(AVG(approx_cost_for_two_people), 0) as average_cost
-- FROM production_zomato
-- WHERE rate IS NOT NULL AND approx_cost_for_two_people IS NOT NULL
-- GROUP BY online_order, book_table
-- ORDER BY average_rating DESC;
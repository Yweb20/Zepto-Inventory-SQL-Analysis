-- DATA EXPLORATION

-- COUNT OF ROWS
SELECT COUNT(*) FROM zepto_v2;

-- SAMPLE DATA
SELECT * FROM zepto_v2
LIMIT 10;


-- NULL VALUES
SELECT * FROM zepto_v2
WHERE name IS NULL
OR category IS NULL
OR mrp IS NULL
OR discount_percent IS NULL
OR discounted_selling_price IS NULL
OR weight_in_gms IS NULL
OR available_quantity IS NULL
OR out_of_stock IS NULL
OR quantity IS NULL;

-- DISTINCT PRODUCT CATEGORIES
SELECT DISTINCT category
FROM zepto_v2
ORDER BY category;

-- PRODUCTS IN STOCK VS OUT OF STOCK
SELECT out_of_stock, COUNT(sku_id)
FROM zepto_v2
GROUP BY out_of_stock;

-- PRODUCT NAMES PRESENT MULTIPLE TIMES
SELECT name, COUNT(sku_id) AS "Number of ids"
FROM zepto_v2
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

-- DATA CLEANING

-- PRODUCTS WITH PRICE = 0
SELECT * FROM zepto_v2
WHERE mrp = 0 OR discounted_selling_price = 0;


DELETE FROM zepto_v2
WHERE mrp = 0;

-- CONVERT PAISE TO RUPEES
UPDATE zepto_v2
SET mrp = mrp / 100.0,
    discounted_selling_price = discounted_selling_price / 100.0;

SELECT mrp, discounted_selling_price FROM zepto_v2;

-- DATA ANALYSIS

-- Q1. TOP 10 BEST-VALUE PRODUCTS BASED ON DISCOUNT PERCENTAGE
SELECT DISTINCT name, mrp, discount_percent
FROM zepto_v2
ORDER BY discount_percent DESC
LIMIT 10;

-- Q2. PRODUCTS WITH HIGH MRP BUT OUT OF STOCK
SELECT DISTINCT name, mrp
FROM zepto_v2
WHERE out_of_stock = TRUE AND mrp > 300
ORDER BY mrp DESC;

-- Q3. ESTIMATED REVENUE FOR EACH CATEGORY
SELECT category,
       SUM(discounted_selling_price * available_quantity) AS total_revenue
FROM zepto_v2
GROUP BY category
ORDER BY total_revenue;

-- Q4. PRODUCTS WHERE MRP > 500 AND DISCOUNT < 10%
SELECT DISTINCT name, mrp, discount_percent
FROM zepto_v2
WHERE mrp > 500 AND discount_percent < 10
ORDER BY mrp DESC, discount_percent DESC;

-- Q5. TOP 5 CATEGORIES WITH HIGHEST AVERAGE DISCOUNT
SELECT category,
       ROUND(AVG(discount_percent),2) AS avg_discount
FROM zepto_v2
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. PRICE PER GRAM FOR PRODUCTS ABOVE 100G
SELECT DISTINCT name, weight_in_gms, discounted_selling_price,
       ROUND(discounted_selling_price/weight_in_gms,2) AS price_per_gram
FROM zepto_v2
WHERE weight_in_gms >= 100
ORDER BY price_per_gram;

-- Q7. GROUP PRODUCTS INTO LOW, MEDIUM, BULK
SELECT DISTINCT name, weight_in_gms,
CASE 
    WHEN weight_in_gms < 1000 THEN 'Low'
    WHEN weight_in_gms < 5000 THEN 'Medium'
    ELSE 'Bulk'
END AS weight_category
FROM zepto_v2;

-- Q8. TOTAL INVENTORY WEIGHT PER CATEGORY
SELECT category,
       SUM(weight_in_gms * available_quantity) AS total_weight
FROM zepto_v2
GROUP BY category
ORDER BY total_weight;
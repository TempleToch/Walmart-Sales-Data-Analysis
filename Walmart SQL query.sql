CREATE DATABASE IF NOT EXISTS salesdatawalmart;

DROP table sale;
USE  salesdatawalmart;
CREATE TABLE IF NOT EXISTS Sale(
invoice_id VARCHAR (30) NOT NULL PRIMARY KEY,
branch VARCHAR (5) NOT NULL,
City VARCHAR (30 ) NOT NULL,
Customer_type VARCHAR  (30),
Gender VARCHAR (10) NOT NULL, 
Product_line VARCHAR (100) NOT NULL, 
Unit_price DECIMAL (10,2)  NOT NULL, 
Quantity INT   NOT NULL, 
VAT DECIMAL (6, 4)  NOT NULL, 
Total DECIMAL ( 10, 2) NOT NULL, 
date Date NOT NULL, 
Time timestamp  NOT NULL, 
Payment_method VARCHAR (15) NOT NULL, 
Cogs DECIMAL (10,2) NOT NULL, 
Gross_margin_percentage DECIMAL (11, 9), 
Gross_income DECIMAL (12, 2), 
Rating  DECIMAL  ( 2, 1)
);

 SELECT * 
 FROM sales;

Alter Table sale
Modify Time time ;

-----------------------------------------------------------------------------------------------------------------

-------------   ------------------  FEATURED ENGINEERING -------------
 
 ----------------------------------TIME_OF_DAY---------------------------
-------------------------------------------------------------------------------------------------------------------------
;
SELECT 
     Time, 
          (  CASE 
               WHEN `TIME` BETWEEN "00:00:00"  AND "12:00:00" THEN "MORNING"   
               WHEN `TIME` BETWEEN "12:01:00"  AND "16:00:00" THEN "AFTERNOON"  
               ELSE "EVENING"
               END 
     ) AS Time_of_day
FROM sale;
------------------------------------------------------------------------------------------
ALTER TABLE sale
ADD COLUMN Time_of_day VARCHAR(20); 

UPDATE sale
SET Time_of_day =( CASE 
               WHEN `TIME` BETWEEN "00:00:00"  AND "12:00:00" THEN "MORNING"   
               WHEN `TIME` BETWEEN "12:01:00"  AND "16:00:00" THEN "AFTERNOON"  
               ELSE "EVENING"
               END
               );
               
---- ------day_name 
 
  SELECT 
         date,
         DAYNAME(date) AS day_name 
	FROM sale;

ALTER TABLE sale
ADD COLUMN day_name VARCHAR(20);    

UPDATE sale
SET day_name = DAYNAME(date);
               
---------Month_name -------
;
SELECT 
     date,
     MONTHNAME(date) AS Month_name
FROM sale;
               
ALTER TABLE sale
ADD COLUMN Month_name VARCHAR(20);               
               
UPDATE sale
SET Month_name = MONTHNAME(date);          

------------------------------------------------  GENERIC --------------------------------------------

--How many unique cities does the data have?;

SELECT 
DISTINCT City
FROM sale;
----------------------------------------------------------------------------------------------
-------In which city is each branch?------;

SELECT 
DISTINCT branch 
FROM sale;

SELECT 
DISTINCT branch, 
city 
FROM sale;

-------------------------------------------------------------------------------------------------
----------------------------------  Product -----------------------------------------------------
--- How many unique product lines does the data have? ----------------------------

SELECT 
DISTINCT Product_line
FROM sale;

SELECT 
COUNT(DISTINCT Product_line)
FROM sale;

--- What is the most common payment method?-------

SELECT 
	payment_method
FROM sale;

SELECT 
	DISTINCT payment_method
FROM sale;

SELECT 
	payment_method,
    COUNT( payment_method) AS CNT
FROM sale
GROUP BY payment_method
ORDER BY CNT DESC;
----------------------------------------------------------------------------------------------------------
--- What is the most selling product line? -----------------------------------------------------------------

SELECT 
	Product_line,
    COUNT(product_line) AS most_selling
FROM sale
GROUP BY Product_line
ORDER BY most_selling DESC;

--- What is the total revenue by month? ----------
SELECT 
     Month_name  AS Month, 
     SUM(total) AS total_revenue 
FROM sale
GROUP BY month_name
ORDER BY total_revenue DESC;
     
--- What month had the largest COGS? -----

SELECT 
     Month_name  AS Month, 
     SUM(Cogs) AS Cogs 
FROM sale
GROUP BY month_name 
ORDER BY Cogs DESC;
----------------------------------------------------------------------------------------------
--- What product line had the largest revenue? ---------------------------
SELECT 
     Product_line AS Product_line, 
     SUM(total) AS total 
FROM sale
GROUP BY Product_line 
ORDER BY total DESC
LIMIT 1 ;
--- ----------------------------------------------------------------------------------------
--- What is the city with the largest revenue? ----
SELECT 
     city AS city, branch,
     SUM(total) AS total 
FROM sale
GROUP BY city,branch
ORDER BY total DESC ;
-----------------------------------------------------------------------------------------------------
--- What product line had the largest VAT? --------------------------------------------------

SELECT 
     Product_line, 
     AVG(VAT) AS Avg_VAT 
FROM sale
GROUP BY Product_line
ORDER BY Avg_VAT DESC ;
----------------------------------------------------------------------------------------------------

SELECT 
     Product_line, 
     AVG(VAT) AS Avg_VAT 
FROM sale
GROUP BY Product_line
ORDER BY Avg_VAT DESC ;
------------------------------------------------------------------------------------------------------------
--- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales --
## USE salesdatawalmart;
SELECT 
    product_line,
    SUM(total) AS total_revenue,
    CASE 
        WHEN SUM(total) > 
        (SELECT AVG(revenue_sum)
		FROM (SELECT SUM(total) AS revenue_sum
		FROM sale
		GROUP BY product_line
        ) AS avg_revenue
        ) THEN 'Good'
        ELSE 'Bad'
    END AS performance
FROM sale
GROUP BY product_line;

-----------------------------------------------------------------------------------------------------------
--- Which branch sold more products than average product sold? ---

SELECT 
     branch,
     SUM(Quantity) AS Qty
FROM sale
GROUP BY branch
HAVING SUM(Quantity) > AVG(Quantity)
;
----------------------------------------------------------------------------------------------------------------------------
--- What is the most common product line by gender? -------

SELECT 
     Gender,
     product_line,
     COUNT(Product_line) AS total_cnt
FROM sale
GROUP BY Gender
;
-----------------------------------------------------------------------------------------------------------------------------------
--- What is the average rating of each product line? -----------------------------------
SELECT 
      Product_line,
     ROUND(Avg(Rating), 2) AS Avg_rating
FROM sale
GROUP BY Product_line
ORDER BY Avg_rating DESC;

-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------   SALES ----------------------------------------------------------------------

--- Number of sales made in each time of the day per weekday  -----
SELECT 
     time_of_day,
  COUNT(*) AS total_sales
FROM sale
WHERE day_name ='Monday'
GROUP BY time_of_day
ORDER BY total_sales DESC;
  
--- -------------------------------------------------------------------------------------------------------------------------
--- Which of the customer types brings the most revenue? ----
SELECT 
     customer_type, 
     SUM(Total) AS Total_revenue
FROM sale
GROUP BY Customer_type
ORDER BY Total_revenue DESC;

---------------------------------------------------------------------------------------------------------
--- Which city has the largest tax percent/ VAT (Value Added Tax)? ---
SELECT
	 City,
     ROUND(Avg(VAT), 2) AS Avg_tax
FROM sale
GROUP BY City 
ORDER BY Avg_tax DESC; 

--------------------------------------------------------------------------------------------------
--- Which customer type pays the most in VAT? ---
SELECT 
     Customer_type,
     ROUND(AVG(VAT), 2) AS total_VAT
FROM Sale
GROUP BY Customer_type
ORDER by total_VAT DESC;

---------------------------------------------------------------------------------------------------------
---------------------------------------------  CUSTOMER  --------------------------------------------
--- How many unique customer types does the data have? ----

SELECT 
     DISTINCT Customer_type 
FROM sale;

----------------------------------------------------------------------------------------------------------
--- ow many unique payment methods does the data have? ----
SELECT 
     DISTINCT Payment_method
FROM sale;
-----------------------------------------------------------------------------------------------------------	 
--- What is the most common customer type? ---
SELECT 
      Customer_type,
      COUNT( Customer_type) AS Most_common
FROM sale
GROUP BY Customer_type 
ORDER BY Most_common DESC;

-------------------------------------------------------------------------------------------------------------
---  Which customer type buys the most?  ---
SELECT 
      Customer_type,
      COUNT(*)
FROM sale
GROUP BY Customer_type 
ORDER BY Most_common DESC;

---------------------------------------------------------------------------------------------------------------
--- What is the gender of most of the customers?  ----
SELECT 
	 Gender,
     COUNT(*) AS Gender_Cnt
FROM Sale 
GROUP BY Gender
ORDER BY Gender_Cnt DESC;

---  What is the gender distribution per branch? ----
SELECT 
      Gender,
      COUNT(Gender) AS Gender_CNT
FROM Sale
WHERE Branch = 'A' 
GROUP BY Gender
ORDER BY Gender_CNT DESC;

SELECT
    Gender,
    COUNT(CASE WHEN Branch = 'A' THEN 1 END) AS Branch_A,
    COUNT(CASE WHEN Branch = 'B' THEN 1 END) AS Branch_B,
    COUNT(CASE WHEN Branch = 'C' THEN 1 END) AS Branch_C
FROM Sale
GROUP BY Gender
ORDER BY Gender DESC;



SELECT 
      Gender,
      COUNT(CASE WHEN Branch = 'A' THEN 1 END) AS Branch_A,
      COUNT(CASE WHEN Branch = 'B' THEN 1 END) AS Branch_B,
      COUNT(CASE WHEN Branch = 'C' THEN 1 END) AS Branch_C
FROM Sale
GROUP BY Gender
ORDER BY Gender DESC;


---- still figuring how to organize this method well 
SELECT 
       Branch, 
       Gender, 
	   COUNT(Gender) as ct_gend
FROM Sale
GROUP BY Gender, Branch
ORDER BY branch;
--------------------------------------------------------------------------------------------------
--- Which time of the day do customers give most ratings? ---
SELECT 
       Time_of_day,
      ROUND(AVG(Rating), 2)AS Avg_rate
FROM sale 
GROUP BY Time_of_day
ORDER BY Avg_rate DESC;

-------------------------------------------------------------------------------------------------------- 
--- Which time of the day do customers give most ratings per branch? ----
SELECT 
       Time_of_day,
      ROUND(AVG(Rating), 2)AS Avg_rate
FROM sale 
WHERE Branch = 'B'
GROUP BY Time_of_day
ORDER BY Avg_rate DESC;
      
SELECT 
    Time_of_day,
    ROUND(AVG(CASE WHEN Branch = 'A' THEN Rating END), 2) AS Branch_A,
    ROUND(AVG(CASE WHEN Branch = 'B' THEN Rating END), 2) AS Branch_B,
    ROUND(AVG(CASE WHEN Branch = 'C' THEN Rating END), 2) AS Branch_C
FROM Sale
GROUP BY Time_of_day
ORDER BY Time_of_day;
--------------------------------------------------------------------------------------------------------
--- Which day of the week has the best avg ratings? ---

SELECT 
      day_name, 
      AVG(Rating) AS Avg_rating
FROM sale
GROUP BY day_name 
ORDER BY Avg_rating DESC; 
-------------------------------------------------------------------------------------------------------------
--- Which day of the week has the best average ratings per branch? ---
 SELECT 
      day_nam    ,
	  ROUND(AVG(CASE WHEN Branch = 'A' THEN Rating END), 2) AS Branch_A,
      ROUND(AVG(CASE WHEN Branch = 'B' THEN Rating END), 2) AS Branch_B,
      ROUND(AVG(CASE WHEN Branch = 'c' THEN Rating END), 2) AS Brnch_C
FROM sale
GROUP BY day_name 
ORDER BY day_name ;

--- What is the most common payment method
SELECT
	payment,
    count(*) AS cnt
FROM sale
GROUP by payment
ORDER BY cnt;

--- what is the total revenue by month ---

 SELECT 
       month_name AS Month,
       SUM(Total) AS total_revenue
 FROM sale
 GROUP BY month_name 
 ORDER BY total_revenue DESC;

--- What month had the largest COGS ---

SELECT 
     Month_name AS Month, 
	SUM(Cogs) AS Largest_Cogs
FROM Sale
GROUP BY Month_name
ORDER BY Largest_Cogs DESC;

--- What product line had the largest revenue? ---
SELECT 
      Product_line,
      SUM(Total) AS Largest_revenue
FROM sale
GROUP BY Product_line
ORDER BY Largest_revenue DESC;

--- What product line had the largest VAT? ---
SELECT 
      Product_line,
      ROUND(AVG(VAT),2) AS Largest_VAT
FROM sale
GROUP BY Product_line
ORDER BY Largest_VAT DESC;

--- What is the city with the largest revenue?

SELECT 
     Branch,
     City,
     SUM(Total) AS Total_revenue
FROM Sale
GROUP BY Branch, City
ORDER BY Total_revenue DESC;




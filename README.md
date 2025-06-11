# 🛒 Walmart Sales Data Analysis

## 📖 About the Project

This project explores Walmart sales data to understand top-performing branches and products, analyze sales trends, and examine customer behavior. The ultimate goal is to uncover actionable insights that can help improve and optimize sales strategies.

The dataset is sourced from the **Kaggle Walmart Sales Forecasting Competition**.

> "In this recruiting competition, job-seekers are provided with historical sales data for 3 Walmart stores located in different regions. Each store contains many departments, and participants must project the sales for each department in each store. To add to the challenge, selected holiday markdown events are included in the dataset. These markdowns are known to affect sales, but it is challenging to predict which departments are affected and the extent of the impact."_ — _Kaggle_

---

## 🎯 Project Purpose

The main objective is to gain insights into the sales performance across different Walmart branches and product lines, and to understand the customer and sales patterns that influence these performances.

---

## 📊 Dataset Information

The dataset consists of 1,000 transactions from three Walmart branches located in **Mandalay**, **Yangon**, and **Naypyitaw**. It includes 17 columns capturing a range of transactional, temporal, and customer details.

### 🗂️ Table Schema

| Column Name              | Description                                   | Data Type        |
|--------------------------|-----------------------------------------------|------------------|
| `invoice_id`             | Unique invoice identifier for each transaction| `VARCHAR(30)`    |
| `branch`                 | Branch where the sale occurred                | `VARCHAR(5)`     |
| `city`                   | Location of the branch                        | `VARCHAR(30)`    |
| `customer_type`          | Type of customer (e.g., Member, Normal)       | `VARCHAR(30)`    |
| `gender`                 | Gender of the customer                        | `VARCHAR(10)`    |
| `product_line`           | Category of product sold                      | `VARCHAR(100)`   |
| `unit_price`             | Price per unit                                | `DECIMAL(10, 2)` |
| `quantity`               | Number of units sold                          | `INT`            |
| `VAT`                    | Value Added Tax                               | `Decimal(6, 4)`  |
| `total`                  | Total transaction amount                      | `DECIMAL(10, 2)` |
| `date`                   | Date of the transaction                       | `DATE`           |
| `time`                   | Time of the transaction                       | `TIME`      |
| `payment_method`         | Payment method used                           | `VARCHAR(30)`    |
| `cogs`                   | Cost of goods sold                            | `DECIMAL(10, 2)` |
| `gross_margin_percentage`| Gross margin percentage                       | `Decimal(11, 9)` |
| `gross_income`           | Gross income from the transaction             | `DECIMAL(10, 2)` |
| `rating`                 | Customer rating                               | `Decimal(2, 1)`  |

---

## ❓ Business Questions to Answer

### 📌 Generic Questions
1. How many unique cities does the data have?  
2. In which city is each branch?

### 📦 Product
3. How many unique product lines does the data have?  
4. What is the most common payment method?  
5. What is the most selling product line?  
6. What is the total revenue by month?  
7. What month had the largest COGS?  
8. What product line had the largest revenue?  
9. What is the city with the largest revenue?  
10. What product line had the largest VAT?  
11. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if it's greater than average sales  
12. Which branch sold more products than average product sold?  
13. What is the most common product line by gender?  
14. What is the average rating of each product line?

### 💰 Sales
15. Number of sales made in each time of the day per weekday  
16. Which of the customer types brings the most revenue?  
17. Which city has the largest tax percent/ VAT (Value Added Tax)?  
18. Which customer type pays the most in VAT?

### 👥 Customer
19. How many unique customer types does the data have?  
20. How many unique payment methods does the data have?  
21. What is the most common customer type?  
22. Which customer type buys the most?  
23. What is the gender of most of the customers?  
24. What is the gender distribution per branch?  
25. Which time of the day do customers give most ratings?  
26. Which time of the day do customers give most ratings per branch?  
27. Which day of the week has the best average ratings?  
28. Which day of the week has the best average ratings per branch?

---

## ⚙️ Analytical Approach

### 1. Data Wrangling
- Inspection and handling of missing or NULL values.
- Table creation with `NOT NULL` constraints to avoid null entries.

### 2. Feature Engineering
- `time_of_day`: Categorize transactions into Morning, Afternoon, Evening.
- `day_name`: Extract weekday (Mon–Sun) from date.
- `month_name`: Extract month (Jan–Dec) from date.

### 3. Exploratory Data Analysis (EDA)
- Performed using SQL and visualization tools to address all business questions.
- Metrics and trends identified to uncover actionable insights.

---

## 🧰 Tools Used



- SQL
- Python (Pandas, Matplotlib, Seaborn)
- Excel
- Jupyter Notebook
- Tableau / Power BI (optional)

---

## 📌 Conclusion
*Analysis and conclusions to be added after EDA completion.*

# Revenue and Profit Calculations step-by-step in a simple and clear way

What the terms mean:
COGS (Cost of Goods Sold):
This is how much it costs to buy or produce the products you sold.
Formula: 
       COGS= unitPrice × quantity

VAT (Value Added Tax):
This is a tax charged on the sale, set at 5% of the COGS.
Formula:
VAT = 5% × COGS

Total (Gross Sales):
This is what you bill the customer, which is the sum of the COGS plus the VAT.
Formula:  total (gross sales)= COGS + VAT

Gross Profit (Gross Income):
This is the profit you make before deducting other expenses, and it's the VAT amount in this case (because COGS is your cost, and you add VAT on top).
Formula: gross Profit =total (gross sales) − COGS =VAT

Gross Margin:
This shows how much profit you make as a percentage of your total revenue (gross sales).
Formula:  Gross Margin=    total revenue / grossProfit  × 100%
                          
Example calculation (with your first row data):
Unit Price = 45.79
Quantity = 7
​
Step 1: Calculate COGS  = COGS= 45.79 × 7= 320.53

Step 2: Calculate VAT = VAT=5%×320.53=16.0265

Step 3: Calculate Total (Gross Sales) = 
       total= COGS + VAT = 320.53 + 16.0265 = 336.5565

Profit = Selling Price (before VAT) – Cost of Goods Sold (COGS)
Example:
Let’s assume:

COGS = $45.79 × 7 = $320.53

You add 20% profit margin to COGS:
Selling Price (before VAT)=320.53+(20%×320.53) = 320.53+64.106 =384.636
VAT (5%) is added on top of that: 

VAT = 5% × 384.636 = 19.2318
otal price customer pays = 384.636 + 19.2318 = $403.87

Final Summary:
You collected $403.87 from the customer

You send $19.23 to the government as VAT

Your own profit = $384.64 (your selling price) – $320.53 (your cost) = $64.11

✅ Your real profit: $64.11
 
 SQL QUERY FOR AUTOMATION 

SELECT
    unit_price,
    quantity,
    
    -- COGS: Cost of Goods Sold
    unit_price * quantity AS cogs,

    -- Profit Margin: 20% of COGS
    0.20 * (unit_price * quantity) AS profit_margin,

    -- Selling Price before VAT (COGS + Profit)
    (unit_price * quantity) + (0.20 * (unit_price * quantity)) AS selling_price,

    -- VAT: 5% of Selling Price
    0.05 * ((unit_price * quantity) + (0.20 * (unit_price * quantity))) AS vat,

    -- Total billed to customer (Selling Price + VAT)
    ((unit_price * quantity) + (0.20 * (unit_price * quantity))) +
    (0.05 * ((unit_price * quantity) + (0.20 * (unit_price * quantity)))) AS total_billed,

    -- Actual profit (Selling Price - COGS)
    ((unit_price * quantity) + (0.20 * (unit_price * quantity))) - (unit_price * quantity) AS real_profit

FROM sales;







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
| `VAT`                    | Value Added Tax                               | `FLOAT(6, 4)`    |
| `total`                  | Total transaction amount                      | `DECIMAL(10, 2)` |
| `date`                   | Date of the transaction                       | `DATE`           |
| `time`                   | Time of the transaction                       | `TIMESTAMP`      |
| `payment_method`         | Payment method used                           | `VARCHAR(30)`    |
| `cogs`                   | Cost of goods sold                            | `DECIMAL(10, 2)` |
| `gross_margin_percentage`| Gross margin percentage                       | `FLOAT(11, 9)`   |
| `gross_income`           | Gross income from the transaction             | `DECIMAL(10, 2)` |
| `rating`                 | Customer rating                               | `FLOAT(2, 1)`    |

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




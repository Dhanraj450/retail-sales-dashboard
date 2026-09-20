-- ============================================================
-- Retail Sales Performance Dashboard - SQL Queries
-- Dataset: retail_sales_cleaned.csv (import into a table named `sales`)
-- Tool used to test: DB Browser for SQLite (or any MySQL/PostgreSQL client)
-- ============================================================


-- 1. TOP-PERFORMING CATEGORIES BY REVENUE
-- Business question: Which product categories bring in the most revenue and profit?
SELECT
    Category,
    ROUND(SUM(Sales), 2)   AS Total_Sales,
    ROUND(SUM(Profit), 2)  AS Total_Profit,
    COUNT(DISTINCT [Order ID]) AS Total_Orders
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;


-- 2. UNDERPERFORMING SUB-CATEGORIES (low or negative profit)
-- Business question: Which sub-categories are dragging down profit despite decent sales?
SELECT
    Category,
    [Sub-Category],
    ROUND(SUM(Sales), 2)  AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) * 1.0 / NULLIF(SUM(Sales), 0), 3) AS Profit_Margin
FROM sales
GROUP BY Category, [Sub-Category]
HAVING Total_Profit < 0 OR Profit_Margin < 0.05
ORDER BY Total_Profit ASC;


-- 3. MONTH-OVER-MONTH SALES TREND
-- Business question: How is revenue trending month to month? (feeds the dashboard's trend line)
SELECT
    strftime('%Y-%m', [Order Date]) AS Order_Month,
    ROUND(SUM(Sales), 2)  AS Monthly_Sales,
    ROUND(SUM(Profit), 2) AS Monthly_Profit
FROM sales
GROUP BY Order_Month
ORDER BY Order_Month;


-- 4. REGION-WISE PERFORMANCE
-- Business question: Which regions perform best, and where is profit margin weakest?
SELECT
    Region,
    ROUND(SUM(Sales), 2)  AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(SUM(Profit) * 1.0 / NULLIF(SUM(Sales), 0), 3) AS Profit_Margin,
    COUNT(DISTINCT [Order ID]) AS Total_Orders
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;


-- 5. TOP 10 CUSTOMERS BY REVENUE
-- Business question: Who are our highest-value customers? (used for the customer segmentation project too)
SELECT
    [Customer ID],
    [Customer Name],
    ROUND(SUM(Sales), 2)  AS Total_Spend,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    ROUND(SUM(Sales) * 1.0 / COUNT(DISTINCT [Order ID]), 2) AS Avg_Order_Value
FROM sales
GROUP BY [Customer ID], [Customer Name]
ORDER BY Total_Spend DESC
LIMIT 10;


-- 6. CUSTOMER SEGMENTATION BY VALUE (High / Medium / Low)
-- Business question: Group customers into value tiers based on total spend
SELECT
    [Customer ID],
    [Customer Name],
    ROUND(SUM(Sales), 2) AS Total_Spend,
    CASE
        WHEN SUM(Sales) >= 15000 THEN 'High Value'
        WHEN SUM(Sales) >= 5000  THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Tier
FROM sales
GROUP BY [Customer ID], [Customer Name]
ORDER BY Total_Spend DESC;


-- 7. CUSTOMER SEGMENT SUMMARY (count and revenue contribution per tier)
-- Business question: How many customers fall into each tier, and how much revenue do they contribute?
WITH customer_totals AS (
    SELECT
        [Customer ID],
        SUM(Sales) AS Total_Spend
    FROM sales
    GROUP BY [Customer ID]
),
tiered AS (
    SELECT
        *,
        CASE
            WHEN Total_Spend >= 15000 THEN 'High Value'
            WHEN Total_Spend >= 5000  THEN 'Medium Value'
            ELSE 'Low Value'
        END AS Customer_Tier
    FROM customer_totals
)
SELECT
    Customer_Tier,
    COUNT(*) AS Num_Customers,
    ROUND(SUM(Total_Spend), 2) AS Tier_Revenue,
    ROUND(SUM(Total_Spend) * 100.0 / (SELECT SUM(Sales) FROM sales), 2) AS Pct_Of_Total_Revenue
FROM tiered
GROUP BY Customer_Tier
ORDER BY Tier_Revenue DESC;


-- 8. REPEAT-PURCHASE ANALYSIS
-- Business question: What share of customers ordered more than once, and how much more do they spend?
SELECT
    CASE WHEN Total_Orders > 1 THEN 'Repeat Customer' ELSE 'One-Time Customer' END AS Customer_Type,
    COUNT(*) AS Num_Customers,
    ROUND(AVG(Total_Spend), 2) AS Avg_Spend_Per_Customer
FROM (
    SELECT
        [Customer ID],
        COUNT(DISTINCT [Order ID]) AS Total_Orders,
        SUM(Sales) AS Total_Spend
    FROM sales
    GROUP BY [Customer ID]
) t
GROUP BY Customer_Type;


-- 9. DISCOUNT IMPACT ON PROFIT
-- Business question: Are higher discounts eroding profit margins?
SELECT
    Discount,
    COUNT(*) AS Num_Orders,
    ROUND(AVG(Profit), 2) AS Avg_Profit,
    ROUND(SUM(Sales), 2)  AS Total_Sales
FROM sales
GROUP BY Discount
ORDER BY Discount;

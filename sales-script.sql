SELECT * FROM new_schema.sales_data_sample;
select distinct status from new_schema.sales_data_sample;

select distinct MONTH_ID 
FROM new_schema.sales_data_sample
WHERE YEAR_ID = '2005'

-----ANALYSIS
-----Analysis 1 - Sales by Product Line
SELECT productline, round(sum(sales),4) AS sales
FROM new_schema.sales_data_sample
GROUP BY productline
ORDER BY sales DESC


-----Analysis 2 - Sales by Year
SELECT year_id, round(sum(sales),4) AS sales
FROM new_schema.sales_data_sample
GROUP BY year_id
ORDER BY sales DESC

-----Analysis 3 - Sales by DealSize
SELECT dealsize, round(sum(sales),4) AS sales
FROM new_schema.sales_data_sample
GROUP BY dealsize
ORDER BY sales DESC
-----Analysis 4 - Best Month for Sales per Year
SELECT month_id, sum(sales) AS sales
FROM new_schema.sales_data_sample
WHERE year_id = '2004'
GROUP BY month_id
ORDER BY sales DESC
LIMIT 1
-----Analysis 5 - What Product Line Sells Most in Best Month
SELECT month_id, productline, sum(sales) as sales, count(ordernumber)
FROM new_schema.sales_data_sample
WHERE year_id = '2004' AND month_id = '11'
GROUP BY month_id, productline
ORDER BY sales DESC


-----Analysis 6 - What city has the highest number of sales in a specific country
SELECT city, sum(sales) Sales
FROM new_schema.sales_data_sample
WHERE country = 'UK'
GROUP BY city
ORDER BY 2 desc


-----Analysis 7 - What is the best product in United States?
SELECT country, YEAR_ID, PRODUCTLINE, sum(sales) Revenue
FROM new_schema.sales_data_sample
WHERE country = 'USA'
GROUP BY  country, YEAR_ID, PRODUCTLINE
ORDER BY 4 desc

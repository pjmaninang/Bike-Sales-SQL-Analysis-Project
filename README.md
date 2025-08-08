# Bike Sales & Product Performance Analysis

## Project Overview

This Bike company (synthetic), with operations in both North America and Europe, is wanting to evaluate its overall performance from sales data in 2010 to 2014. Their data is focused on its sales order information, product offerings and costs, and customer profiles. 

This project thoroughly analyzes their company sales database to uncover critical insights that will help to increase the company's sales and profitability. 

To uncover key insights that will help drive the company's growth, the analysis of their SQL database were focused on these core objectives:

  - Understanding buying patterns by different customer demographic and regional information
  - Identifying top-performing products, product categories, and product lines
  - Analyzing sales and profitability trends over time
  - Measuring overall profitability throughout the given sales data

The project deliverable with all SQL query table outputs can be downloaded [here](https://github.com/pjmaninang/Bike-Sales-SQL-Analysis-Project/blob/main/Project%20Deliverable.xlsx)

All the SQL code can be viewed and downloaded [here](https://github.com/pjmaninang/Bike-Sales-SQL-Analysis-Project/blob/main/BikeSales%20SQL%20Analysis.sql)

## Data Structure

The company's database structure consists of three tables: dim_customers(gold), fact_sales(gold), and dim_products(gold)

![Database Schema](https://github.com/pjmaninang/Bike-Sales-SQL-Analysis-Project/blob/main/Database%20Schema.png?raw=true)

## Executive Summary

### Overview of Findings

## Findings and Insights

### Profitability

- After a 17% YoY decline in 2012, 2013 revenue surged 179.77%, lifting net profit to $6.76M with a healthy 41.37% margin
- Accessories deliver the highest net profit margin at 62%, far outperforming Bikes (39%) and Clothing (40%)
- Bikes generate $11.1M in net profit, accounting for the vast majority of category profit dollars
- The Road product line produces the highest net profit at $5.37M, but with the lowest margin (36%) among product lines — meaning revenue growth here could still yield strong profit gains

### Sales Trends

- 2013 saw a major surge in performance, with monthly revenue consistently over $1M and peaking at $1.87M in December
- Order volume increased 10x compared to 2011–2012, indicating strong market expansion and operational scaling
- July historically shows a notable revenue dip with -19% in 2011, -19.9% in 2012, -16.5% in 2013
- December is reliably strong each year, with positive growth over November and among the highest monthly revenues

### Customer and Regional Revenue

- Married males are the top revenue group, contributing $7.9M, closely followed by married females at $7.26M
- Single females outperform single males in revenue ($7.54M vs $6.61M), suggesting possible demographic targeting opportunities
- The U.S. (31.21%) and Australia (30.86%) together account for over 62% of total revenue
- While the U.K., Germany, and France collectively contribute ~30% of revenue, each market individually holds under 12% share

### Product Performance

- Bikes account for 96.46% of total sales revenue ($28.3M), dwarfing Accessories (2.39%) and Clothing (1.16%)
- Road products generate 49.81% of sales ($14.62M), and Mountain products contribute 34.92% ($10.25M)
- Touring and Other Sales combined make up just 15%, suggesting opportunities to diversify or strengthen these lower-share lines.
- The top 5 revenue products are all high-priced Mountain-200 bikes, yet they rank low in quantity sold (22–26th place)
- The top 5 quantity-sold products (e.g., Water Bottle, Patch Kit) move thousands of units but rank between 57th–128th in revenue
  - These items may be low-margin accessories that drive traffic or serve as add-on sales rather than profit leaders

## Recommendations



## Limitations
- Sales data in both of the years 2010 and 2014 are incomplete, which have contributed to lower sales figures, inflated net profit margins, and innacurate year-over-year growth percentages for their preceding and/or following years
- Some of the order date data and the customer demographic data were null or blank values, and there is no reliable source of truth to fill in those blanks


![Bike Sales Project Banner](https://github.com/pjmaninang/Bike-Sales-SQL-Analysis-Project/blob/main/biking.jpg)
# Bike Sales & Product Performance Analysis

## Project Overview

This Bike company (synthetic), with operations in both North America and Europe, is wanting to evaluate its overall performance from sales data in 2010 to 2014. Their data is focused on its sales order information, product offerings and costs, and customer profiles. 

This project thoroughly analyzes their company sales database to uncover critical insights that will help to increase the company's sales and profitability. 

To uncover key insights that will help drive the company's growth, the analysis of their SQL database were focused on these core objectives:

  - Understanding buying patterns by different customer demographic and regional information
  - Identifying top-performing products, product categories, and product lines
  - Analyzing sales and profitability trends over time
  - Measuring overall profitability throughout the given sales data

The original dataset can be found and downloaded [here](https://github.com/DataWithBaraa/sql-data-analytics-project)

The project deliverable with all SQL query table outputs can be downloaded [here](https://github.com/pjmaninang/Bike-Sales-SQL-Analysis-Project/blob/main/Project%20Deliverable.xlsx)

All the SQL code can be viewed and downloaded [here](https://github.com/pjmaninang/Bike-Sales-SQL-Analysis-Project/blob/main/BikeSales%20SQL%20Analysis.sql)

## Data Structure

The company's database structure consists of three tables: dim_customers(gold), fact_sales(gold), and dim_products(gold)

![Database Schema](https://github.com/pjmaninang/Bike-Sales-SQL-Analysis-Project/blob/main/Database%20Schema.png?raw=true)

## Executive Summary

### Overview of Findings

In 2013, revenue rebounded sharply with 179.77% YoY growth, lifting net profit to $6.76M and sustaining a healthy 41.37% margin. Profitability is anchored in Bikes, which contribute 96.46% of total sales and $11.1M in profit, while Accessories lead in margin at 62%—a strength that potentially highlights over-reliance on a single category. The U.S. and Australia remain core markets, generating over 62% of total revenue, while female customers—both married and single—slightly outpace male counterparts in revenue contribution. High-value Mountain-200 bikes drive top-line results despite modest unit volumes, whereas high-volume accessories deliver minimal revenue, positioning them primarily as traffic drivers rather than profit engines. To sustain growth and mitigate risk, diversifying revenue streams beyond Bikes while expanding in underpenetrated markets like the U.K., Germany, and France should be a strategic priority.

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

- With 96% of revenue concentrated in Bikes, expand product development, marketing, and bundling strategies for Accessories and Clothing to reduce reliance on a single category while boosting high-margin segments
- Maintain and strengthen market share in the U.S. and Australia (62% combined share) while targeting underpenetrated but high-potential regions like the U.K., Germany, and France with localized promotions and partnerships
- Develop targeted campaigns or limited-time offers to counteract the recurring July slowdown and maintain momentum during historically weak months

## Limitations
- Incomplete Sales Data for 2010 and 2014 – Sales records for these years are partial, which has likely resulted in understated revenue figures, inflated net profit margins, and distorted year-over-year growth rates for adjacent periods
- Missing Order Date and Customer Demographic Information – Certain order dates and customer demographic fields contain null or blank values, with no authoritative source available to accurately supplement the missing data


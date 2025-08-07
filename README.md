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

- 2013 was the company's highest sales year by a large margin with total sales of $16,344,878, having the highest year-over-year increase in revenue of 179% from 2012, as well as having the highest net profit margin percentage of 41%
- Accessories holds the highest net profit margin percentage of 62% out of the three product categories, with Clothing and Bikes still maintaining promising margins of 40% and 39%, respectively
- The Other Sales product line holds the highest net profit margin of 49%, with the lowest profit margin being in the Road product line, which still boasts a great 36% net profit margin 

### Sales Trends

- 2013 saw a major surge in performance, with monthly revenue consistently over $1M and peaking at $1.87M in December
- Order volume increased 10x compared to 2011–2012, indicating strong market expansion and operational scaling
- July historically shows a notable revenue dip with -19% in 2011, -19.9% in 2012, -16.5% in 2013
- December is reliably strong each year, with positive growth over November and among the highest monthly revenues

### Customer and Regional Revenue

### Product Performance

## Recommendations

## Limitations
- Sales data in both of the years 2010 and 2014 are incomplete, which have contributed to lower sales figures, inflated net profit margins, and innacurate year-over-year growth percentages for their preceding and/or following years
- Some of the order date data and the customer demographic data were null or blank values, and there is no reliable source of truth to fill in those blanks


FlexiMart Data Architecture Project
Student Name: Lakshmi Varnika Kandala Student ID: [bitsom_ba_25071987]
Email: [lakshmivarnika16@gmail.com]
Date: 7th January 2026

Project Overview
This project implements an end-to-end data architecture solution for the FlexiMart retail system. It covers relational database ETL processing, NoSQL data handling using MongoDB, and a data warehouse built using a star schema for OLAP analytics. The project demonstrates data integration, transformation, and analytical querying for business insights.

Repository Structure
├── data/ │ ├── customers.csv │ ├── products.csv │ ├── product_catalog.csv │ └── sales.csv │ ├── part1-database-etl/ │ ├── etl_pipeline.py │ ├── schema_documentation.md │ ├── business_queries.sql │ └── data_quality_report.txt │ ├── part2-nosql/ │ ├── nosql_analysis.md │ ├── mongodb_operations.js │ └── products_catalog.json │ ├── part3-datawarehouse/ │ ├── star_schema_design.md │ ├── warehouse_schema.sql │ ├── warehouse_data.sql │ └── analytics_queries.sql │ └── README.md

Technologies Used
Python 3.x (pandas, mysql-connector-python)
MySQL 8.0
MongoDB 6.0
SQL (OLAP & Analytics)
VS Code
Setup Instructions
Database Setup
# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql


mongosh < part2-nosql/mongodb_operations.js


Key Learnings

This project improved my understanding of ETL pipeline design, relational and NoSQL database integration, and data warehousing concepts. I learned how to design a star schema, write OLAP analytical queries, and perform customer and product analysis. It also strengthened my skills in SQL optimization, data quality validation, and documentation.



Challenges Faced

1-Handling data inconsistencies during ETL – Resolved by applying data validation and cleaning rules.
2-Designing correct OLAP aggregations – Solved by using proper GROUP BY logic and window functions.

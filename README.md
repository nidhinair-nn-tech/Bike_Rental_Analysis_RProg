# Bike Rental Analysis (R Programming)

## Project Overview

This project explores the Capital Bikeshare dataset to understand and predict factors influencing daily bike rental demand in Washington D.C. Using R, we performed data preprocessing, exploratory analysis, statistical modeling, and hypothesis testing to extract actionable insights.

## Dataset

- **Source**: [UCI Machine Learning Repository – Bike Sharing Dataset](https://archive.ics.uci.edu/dataset/275/bike+sharing+dataset)  
- **Time Period**: January 1, 2011 – December 31, 2012  
- **Format**: Daily aggregated data from Washington D.C.’s Capital Bikeshare system

## Objectives

1. Identify which factors significantly influence daily bike rentals.
2. Determine whether average daily rentals differ between weekdays and weekends.

## Methodology

- **Data Preparation**: Loaded and cleaned the dataset using R. Derived a new feature to classify days as "Weekday" or "Weekend".
- **Exploratory Data Analysis**: Performed distribution and correlation analysis using visualizations and summary statistics.
- **Statistical Modeling**: Built a multiple linear regression model with rental count as the dependent variable.
- **Hypothesis Testing**: Conducted a t-test to compare rentals between weekdays and weekends.

## Key Findings

- Temperature had a strong positive impact on bike rentals.
- Humidity and windspeed negatively affected rental demand.
- Season and weather conditions were significant predictors.
- While weekday rentals were numerically higher than weekends, the difference was not statistically significant (p = 0.326).

## Tools and Technologies

- **Programming Language**: R  
- **Libraries Used**: ggplot2, dplyr, tidyverse  
- **Techniques**: Linear regression, correlation matrix, t-tests, data visualization

## Files in This Repository

- `Bike.R` – R script for data import, analysis, and modeling
- `INFO6105.36949_NidhiNair_final_project_pr...` – Final project submission document
- `DSEM-Final.pdf` – Full project report with analysis and insights

## Conclusion and Recommendations

- Temperature is the most influential factor in predicting bike rental demand.
- Marketing and promotional strategies should focus on low-demand seasons or days with poor weather conditions.
- Integrating bike-sharing services with other forms of public transport could help mitigate effects of poor weather and maintain ridership.

## Author

**Nidhi Nair**  
Graduate Student, Northeastern University  
INFO6105: Data Science and Engineering Methods  

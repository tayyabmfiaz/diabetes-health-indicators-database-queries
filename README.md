# Diabetes Health Indicators Database

**Course:** INST327, Fall 2025 | Name: Tayyab Fiaz

## Overview
This project designs and implements a relational MySQL database built from the CDC's Diabetes Health Indicators dataset. The database normalizes raw survey data into 8 related
tables and uses stored procedures, functions, and views to analyze how demographics, health behaviors, vitals, and healthcare access relate to diabetes outcomes.

## Database Schema
The database consists of 8 normalized tables:
- `Patient` — core patient records and diabetes status
- `Demographics` — age, income, education, sex
- `Vitals` — BMI and blood pressure
- `Health_Behaviors` — smoking, physical activity, fruit/veggie consumption
- `Healthcare_Access` — insurance coverage and doctor visits
- `Self_Reported_Health` — physical and mental unhealthy days
- `Clinical_Conditions` — heart disease, high BP, cholesterol
- `Screening` — cholesterol check history

## Stored Procedures
- `diabetes_by_age_range(min_age, max_age)` — returns diabetic count and percentage by age group within a given range
- `no_healthcare_diabetes_summary()` — returns diabetes rate among patients with no healthcare coverage

## Functions
- `fruit_veg_diabetes_percentage()` — returns diabetes rate among patients who eat fruits and vegetables daily
- `avg_diabetic_physical_unhealthy_days()` — returns average physically unhealthy days reported by diabetic patients

## Views
- `diabetes_population` — overall diabetes prevalence
- `average_bmi` — compares average BMI overall vs. diabetic patients
- `diabetes_by_income` — diabetes rate broken down by income level
- `smoker_diabetes_distribution` — prediabetic and diabetic counts among smokers

## Data Source
CDC Diabetes Health Indicators Dataset via Kaggle

## Tools
MySQL · MySQL Workbench · Microsoft Excel 

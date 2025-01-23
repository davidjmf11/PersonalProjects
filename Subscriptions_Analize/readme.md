# Introduction
This project aims to analyze subscription sales data provided in a JSON format to derive actionable insights that can impact Nexar's business decisions and productivity. The analysis is divided into two main challenges: cleaning and aggregating the data to extract key sales metrics and proposing meaningful analyses based on the dataset to provide strategic insights.
All data processing and analyses will be conducted using Google BigQuery, a powerful cloud-based platform for managing and analyzing large datasets. BigQuery's scalability and SQL-based querying capabilities make it an ideal choice for this assignment, ensuring efficient and accurate data handling.
The project deliverables include:
1. A cleaned and processed dataset with monthly subscription sales figures.
2. Proposed analyses, including one detailed analysis with results and insights.
3. Visualizations created using Looker Studio, leveraging BigQuery as the data source.
This structured approach will ensure clarity, accuracy, and actionable results, showcasing critical thinking, data-handling skills, and alignment with Nexar’s culture of data-driven decision-making.

## Data Analysis.sql 
### Duplicates and missing Data
The initial step in analyzing the data was to check for duplicate values. Since the ID column serves as the dataset's primary key, it was selected to ensure no duplicate rows were present.
The second step was to ensure that the columns required for the final table had all the values needed.
Both analyses returned zero results, indicating no duplicates or missing data.

![image](https://github.com/user-attachments/assets/74763ca4-4028-473c-a2d4-fa2d3e55a6ed)


### Total Monthly Revenue = 0$
  This analysis focused on identifying cases where subscriptions had a quantity of 1. To achieve this, a temporary table was first created to isolate data for the relevant months. Subsequently, the second part of the query retrieved all subscriptions during those specific months.
With this, it is possible to understand if there are errors in the data or inconsistencies.
![image](https://github.com/user-attachments/assets/e324fb18-4f3d-4ced-9792-468deb0d689f)

### Average Monthly Revenue under 3$
  Reviewing a sample of 100 rows revealed several subscriptions with notably low unit amounts, prompting an investigation into how many months had an average subtotal per quantity below $3. Typically, subscription fees end at .99 cents, reflecting standard pricing strategies. However, exceptions to this pattern stood out, raising questions about possible pricing inconsistencies or unique cases such as promotional offers.
  ![image](https://github.com/user-attachments/assets/7c5c7add-70f8-4e9a-8859-6be8d7ca3985)

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

### Results 
In both analyses 1 and 2, certain rows stood out as potential outliers. Specifically, unit costs ranging between $0 and $3 are unusual for this type of subscription. However, the majority of these cases occurred in the earlier years. Given this observation, and in the absence of a dataset dictionary, it was inferred that these subscriptions might represent trials or another specific category.
In the third analysis, there was a name that caught attention, ‘testdelayedcharge’. Since it has only one observation it will not be considered relevant.
After careful consideration, it was decided not to remove any rows from the original dataset to preserve the integrity of the analysis.

For this table, the subscription creation date was used to attribute the total revenue generated for that month, along with the total count of subscriptions created during the same period.
These were the columns used because it was assumed that the monthly subscriptions sales figures are the new subscriptions made in each month and for the total revenue the subtotal that was charged in the same period. This way we can see the number of new subscriptions and the new revenue generated with them.

It is possible to see the complete table in the folder

![image](https://github.com/user-attachments/assets/e8353183-a629-4825-bf19-cc2aa22b861e)

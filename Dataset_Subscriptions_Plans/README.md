# Introduction
This project aims to analyze subscription sales data provided in a JSON format to derive actionable insights that can impact business decisions and productivity. The analysis is divided into two main challenges: cleaning and aggregating the data to extract key sales metrics and proposing meaningful analyses based on the dataset to provide strategic insights.
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

It is possible to see the complete table in the folder, Monthly Subscriptions Sales

![image](https://github.com/user-attachments/assets/e8353183-a629-4825-bf19-cc2aa22b861e)

## Customer Engagement Analysis 
All the code for this analysis is in the file Customer_engagement_queries.sql

Objective:
- Analyse data to understand how customers engage with their subscription plans.
Value:
- Understanding how customers interact with subscription plans can reveal areas where customers find value or struggle.
- Recognizing active users and their preferences enables personalized sales strategies to offer more products and services.
Actions:
- Offer tailored promotions and upselling opportunities based on subscription engagement patterns.
- Educate customers on features they’re not using through onboarding materials, webinars, or email campaigns.

### Number of subscriptions by plan with over a year of usage
The initial approach to improving customer engagement is to evaluate the satisfaction levels associated with the company’s offered plans. Understanding how satisfied clients are with the plans they choose provides valuable insights into their preferences and loyalty. To analyze this key performance indicator (KPI), a specific metric was defined: customers must have maintained a subscription to a plan for a minimum of one year.
This metric serves as a partial measure of customer satisfaction, reflecting their long-term commitment to the plan. Additionally, it offers a basis for identifying opportunities to enhance other plans by analyzing the features of the most popular and frequently used plans. This understanding helps guide improvements tailored to customer needs and preferences, ultimately fostering higher engagement and satisfaction.

![image](https://github.com/user-attachments/assets/87e9892a-ed7f-4b2e-a2d3-09a7f9d530fe)

Based on these results, in addition to the plans with an average subscription duration of 12 months, it is evident that the "Nexar Fleets – 3 years" plan stands out as the most consistent. All seven subscriptions to this plan were successfully maintained for the full three years, demonstrating strong customer commitment and satisfaction.
On the other hand, the 2-year plan requires improvement. A significant number of users, despite committing to the plan for the first year, fail to complete the second. This trend highlights a potential issue with the plan's features or perceived value, suggesting the need for adjustments to better meet customer expectations and encourage longer retention. Addressing this gap could enhance the overall performance and appeal of the 2-year plan.

### Analysis of the plans that increased his fees and the rate of new subscriptions

The second insight focuses on analyzing the impact of fee increases across various plans. This analysis began by identifying the plans that experienced a price change, followed by examining the number of new subscriptions associated with each plan under its different fee structures.
While price increases are a standard aspect of business operations over time, significant hikes can deter customers from subscribing. For this reason, it is essential to evaluate the differences between fee levels to understand their influence on customer behavior. Although the timing of fee implementations is another crucial factor in such analyses, it was not considered here due to the unavailability of relevant data.

![image](https://github.com/user-attachments/assets/7f554f10-9f10-4218-8f0a-b47ca087dd16)

This result is particularly insightful: in half of the cases, a price increase led to a decrease in subscriptions. This outcome could suggest that raising prices without adding new features or value to the plan may deter users who are unwilling to pay more for the same offering.
Interestingly, two plans saw a significant rise in subscriptions despite the higher fees. One possible explanation for this could be a factor not included in the analysis—the duration for which each fee was available. The timing of the fee implementation may have played a role in influencing customer behavior, but further data would be needed to confirm this hypothesis.

### Cancelled subscription by Month
This insight focuses on identifying the months with the highest number of canceled subscriptions. For this analysis, only the months were considered, excluding the year as a factor. This information provides an opportunity to develop targeted strategies during high-cancellation periods to better engage users and encourage them to maintain their subscriptions.
The data reveals that March experiences more than double the cancellations compared to other months. This presents a clear opportunity to implement marketing campaigns or introduce simple app features designed to enhance user engagement and retention during this critical time. By addressing this trend proactively, the company can work to reduce cancellations and strengthen customer loyalty.

![image](https://github.com/user-attachments/assets/2f1372fa-8d48-47f9-9ee1-618337312b1b)

### Monthly Active Subscriptions
The metric "Monthly Active Subscriptions" is a crucial indicator for understanding the health and performance of a subscription-based business. It provides a clear measure of the total number of active subscriptions at the end of each month, offering insights into customer retention, growth trends, and overall engagement with the company’s offerings.
Tracking monthly active subscriptions enables the identification of both short-term fluctuations and long-term trends. For instance, a consistent increase in this metric signals successful customer acquisition and retention strategies, while a decline may indicate churn issues or a loss of customer interest. It also helps evaluate the impact of business decisions, such as pricing adjustments, promotional campaigns, or product enhancements, on customer engagement over time.
To support deeper analysis, a table summarizing monthly active subscriptions has been created and loaded into Looker Studio and downloaded in the GDrive Folder. This will enable visualization and detailed exploration of the metric within the report, providing actionable insights to guide strategic decisions and optimize business outcomes.

The code for this analysis is in the code Monthly Active Subscriptions.sql. 

The results from this query will be analyze in the dashboard created in the next step. 

# Relevant Visualizations and Insights

![image](https://github.com/user-attachments/assets/faec7a1a-28f2-4112-a73a-651412857bf4)

It's possible to use the dashboard in the following link:
https://lookerstudio.google.com/reporting/115982a4-9468-4f60-b959-e77ce16362ee


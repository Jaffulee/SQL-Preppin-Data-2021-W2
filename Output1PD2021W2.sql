--Use regex to grab text from model
SELECT REGEXP_SUBSTR(w22021.model,'[A-Z]+') AS brand
    ,bike_type
    ,SUM(value_per_bike) AS ORDER_VALUE
    ,SUM(QUANTITY) AS QUANTITY_SOLD
    ,ROUND(AVG(value_per_bike),1) as AVERAGE_BIKE_VALUE_SOLD_BY_BRAND_TYPE


FROM PD2021_WK02_BIKE_SALES AS w22021
GROUP BY brand, bike_type;

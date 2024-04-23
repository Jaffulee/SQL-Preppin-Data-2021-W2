--Use regex to grab text from model
SELECT REGEXP_SUBSTR(w22021.model,'[A-Z]+') AS brand
    ,w22021.bike_type
    ,SUM(w22021.value_per_bike) AS ORDER_VALUE
    ,SUM(w22021.QUANTITY) AS QUANTITY_SOLD
    ,ROUND(AVG(w22021.value_per_bike),1) as AVERAGE_BIKE_VALUE_SOLD_BY_BRAND_TYPE


FROM PD2021_WK02_BIKE_SALES AS w22021
GROUP BY brand, w22021.bike_type

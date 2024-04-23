--Written in Snowflake 

--Use regex to grab text from model
SELECT REGEXP_SUBSTR(w22021.model,'[A-Z]+') AS brand
    ,w22021.store
    ,SUM(w22021.value_per_bike) AS TOTAL_ORDER_VALUE
    ,SUM(w22021.QUANTITY) AS TOTAL_QUANTITY_SOLD
    --Convert to date and calculate difference
    ,ROUND(
    AVG(
    DATEDIFF(
    'day'
    ,TO_DATE(w22021.order_date,'dd/mm/yyyy')
    ,TO_DATE(w22021.shipping_date,'dd/mm/yyyy')
    )
    )
    ,1) as AVG_DAYS_TO_SHIP


FROM PD2021_WK02_BIKE_SALES AS w22021
GROUP BY brand, w22021.store

with CTE AS (
    SELECT 
    STARTED_AT ,
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT_TIMESTAMP,
     DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
     HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,

     {{day_type('STARTED_AT')}} AS DAY_TYPE,

   {{ get_session('STARTED_AT')}} AS STATION_OF_YEAR


    FROM 
    {{ source('demo', 'bike') }}
    WHERE STARTED_AT != 'started_at'
)
select * from CTE
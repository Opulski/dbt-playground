
-- Use the `ref` function to select from other models
{{ config(materialized='table') }}


select md5(Company_Name) as id, avg(Normalized_EBITDA) as AVG_Normalized_EBITDA, Company_Name
from {{ ref('income_statements') }} 
group by Company_Name 

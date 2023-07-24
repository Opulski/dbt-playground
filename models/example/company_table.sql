
-- Use the `ref` function to select from other models
{{ config(materialized='table') }}

with staging_data as (
    select distinct
    Company_Name,
    Address,
    Full_Time_Employees
    from {{ ref('income_statements') }} 
)

select md5(Company_Name) as id, Company_Name,
    Address,
    Full_Time_Employees
from staging_data
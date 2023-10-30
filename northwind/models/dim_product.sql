with stg_products as (
    select * from {{source('northwind','Products')}}
),
stg_categories as (
    select * from {{source('northwind','Categories')}}
)
select {{ dbt_utils.generate_surrogate_key(['stg_products.productid']) }} as Productkey,
    stg_products.productid, stg_products.productname, stg_products.supplierid, stg_categories.categoryname, stg_categories.description
from stg_products 
    left join stg_categories  on stg_products.categoryid = stg_categories.categoryid
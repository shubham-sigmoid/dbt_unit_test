{{
  config(
        materialized="incremental", 
        unique_key="Id"

  )
}}



SELECT customer.id,
    customer.name, 
    contact.city
FROM {{ source_for_test('snowflake', 'customer') }} customer
    LEFT JOIN {{ source_for_test('snowflake', 'contact') }} contact ON customer.id = contact.id


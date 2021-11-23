SELECT DISTINCT  
    id,
    UPPER(ref) AS ref,
    UPPER(login) AS login,
    UPPER(transaction_type) AS transaction_type,
    FORMAT("%'.2f", CAST(amount AS float64)) AS amount,
    FORMAT("%'.2f", CAST(amount_before AS float64)) AS amount_before,
    FORMAT("%'.2f", CAST(amount_after AS float64)) amount_after,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", created_date) AS created_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(created_date, 'Africa/Nairobi')) AS created_date_kenya,
    UPPER(created_by_name) AS created_by_name ,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", last_modified_date) AS last_modified_date,
    FORMAT_DATE("%Y-%m-%d %H:%M:%S", DATETIME(last_modified_date, 'Africa/Nairobi')) AS last_modified_date_kenya,
    UPPER(last_modified_by_name) AS last_modified_by_name
FROM `kyosk-prod.inventory.tbl_transaction`;
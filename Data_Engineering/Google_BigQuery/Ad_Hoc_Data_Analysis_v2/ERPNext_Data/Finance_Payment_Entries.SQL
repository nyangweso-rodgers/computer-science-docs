with
payment_entry_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.payment_entry`
                            ),
payment_entries as (
                    SELECT distinct posting_date,
                    reference_date,
                    driver,
                    party,
                    kyosk_sales_order,
                    name as payment_entry,
                    payment_reference,
                    reference_no,
                    paid_amount,
                    received_amount,
                    unallocated_amount
                    FROM payment_entry_with_index 
                    WHERE index = 1 
                    and posting_date = '2022-05-24'
                    order by driver, party
                    )
select * from payment_entry_with_mpesa
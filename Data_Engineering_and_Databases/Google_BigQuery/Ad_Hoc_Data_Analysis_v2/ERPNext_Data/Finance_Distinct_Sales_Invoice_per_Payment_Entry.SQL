  with
  sales_invoice_with_index as (
                              SELECT *, 
                              row_number()over(partition by name order by modified desc) as index 
                              FROM `kyosk-prod.erp_reports.sales_invoice`
                              ),
  payment_entry_with_index as (
                              SELECT *, 
                              row_number()over(partition by name order by modified desc) as index 
                              FROM `kyosk-prod.erp_reports.payment_entry`
                              ),
  sales_invoice_with_items as (
                               SELECT distinct si.posting_date,
                               si.territory,
                               si.customer,
                               si.customer_name,
                               si.name as sales_invoice,
                               sii.sales_order,
                               sii.delivery_note,
                               si.kyosk_order_type,
                               si.status,
                               si.grand_total
                               FROM sales_invoice_with_index si
                               cross join unnest(items) sii
                               where index = 1
                               order by posting_date, sales_invoice
                               ),
  payment_entries as (
                        SELECT distinct posting_date,
                        reference_date,
                        driver,
                        party,
                        kyosk_sales_order as sales_order,
                        name as payment_entry,
                        payment_reference,
                        reference_no,
                        paid_amount,
                        received_amount,
                        unallocated_amount
                        FROM payment_entry_with_index 
                        WHERE index = 1 
                        order by driver, party
                      ),
  /*
  sales_invoices_with_advances as (
                                    select distinct si.name as sales_invoice,
                                    si.posting_date,
                                    date(a.creation) as creation_date_for_advance,
                                    a.reference_name,
                                    a.allocated_amount
                                    from sales_invoice_with_index si
                                    cross join unnest(advances) a
                                    ),
  */
  distinct_sales_invoice_per_payment_entry as (
                                                select siwi.*, 
                                                count(distinct payment_reference) as count_of_payment_reference, 
                                                sum(paid_amount) as paid_amount,
                                                string_agg(distinct party, "/" order by party) as party,
                                                string_agg(distinct driver, "/" order by driver) as driver,
                                                string_agg(distinct payment_reference, "/" order by payment_reference) as payment_reference,
                                                sum(paid_amount) - grand_total as variance,
                                                from sales_invoice_with_items siwi
                                                left join payment_entries pe on siwi.sales_order = pe.sales_order
                                                where FORMAT_DATE('%Y%m%d', siwi.posting_date) between @DS_START_DATE and @DS_END_DATE
                                                --where siwi.posting_date = '2022-06-04'
                                                group by 1,2,3,4,5,6,7,8,9,10 order by sales_invoice
                                                )
  select *, case 
                 when variance > 0 then 'OVERPAYMENT'
                 when variance = 0 then 'ZERO-VARIANCE'
                 else 'UNDERPAYMENT' end as payment_status
  from distinct_sales_invoice_per_payment_entry
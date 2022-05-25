with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
sales_invoice_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.sales_invoice`
                            ),
delivery_note_with_original_items as (
                                      select distinct dn.posting_date,
                                      dn.territory,
                                      dn.customer,
                                      dn.customer_name,
                                      dn.kyosk_sales_order as sales_order,
                                      dn.name as delivery_note,
                                      dn.kyosk_order_type,
                                      dn.workflow_state,
                                      dn.driver,
                                      dn.driver_name,
                                      sum(odni.amount) as amount_of_sales_order
                                      from delivery_note_with_index dn
                                      cross join unnest(original_items) odni
                                      where index = 1
                                      --and dn.workflow_state in ('PAID')
                                      group by 1,2,3,4,5,6,7,8,9,10
                                      ),
delivery_note_with_items as (
                              select distinct dn.kyosk_sales_order as sales_order,
                              dn.name as delivery_note,
                              sum(dni.amount) as amount_of_paid_delivery_note
                              from delivery_note_with_index dn
                              cross join unnest(items) dni
                              where index = 1
                              and dn.workflow_state in ('PAID')
                              group by 1,2
                              ),
sales_invoice_with_items as (
                             SELECT distinct si.name as sales_invoice,
                             sii.sales_order,
                             sum(sii.amount) as amount_of_sales_invoice,
                             FROM sales_invoice_with_index si
                             cross join unnest(items) sii
                             where index = 1
                             group by 1,2
                             ),
driver_delivery_visibility_report as (
                                       select distinct dnwoi.driver,
                                       dnwoi.driver_name,
                                       dnwoi.sales_order,
                                       dnwoi.delivery_note,
                                       siwi.sales_invoice,
                                       dnwoi.workflow_state,
                                       dnwoi.kyosk_order_type,
                                       dnwoi.customer,
                                       dnwoi.customer_name,
                                       dnwoi.territory,
                                       dnwoi.posting_date,
                                       amount_of_sales_order,
                                       coalesce(amount_of_paid_delivery_note,0) as amount_of_paid_delivery_note,
                                       amount_of_sales_order - coalesce(amount_of_paid_delivery_note,0) as amount_variance,
                                       coalesce(amount_of_sales_invoice, 0) as amount_of_sales_invoice
                                       from delivery_note_with_original_items dnwoi
                                       left join delivery_note_with_items dnwi on dnwoi.sales_order = dnwi.sales_order
                                       left join sales_invoice_with_items siwi on dnwoi.sales_order = siwi.sales_order
                                       )
select * from driver_delivery_visibility_report 
where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
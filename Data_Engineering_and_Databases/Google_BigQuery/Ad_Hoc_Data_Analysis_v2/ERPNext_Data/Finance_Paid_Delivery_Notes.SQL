with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_items as (
                              select distinct dn.posting_date,
                              dn.territory,
                              dn.sales_partner,
                              dn.kyosk_sales_order as sales_order,
                              dn.name as delivery_note,
                              dn.driver,
                              dn.driver_name,
                              dn.customer,
                              dn.customer_name,
                              dni.item_group,
                              dni.name,
                              dni.item_name,
                              dni.item_code,
                              dni.uom,
                              dni.qty,
                              dni.rate,
                              dni.price_list_rate,
                              dni.discount_amount,
                              dni.amount,
                              from delivery_note_with_index dn
                              cross join unnest(items) dni
                              where index = 1
                              and dn.workflow_state in ('PAID')
                              )
select * from delivery_note_with_items where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
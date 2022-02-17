with
sales_order as (
                  select distinct so.name,
                  so.territory,
                  so.transaction_date,
                  so.delivery_date
                  from `kyosk-prod.erp_reports.sales_order` so
                  cross join unnest(items) i
                  ),
delivery_note as (
                    select distinct dn.posting_date,
                    dn.name,
                    oi.against_sales_order,
                    workflow_state,
                    oi.modified,
                    oi.amount
                    FROM `kyosk-prod.erp_reports.delivery_note` dn
                    cross join unnest(original_items) oi
                    order by 5 desc
                    ),
sales_order_delivery_note_mashup as (
                                      select so.transaction_date, 
                                      so.delivery_date,
                                      so.name as sales_order,
                                      so.territory,
                                      count(distinct dn.name) as delivery_note_count,
                                      string_agg(distinct dn.name, "/" order by dn.name) as delivery_notes,
                                      string_agg(distinct workflow_state, "/" order by workflow_state) as workflow_states,
                                      sum(dn.amount) as duplicated_amount
                                      from sales_order so
                                      left join delivery_note dn on so.name = dn.against_sales_order
                                      --where so.name = 'SAL-ORD-KIS0IHK'
                                      group by 1,2,3,4
                                      )
select * from sales_order_delivery_note_mashup
where FORMAT_DATE('%Y%m%d', transaction_date) between @DS_START_DATE and @DS_END_DATE 
and delivery_note_count >= 2
order by 5 desc
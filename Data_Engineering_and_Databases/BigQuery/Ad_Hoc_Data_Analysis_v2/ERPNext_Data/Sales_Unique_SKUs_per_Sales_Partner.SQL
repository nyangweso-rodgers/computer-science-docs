with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_items as (
                              select distinct dn.posting_date,
                              dn.company,
                              dn.territory,
                              dn.sales_partner,
                              dn.customer,
                              dni.item_group,
                              dni.item_code,
                              dni.uom,
                              sum(dni.amount) as amount,
                              from delivery_note_with_index dn
                              cross join unnest(items) dni
                              where index = 1
                              and dn.workflow_state in ('PAID')
                              group by 1,2,3,4,5,6,7,8
                              ),
unique_skus_per_sales_partner_report as (
                                          select distinct sales_partner,
                                          company,
                                          string_agg(distinct territory, "/" order by territory) as territory,
                                          count(distinct posting_date) as count_of_posting_dates,
                                          count(distinct customer) as count_of_customers,
                                          sum(amount) as revenue,
                                          count(distinct item_code) as count_of_item_code
                                          from delivery_note_with_items
                                          --where posting_date between '2022-06-01' and '2022-06-14' 
                                          --and sales_partner = 'ABEL SAVI' and 
                                          where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
                                          group by 1,2
                                          )
select * from unique_skus_per_sales_partner_report 
order by count_of_item_code desc
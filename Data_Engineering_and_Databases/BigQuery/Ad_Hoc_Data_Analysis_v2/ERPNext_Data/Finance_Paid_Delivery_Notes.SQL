with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note` 
                            where territory not in ('Kyosk HQ')
                            and workflow_state in ('PAID')
                            ),
regional_mapping as (SELECT * FROM `kyosk-prod.erp_reports.upload_regional_mapping`),
delivery_note_with_items as (
                              select distinct dn.posting_date,
                              format_time("%R", dn.posting_time) as posting_time,
                              dn.company,
                              dn.territory,
                              dn.sales_partner,
                              dn.kyosk_sales_order as sales_order,
                              dn.name as delivery_note,
                              dn.created_on_app,
                              dn.driver,
                              dn.driver_name,
                              dn.customer,
                              dn.customer_name,
                              dni.item_group,
                              case 
                                when dni.item_code in ( 'Ajab Maize Flour 1KG BALE (24.0 PC)',
                                                        'Ajab Maize Flour 2KG BALE (12.0 PC)', 
                                                        'Ajab Wheat Flour 1KG BALE (24.0 PC)',
                                                        'Ajab Wheat Flour 2KG BALE (12.0 PC)',
                                                        'Ajab Wheat Flour 500G BALE (24.0 PC)',
                                                        'Umi Maize Flour 1KG BALE (24.0 PC)',
                                                        'Umi Maize Flour 2KG BALE (12.0 PC)',
                                                        'Umi Wheat Flour 1KG BALE (24.0 PC)',
                                                        'Umi Wheat Flour 2KG BALE (12.0 PC)'
                                                        ) then 'GRAIN INDUSTRIES LIMITED'
                                  else 'Other Supplier' end as supplier_name,
                              dni.name,
                              dni.item_name,
                              dni.item_code,
                              dni.uom,
                              dni.qty,
                              dni.rate,
                              dni.price_list_rate,
                              dni.discount_amount,
                              dni.amount,
                              rm.*except(id, territory, company)
                              from delivery_note_with_index dn
                              cross join unnest(items) dni
                              left join regional_mapping rm on dn.territory = rm.territory
                              where index = 1
                              )
select * from delivery_note_with_items 
where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
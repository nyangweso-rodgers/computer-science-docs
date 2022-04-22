with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_items as (
                              SELECT distinct dn.posting_date ,
                              dn.territory,
                              dn.name as delivery_note,
                              i.against_sales_order as sales_order,
                              dn.workflow_state,
                              i.item_group,
                              i.item_name as delivery_note_item_item_name,
                              i.name as delivery_note_item_name,
                              i.item_code,
                              i.uom,
                              i.conversion_factor as delivery_note_conversion_factor,
                              i.qty as qty_delivery_note,
                              i.price_list_rate,
                              i.discount_amount,
                              i.rate,
                              i.net_rate,
                              i.rate - i.net_rate as calculated_vat_amount,
                              round(safe_divide((1 - i.net_rate), i.rate),3) as calculated_vat_rate,
                              i.amount as delivery_note_amount,
                              i.net_amount as delivery_note_net_amount,
                              FROM delivery_note_with_index dn
                              cross join unnest(items) i
                              where index = 1
                              and workflow_state in ('PAID', 'DELIVERED')
                              --and dn.name = 'MAT-DN-2022-109974'
                              ),
delivery_note_with_packed_items as (
                                    select distinct dn.posting_date,
                                    dn.name as delivery_note,
                                    pi.parent_detail_docname,
                                    pi.item_name as packed_item_item_name,
                                    pi.uom as packed_item_uom,
                                    pi.conversion_factor as packed_item_conversion_factor,
                                    pi.qty as packed_item_qty,
                                    pi.projected_qty as packed_item_projected_qty,
                                    pi.actual_qty as packed_item_actual_qty,
                                    pi.incoming_rate,
                                    pi.qty * pi.incoming_rate as packed_item_amount
                                    from delivery_note_with_index dn
                                    cross join unnest(packed_items) pi
                                    where index = 1
                                    ),
delivery_note_mashup as (
                          select dnwi.*, 
                          dnwpi.*except(posting_date, delivery_note),
                          dnwi.delivery_note_net_amount - dnwpi.packed_item_amount as gross_margin,
                          safe_divide((dnwi.delivery_note_net_amount - dnwpi.packed_item_amount), dnwpi.packed_item_amount) as gross_margin_percent
                          from delivery_note_with_items dnwi
                          left join delivery_note_with_packed_items dnwpi on dnwi.delivery_note_item_name = dnwpi.parent_detail_docname
                          --where dnwi.posting_date = '2022-03-30' 
                          --and item_group = 'Maize Flour'
                          --sales_order in  ('SAL-ORD-THIENCA', 'SAL-ORD-THI8FWV','SAL-ORD-THI5YC7') and 
                          )
select *  from delivery_note_mashup
where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
order by sales_order, delivery_note, item_code, uom
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
                              i.qty as qty_delivery_note,
                              i.price_list_rate,
                              i.discount_amount,
                              i.rate,
                              i.amount as delivery_note_amount
                              FROM delivery_note_with_index dn
                              cross join unnest(items) i
                              where index = 1
                              and workflow_state in ('DELIVERED', 'PAID')
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
                                    pi.actual_qty as packed_item_actual_qty
                                    from delivery_note_with_index dn
                                    cross join unnest(packed_items) pi
                                    where index = 1
                                    --and dn.name = 'MAT-DN-2022-109974'
                                    ),
delivery_note_mashup as (
                          select dnwi.*, 
                          dnwpi.*except(posting_date, delivery_note)
                          from delivery_note_with_items dnwi
                          left join delivery_note_with_packed_items dnwpi on dnwi.delivery_note_item_name = dnwpi.parent_detail_docname
                          )
select * from delivery_note_mashup
where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
--where posting_date = '2022-03-17' 
order by sales_order, delivery_note, item_code, uom
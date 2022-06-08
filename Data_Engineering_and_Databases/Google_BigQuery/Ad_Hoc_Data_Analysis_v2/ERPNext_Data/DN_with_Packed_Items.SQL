with
delivery_note_with_index as (
                            SELECT *, 
                            row_number()over(partition by name order by modified desc) as index 
                            FROM `kyosk-prod.erp_reports.delivery_note`
                            ),
delivery_note_with_packed_items as (
                                    select distinct dn.posting_date,
                                    dn.name as delivery_note,
                                    dn.sales_order,
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
                                    and workflow_state in ('DELIVERED', 'PAID')
                                    --and dn.name = 'MAT-DN-2022-109974'
                                    order by sales_order, delivery_note, item_code, uom
                                    )

select * from delivery_note_with_packed_items
where FORMAT_DATE('%Y%m%d', posting_date) between @DS_START_DATE and @DS_END_DATE
SELECT * FROM `kyosk-prod.inventory_v2.fed_scheduled_sale_item_report_v2` 
where FORMAT_DATE('%Y%m%d', completed_date_kenya) between @DS_START_DATE and @DS_END_DATE 
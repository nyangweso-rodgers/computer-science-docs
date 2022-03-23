with
dates as (
              SELECT * FROM  UNNEST(GENERATE_DATE_ARRAY('2021-11-01',date_add(CURRENT_DATE(),interval 31 day), INTERVAL 1 DAY)) AS date
              ),
-- Outlines sales days          
daily_sale_days as (select *,date_trunc(date,week) as week from dates where FORMAT_DATE('%A',date) <> 'Sunday' ) , 
vars AS (
  SELECT PARSE_DATE('%Y%m%d', @DS_START_DATE) as current_start_date, PARSE_DATE('%Y%m%d', @DS_END_DATE) as current_end_date ),
  --SELECT DATE '2022-01-01' as current_start_date, DATE '2022-01-31' as current_end_date ),
date_vars as (
               select *,
                       date_trunc(current_start_date,month) as start_month,
                       DATE_SUB(DATE_TRUNC(DATE_ADD(current_end_date, INTERVAL 1 MONTH), MONTH), INTERVAL 1 DAY) as end_month 
                       from vars
                       ),
sales_agents_monthly_revenue_targets as (
                            SELECT distinct agent_login, start_date, 
                            sum(monthly_target) as monthly_target
                            FROM `kyosk-prod.inventory_v2.uploaded_sales_agents_daily_and_monthly_targets`,date_vars
                            where start_date between start_month and end_month
                            group by 1,2
                            ),
completed_ops_item_report as (
                                select 
                                distinct completed_date_kenya,
                                service_zone_name,
                                agent_login,
                                agent_name,
                                kyosk_code,
                                catalog_sku,
                                catalog_name,
                                catalog_packaging,
                                sum(delivered_catalog_amount) as delivered_catalog_amount
                                from `kyosk-prod.inventory_v2.fed_scheduled_ops_item_report_v2_completed_date` 
                                where status = 'Completed' and agent_login is not null and completed_date_kenya >= '2022-01-01' and agent_login not in ('ayumba.onguko@kyosk.app')
                                group by 1,2,3,4,5,6,7,8
                                ),
daily_report_with_updated_agent_login_and_catalog_sku as (
                                select 
                                distinct completed_date_kenya,
                                kyosk_code,
                                service_zone_name,
                                case 
                                    when agent_login = '34270825' then '28630155' 
                                    when agent_login = '254711396184' then 'akinyimercy636@gmail.com' 
                                    when agent_login = '254743807659' then 'meubrian46@gmail.com'
                                    when agent_login = '254715555418' then 'gikarujeffercy@gmail.com'
                                    when agent_login = 'evalinemakori2@gmail.com' or agent_login = 'evalinemakori0@gmail.com' then 'kemuntoevaline307@gmail.com'
                                    when agent_login = 'adamseustace0@gmail.com' then 'adamseustace390@gmail.com'
                                    when agent_login = 'vincentotieno567@gmail.com' then 'vincentotieno2800@gmail.com'
                                    when agent_login = 'absolomkaranja@gmail.com' then '29715909'
                                    when agent_login = 'mishlihabi@gmail.com' then 'lihabimitchelle@gmail.com'
                                    when agent_login = 'danielligami17@gmail.com' then 'danielligami85@gmail.com'
                                    when agent_login = 'kmulandi123@gmail.com' then 'jmulandi123@gmail.com'
                                    when agent_login = 'jangara27.19@gmail.com' then 'belindajangara82@gmail.com'
                                    when agent_login = '254711725288' then '35618339'
                                    when agent_login = 'reginahwanjiru761@gmail.com' then 'wanjiruregina761@gmail.com'  when agent_login = '33490100' then 'wanjiruregina761@gmail.com' 
                                else agent_login end as agent_login,
                                agent_name,
                                case 
                                    when catalog_sku ='INVHRO9-SU' then 'INVDA6E-CI' 
                                    when catalog_sku = 'INVBWEI-TP' and catalog_packaging = 'Dozen'  then 'INVBWEI-XE'
                                    when catalog_sku = 'INVBWEI-VR' then 'INVBWEI-XE'
                                    when catalog_sku = 'INV7QWF-1Q' and catalog_packaging = 'Outer' then 'INV7QWF-SM'
                                    when catalog_sku = 'INV0YA4-1O' then 'INV0YA4-BI'
                                    when catalog_sku = 'INVF33L-CX' then 'INVF33L-QQ'
                                    when catalog_sku = 'INVTGYL-7V' then 'INVTGYL-SP'
                                    when catalog_sku = 'INVX7OG-RR' then 'INVX7OG-UL'
                                    when catalog_sku = 'INV7Y6K-WS' then 'INV7Y6K-YO'
                                    when catalog_sku = 'INV88LE-IW' then 'INV88LE-UJ'
                                    when catalog_sku = 'INVPSUT-QU' then 'INVPSUT-IJ'
                                    when catalog_sku = 'INVHONH-IA' then 'INVHONH-HO'
                                    when catalog_sku = 'INVCUZ8-OR' then 'INVWXWV-RB'
                                    when catalog_sku = 'INVWCHB-TF' then 'INVXKBJ-RX'
                                    when catalog_sku = 'INVTIR6-LY' then 'INVSWSA-ZK'
                                    when catalog_sku = 'INVXD5U-KN' then 'INV9NFU-8I'
                                    when catalog_sku = 'INVZIDB-K4' then 'INVZIDB-CB'
                                    when catalog_sku = 'INVSRMD-VL' then 'INVSRMD-KQ'
                                    when catalog_sku = 'INVKAJM-83' then 'INVKAJM-NS'
                                    when catalog_sku = 'INVTRJU-EX' then 'INVTRJU-YY'
                                    when catalog_sku = 'INVDM4D-LU' then 'INVDM4D-TL'
                                    when catalog_sku = 'INVJWKR-IN' then 'INVJWKR-WU'
                                    when catalog_sku = 'INVDG99-MY' then 'INVDG99-MI'
                                    when catalog_sku = 'INVCONV-MD' then 'INVIZQB-QZ'
                                    when catalog_sku = 'INVAYVR-TI' then 'INVAYVR-ZU'
                                    when catalog_sku = 'INV1RWK-K9' then 'INV1RWK-WC'
                                    when catalog_sku = 'INVSL2Q-IP' then 'INVSL2Q-SQ'
                                    when catalog_sku = 'INVKBE4-FD' then 'INVKBE4-YM'
                                    when catalog_sku = 'INVYVOL-MX' then 'INVYVOL-RW'
                                    when catalog_sku = 'INVI7I7-IY' then 'INVI7I7-MW'
                                    when catalog_sku = 'INVQUVK-MJ' then 'INVQUVK-NN'
                                    when catalog_sku = 'INVYULN-7G' then 'INVYULN-LA'
                                    when catalog_sku = 'INVKKMH-CR' then 'INVKKMH-TA'
                                    when catalog_sku = 'INV9N1S-GR' then 'INV9N1S-S6'
                                    when catalog_sku = 'INVSZXE-KI' then 'INVSZXE-X5'
                                    when catalog_sku = 'INVP1LM-MB' then 'INVP1LM-OQ'
                                    when catalog_sku = 'INVVM97-QO' then 'INVVM97-PC'
                                    when catalog_sku = 'INVIUUL-ZR' then 'INVIUUL-HL'
                                    when catalog_sku = 'INVFJ74-5O' then 'INVXQCA-RJ'
                                    when catalog_sku = 'INV6PSI-HX' then 'INVT4VB-Z9'
                                    when catalog_sku = 'INVZ7K9-CX' then 'INVKBVW-KP'
                                    when catalog_sku = 'INVVNR5-JT' then 'INVVNR5-M6'
                                    when catalog_sku = 'INVPZKZ-KQ' then 'INVPZKZ-QQ'
                                    when catalog_sku = 'INVTOMK-XG' then 'INVTOMK-YU'
                                    when catalog_sku = 'INVBWKK-68' then 'INVBWKK-SH'
                                    when catalog_sku = 'INVX9DN-AN' then 'INVX9DN-CB'
                                    when catalog_sku = 'INV4RTE-7I' then 'INV4RTE-PJ'
                                    when catalog_sku = 'INV4ZVD-33' then 'INV4ZVD-PG'
                                    when catalog_sku = 'INVL7GS-MB' then 'INVL7GS-SB'
                                    when catalog_sku = 'INVIQFN-EA' then 'INVIQFN-DQ'
                                    when catalog_sku = 'INVDVT7-GV' then 'INVDVT7-SE'
                                    when catalog_sku = 'INVBT8U-DC' then 'INVBT8U-M8'
                                    when catalog_sku = 'INVZK57-DH' then 'INVZK57-PQ'
                                    when catalog_sku = 'INVP3NR-VP' then 'INVP3NR-YX'
                                    when catalog_sku = 'INVD6IH-ZD' then 'INVD6IH-MS'
                                    when catalog_sku = 'INVPHYN-F0' then 'INVPHYN-JZ'
                                    when catalog_sku = 'INVQFBZ-CC' then 'INVY58A]-O9'
                                    when catalog_sku = 'INVPYSB-KG' then 'INVPYSB-VP'
                                    when catalog_sku = 'INVEUBB-24' then 'INVEUBB-II'
                                    when catalog_sku = 'INVA20D-4H' then 'INVA20D-B7'
                                    when catalog_sku = 'INVQGXL-OJ' then 'INVQGXL-3V'
                                    when catalog_sku = 'INVIVNI-R4' then 'INVIVNI-I7'
                                    when catalog_sku = 'INVSOV5-SE' then 'INVSOV5-XV'
                                    when catalog_sku = 'INVY58A-O9' then "INVY58A]-O9" 
                                  else catalog_sku end as catalog_sku,
                                  catalog_name,
                                  catalog_packaging,
                                  sum(delivered_catalog_amount) as delivered_catalog_amount
                                from completed_ops_item_report
                                group by 1,2,3,4,5,6,7,8
                                ),
daily_report_with_updated_catalog_name as (
                                select distinct kyosk_code,
                                completed_date_kenya,
                                agent_login,
                                agent_name ,
                                service_zone_name,
                                catalog_sku,
                                case 
                                    when catalog_name = ' BABA LAO NGANO 2KG' then 'BABA LAO MAIZE 2KG'
                                    when catalog_name = 'MAC COFFEE 1.6G SATCHET (12PCS)' and catalog_packaging = 'DOZEN' then ' MAC COFFEE 1.6G SATCHET (12PCS*5 *20)'
                                    when catalog_name = "MENENGAI CREAM BAR 1KG (10'S) (SMALL)" then 'MENENGAI CREAM 1KG (20PCS)'
                                    when catalog_name = " MENENGAI CREAM BAR 800G (12'S) (SMALL)" then 'MENENGAI CREAM 800G (25PCS)'
                                    when catalog_name = "NDOVU NGANO 2KG (HALF BALE)" and catalog_packaging = 'Bale' then 'NDOVU NGANO 2KG (12PCS)'
                                    when catalog_name = "NDOVU UGALI 2KG (HALF BALE)" and catalog_packaging = 'Bale' then 'NDOVU UGALI 2KG(12PCS)'
                                    when catalog_name = " SUNNY GIRL"  then 'SUNNY GIRL'
                                    when catalog_name = "ARIEL POWDER 45G (12PC)" and catalog_packaging = 'DOZEN' then 'ARIEL POWDER 45G (6x12PC)'
                                    when catalog_name = "DAWN PEKEE(10PACK) OUTER" and catalog_packaging = 'Outer' then "DAWN PEKEE(10 PACK X4) BALE"
                                    when catalog_name = "DAWN SMART 40'S" and catalog_packaging = 'Bale' then "DAWN SMART 10'S * 4 (OUTER)"
                                    when catalog_name = "MARIANDAZI 100G * 72" and catalog_packaging = 'Dozen' then "MARIANDAZI 100G * 72(CTN)"
                                    when catalog_name = "MY GIRL SANITARY PADS (12PCS)" and catalog_packaging = 'Dozen' then "MY GIRL SANITARY PADS (48PCS)"
                                    when catalog_name = "CHAPA MANDASHI 100G 12PC (X6)" and catalog_packaging = 'CARTON' then "CHAPA MANDASHI 100G 12PC"
                                    when catalog_name = "WHITEWASH WHITE 175G (12PCS)" and catalog_packaging = 'Dozen' then "WHITEWASH WHITE 175G (48PCS)"
                                    when catalog_name = "STAR SUGAR 1KG *20" and catalog_packaging = 'Bale' then "STAR SUGAR 1KG*12 PKT"
                                    when catalog_name = "SUMO CANDLE (OUTER)(8pcs)" and catalog_packaging = 'Outer' then "SUMO CANDLE (CARTON)"
                                    when catalog_name = "SOKONI STEELWOOL 15G (OUTERS)" and catalog_packaging = 'OUTER' then "SOKONI STEELWOOL 15G (20 OUTERS)"
                                    when catalog_name = "SOFTCARE SANITARY PADS (12PCS) PURPLE PACK" and catalog_packaging = 'DOZEN' then "SOFTCARE SANITARY PADS (24PCS) PURPLE PACK"
                                    when catalog_name = "SOFTCARE LARGE LC (11PC)" and catalog_packaging = 'PACKET' then "SOFTCARE LARGE LC (BALE)"
                                    when catalog_name = "SOFTCARE LARGE HC 40PC (OUTER)" and catalog_packaging = 'OUTER' then "SOFTCARE LARGE HC 40PC (BALE)"
                                    when catalog_name = "SOFTCARE GOLD MINI COUNT S 10'S OUTER" and catalog_packaging = 'Outer' then "SOFTCARE GOLD MINI COUNT S 10'S BALE"
                                    when catalog_name = "SOFTCARE GOLD MINI COUNT M 9'S OUTER" and catalog_packaging = 'Outer' then "SOFTCARE GOLD MINI COUNT M 9'S"
                                    when catalog_name = "SAWA SOAP 250G WHITE (24pcs)" and catalog_packaging = 'CARTON' then "SAWA SOAP 250G WHITE (12PCS)"
                                    when catalog_name = "SAFI WATER 24*500ML" and catalog_packaging = 'Carton' then "SAFI DRINKING WATER 12* 500ML"
                                    when catalog_name = "ROSSY TISSUE PRINTED 40*1PC (wrapped)" and catalog_packaging = 'Bale' then "ROSY PRINTED 40'S"
                                    when catalog_name = "ROSSY WHITE TISSUE 10PACK*4PCS (WRAPPED)" and catalog_packaging = 'Bale' then "ROSY TISSUE PRINTED (10PACK*4PCS) WRAPPED"
                                    when catalog_name = "NESCAFE 1.6G SAT OUTER(84pcs)" and catalog_packaging = 'Outer' then "NESCAFE 1.6G SAT CTN"
                                    when catalog_name = 'MARA SUGAR 2KG*10' and catalog_packaging = 'Bale' then 'MARA SUGAR 2KG *10'  
                                    when catalog_name = 'TAIFA NGANO 1K*24' and catalog_packaging = 'Bale' then 'TAIFA NGANO 1KG*24'
                                    when catalog_name = 'TAIFA NGANO 2K*12' and catalog_packaging = 'Bale' then 'TAIFA NGANO 2KG*12'
                                  else catalog_name end as catalog_name,
                                  catalog_packaging,
                                  sum(delivered_catalog_amount) as delivered_catalog_amount
                                  from daily_report_with_updated_agent_login_and_catalog_sku
                                  group by 1,2,3,4,5,6,7,8
                                  ),
daily_report_with_updated_catalog_packaging as (
                                  select distinct kyosk_code as dukaCode,
                                  completed_date_kenya as completedDateKenya,
                                  service_zone_name as serviceZoneName,
                                  agent_login as agentLogin,
                                  agent_name as agentName,
                                  catalog_sku as catalogSKU,
                                  catalog_name as catalogName,
                                  case 
                                      when catalog_name = 'SAWA SOAP 125G COCONUT' and catalog_packaging = 'Carton' then 'Dozen'
                                      when catalog_name = 'KISSKIDS LARGE HC 40PS (DARK BLUE)' and catalog_packaging = 'Outer' then 'Bale'
                                      when catalog_name = 'KISSKIDS LARGE HC 40PS(SKY BLUE)' and catalog_packaging = 'OUTER' then 'Bale'
                                      when catalog_name = 'KISSKIDS LARGE LC 9PS DARK BLUE' and catalog_packaging = 'Outer' then 'Bale'
                                      when catalog_name = 'KISSKIDS MID HC 42PCS (DARK BLUE)' and catalog_packaging = 'Outer' then 'Bale'
                                      when catalog_name = 'KISSKIDS MID HC 42PCS(SKY BLUE)' and catalog_packaging = 'OUTER' then 'Bale'
                                      when catalog_name = 'KISSKIDS MID LC 10PCS DARK BLUE' and catalog_packaging = 'Outer' then 'Bale'
                                      when catalog_name = 'KISSKIDS MINI HC 48PCS (DARK BLUE)' and catalog_packaging = 'Outer' then 'Bale'
                                      when catalog_name = 'KISSKIDS MINI LC 11PCS DARK BLUE' and catalog_packaging = 'Outer' then 'Bale'
                                      when catalog_name = "ARIMIS M/JELLY 50GMS (12PC)" and catalog_packaging = 'Carton' then "DOZEN"
                                      when catalog_name = "ARIMIS M/JELLY 90GM (12PC)" and catalog_packaging = 'Carton' then "DOZEN"
                                      when catalog_name = "BELLA ROLLS 40'S in 10s(WRAPPED)" and catalog_packaging = 'OUTER' then "Bale"
                                      when catalog_name = "Detrex Aloe Vera Soap 72 x 100GM" and catalog_packaging = 'Dozen' then "Carton"
                                      when catalog_name = "Detrex Citronella Oil Soap 72 x 100gms" and catalog_packaging = 'Dozen' then "Carton"
                                      when catalog_name = "Detrex Cool Mint Soap 72 x 100GM" and catalog_packaging = 'Dozen' then "Carton"
                                      when catalog_name = "Detrex Pine Drops Soap 72 x 100GM" and catalog_packaging = 'Dozen' then "Carton"
                                      when catalog_name = "DOWNY BLUE 20ML (12PC)(VALLEY DEW)" and catalog_packaging = 'DOZEN' then "CARTON"
                                      when catalog_name = "DOWNY BROWN 20ML (12PC)(FEEL LUXURIOUS)" and catalog_packaging = 'DOZEN' then "CARTON"
                                      when catalog_name = "FRESH GUM ACTIVE FRUITY 50'S PKT" and catalog_packaging = 'Carton' then "Packet"
                                      when catalog_name = "FRESH GUM ACTIVE MENTHOL 50'S PKT" and catalog_packaging = 'Carton' then "Packet"
                                      when catalog_name = "FRESH GUM ACTIVE PEPPERMINT 50'S PKT" and catalog_packaging ='Carton' then "Packet"
                                      when catalog_name = "LOLLIPOP BIG GIANT AST 50'S PKT" and catalog_packaging = 'Carton' then "Packet"
                                      when catalog_name = "MSAFI WHITE POWDER 100 G" and catalog_packaging = 'Carton' then "Dozen"
                                      when catalog_name = "CHAPA MANDASHI 100G 12PC" and catalog_packaging = 'CARTON' then "Dozen"
                                      when catalog_name = "WHITEWASH 200G PINK (12PC)" and catalog_packaging = 'Carton' then "DOZEN"
                                      when catalog_name = "TING TING BUBBLE GUM COLA 50'S PKT" and catalog_packaging = 'Carton' then "Packet"
                                      when catalog_name = "TING TING BUBBLE GUM AST 50'S PKT" and catalog_packaging = 'Carton' then "Packet"
                                      when catalog_name = "SOFTCARE MINI HC (48PC)" and catalog_packaging = 'OUTER' then "Bale"
                                      when catalog_name = "SOFTCARE MEDIUM HC (42PC)" and catalog_packaging = 'OUTER' then "Bale"
                                      when catalog_name = "SOFTCARE GOLD MINI COUNT L 8'S" and catalog_packaging = 'Outer' then "Bale"
                                      when catalog_name = "SOFTCARE GOLD LARGE HC 40'S" and catalog_packaging = 'Outer' then "Bale"
                                      when catalog_name = "SAWA SOAP 125G WHITE" and catalog_packaging = 'Dozen' then "Carton"
                                      when catalog_name = "SAWA SOAP 125G PINK" and catalog_packaging = 'Dozen' then "Carton"
                                      when catalog_name = "SALIT OIL 5LTR" and catalog_packaging = 'Carton' then "Jerican"
                                      when catalog_name = ' MAC COFFEE 1.6G SATCHET (12PCS*5 *20)' and catalog_packaging = 'DOZEN' then 'CARTON'
                                     when catalog_name = 'MENENGAI CREAM 1KG (20PCS)' and catalog_packaging = 'Carton' then 'CARTON'
                                     when catalog_name = 'MENENGAI CREAM 800G (25PCS)' and catalog_packaging = 'Carton' then 'CARTON'
                                     when catalog_name = 'NDOVU NGANO 2KG (12PCS)' and catalog_packaging = 'Bale' then 'BALE'
                                     when catalog_name = 'NDOVU UGALI 2KG(12PCS)' and catalog_packaging = 'Bale' then 'BALE'
                                     when catalog_name = 'SUNNY GIRL' and catalog_packaging = 'Dozen' then 'CARTON'
                                     when catalog_name = 'ARIEL POWDER 45G (6x12PC)' and catalog_packaging = 'DOZEN' then 'CARTON'
                                     when catalog_name = 'DAWN PEKEE(10 PACK X4) BALE' and catalog_packaging = 'Outer' then 'Bale'
                                     when catalog_name = "DAWN SMART 10'S * 4 (OUTER)" and catalog_packaging = 'Bale' then 'Outer'
                                     when catalog_name = 'MARIANDAZI 100G * 72(CTN)' and catalog_packaging = 'Dozen' then 'Carton'
                                     when catalog_name = "MY GIRL SANITARY PADS (48PCS)" and catalog_packaging = 'Dozen' then "Carton"
                                     when catalog_name = 'CHAPA MANDASHI 100G 12PC' and catalog_packaging = 'CARTON' then 'Dozen'
                                     when catalog_name = 'WHITEWASH WHITE 175G (48PCS)' and catalog_packaging = 'Dozen' then 'Carton'
                                     when catalog_name = 'SUMO CANDLE (CARTON)' and catalog_packaging = 'Outer' then 'Carton'
                                     when catalog_name = 'SOKONI STEELWOOL 15G (20 OUTERS)' and catalog_packaging = 'OUTER' then 'Carton'
                                     when catalog_name = 'SOFTCARE SANITARY PADS (24PCS) PURPLE PACK' and catalog_packaging = 'DOZEN' then 'CARTON'
                                     when catalog_name = 'SOFTCARE LARGE LC (BALE)' and catalog_packaging = 'PACKET' then 'BALE'
                                     when catalog_name = 'SOFTCARE LARGE HC 40PC (BALE)' and catalog_packaging = 'OUTER' then 'BALE'
                                     when catalog_name = "SOFTCARE GOLD MINI COUNT S 10'S BALE" and catalog_packaging = 'Outer' then 'Bale'
                                     when catalog_name = "SOFTCARE GOLD MINI COUNT M 9'S" and catalog_packaging = 'Outer' then 'Bale'
                                     when catalog_name = 'SAWA SOAP 250G WHITE (12PCS)' and catalog_packaging = 'DOZEN' then 'CARTON'
                                     when catalog_name = 'NESCAFE 1.6G SAT CTN' and catalog_packaging = 'Outer' then 'Carton'
                                     when catalog_name = "SAWA SOAP 250G PINK" and catalog_packaging = 'Carton' then 'Dozen'
                                    else catalog_packaging end as catalogPackaging,
                                    sum(delivered_catalog_amount) as actual_revenue
                                    from daily_report_with_updated_catalog_name
                                    group by 1,2,3,4,5,6,7,8
                                    ),
                      
ops_item_report_with_dates as ( select drwucp.* from daily_report_with_updated_catalog_packaging drwucp,date_vars  where  completedDateKenya between start_month and end_month ),

unique_skus_per_sales_agent as (
                            select distinct agentLogin, 
                            count(distinct catalogSku) as unique_sku_count
                            from ops_item_report_with_dates
                            group by 1
                            ),
                          
unique_skus_per_duka as (
                          select distinct agentLogin, 
                          dukaCode,
                          count(distinct catalogSku) as catalog_sku_count
                          from ops_item_report_with_dates
                          group by 1,2
                          ),
agent_average_sku_per_duka as (
                            select distinct agentLogin, 
                            sum(catalog_sku_count) as total_sku_count,
                            round(sum(catalog_sku_count)/ count(distinct dukaCode),0) as avg_catalog_sku_per_duka
                            from unique_skus_per_duka 
                            group by 1
                            ),
bonus_statistics as (
                      select distinct date_trunc(completedDateKenya, month) as month,
                      oir.agentLogin, 
                      string_agg(distinct agentName, "/" order by agentName) as agentName, 
                      string_agg(distinct serviceZoneName, "/" order by serviceZoneName) as serviceZoneName,
                      count(distinct completedDateKenya) as days_worked,
                      samrt.monthly_target as revenue_target,
                      sum( actual_revenue) as actual_revenue,
                      count(distinct dukaCode) as duka_count,
                      total_sku_count,
                      avg_catalog_sku_per_duka,
                      unique_sku_count
                      from ops_item_report_with_dates oir
                      left join agent_average_sku_per_duka aaspd on oir.agentLogin = aaspd.agentLogin
                      left join unique_skus_per_sales_agent uspsa on oir.agentLogin = uspsa.agentLogin
                      left join sales_agents_monthly_revenue_targets samrt on samrt.agent_login = aaspd.agentLogin and date_trunc(completedDateKenya, month) = samrt.start_date
                      group by 1,2,6,9,10,11
                      ),
final_bonus_statistics as (
                            select *, 
                            coalesce(round(safe_divide(sum(actual_revenue), sum(revenue_target)),2),0) as achieved_revenue_target 
                            from bonus_statistics
                            group by 1,2,3,4,5,6,7,8,9,10,11
                            ),
bonus_model as (
                 select  *, case 
                                when   achieved_revenue_target >= 0.8 and avg_catalog_sku_per_duka >= 30 then 15000
                                when    achieved_revenue_target >= 0.8 and avg_catalog_sku_per_duka >= 25 then 12000
                                when    achieved_revenue_target >= 0.8 and avg_catalog_sku_per_duka >= 20 then 9000
                                when   achieved_revenue_target >= 0.8 and avg_catalog_sku_per_duka >= 15 then 6000
                                else 0 
                            end as unlocked_avg_sku_per_duka_bonus,
                            
                            case
                                when achieved_revenue_target >= 2.5 then 35000
                                when achieved_revenue_target >= 1.8 then 30000
                                when achieved_revenue_target >= 1.6 then 25000
                                when achieved_revenue_target >= 1.4 then 20000
                                when achieved_revenue_target >= 1.2 then 15000
                                when achieved_revenue_target >= 1.0 then 10000
                                when achieved_revenue_target >= 0.9 then 5000
                                when achieved_revenue_target >= 0.8 then 2500
                                else 0
                            end as unlocked_revenue_bonus,
                            
                            case
                              when achieved_revenue_target >= 0.8 and duka_count >= 200 then 15000
                              when achieved_revenue_target >= 0.8 and duka_count >= 150 then 12000
                              when achieved_revenue_target >= 0.8 and duka_count >= 120 then 9000
                              when achieved_revenue_target >= 0.8 and duka_count >= 100 then 6000
                              else 0
                            end as unlocked_duka_count_bonus,
                           
                           case
                              when  achieved_revenue_target >= 0.8 and unique_sku_count >= 50 then 15000
                              when  achieved_revenue_target >= 0.8 and unique_sku_count >= 40 then 12000
                              when  achieved_revenue_target >= 0.8 and unique_sku_count >= 30 then 9000
                              when  achieved_revenue_target >= 0.8 and unique_sku_count >= 20 then 6000
                              else 0
                           end as unlocked_unique_sku_bonus
                  from final_bonus_statistics
                  )

select *, unlocked_revenue_bonus + unlocked_avg_sku_per_duka_bonus + unlocked_duka_count_bonus + unlocked_unique_sku_bonus as total_unlocked_bonus  
from bonus_model
--where agentLogin = 'serahwanjiku25@gmail.com'
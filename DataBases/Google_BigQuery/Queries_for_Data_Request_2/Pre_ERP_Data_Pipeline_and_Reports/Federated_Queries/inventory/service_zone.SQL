SELECT
      *
FROM EXTERNAL_QUERY("projects/kyosk-prod/locations/europe-west4/connections/inventory_conn", 
'''SELECT id::text, created_by,
       created_date,
       created_on_app,
       date_created,
       last_modified_by,
       last_modified_date,
       last_updated_on_app,
       code,
       level,
       name,
       parent_code,
       perimeter::text 
       FROM service_zone''')
SELECT
      *
FROM EXTERNAL_QUERY("projects/kyosk-prod/locations/europe-west4/connections/user_conn", 
'''SELECT 
       entity_name,
       role_name
FROM entity_roles''')
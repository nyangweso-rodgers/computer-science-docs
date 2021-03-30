-- DELETE Removes one or more rows from one table
--Using __WHERE__ clause is critical here!

DELETE FROM person p WHERE p.person_id = 2; -- without this restriction, all the rows will be deleted from the table
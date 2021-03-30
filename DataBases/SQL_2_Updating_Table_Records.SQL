-- UPDATE Modifies one or more rows in a table
UPDATE person 
SET last_name = 'omondi', age = 27
-- The __WHERE__ clause dictates which rows gets updated.
WHERE id = 1; -- update a specific row of the table otherwise all the last_name columns will be updated.
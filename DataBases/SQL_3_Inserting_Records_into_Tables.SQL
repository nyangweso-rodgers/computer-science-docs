-- INSERT INTO_: Adds one or more rows into a table
INSERT INTO person (person_id, first_name, last_name, age) 
-- list of columns in the parenthesis
VALUES (4, 
'rodgers', 
'nyangweso', 
25); -- values and columns must be equal

--------------------------Bulk Insert-------------------------------------------
-- _NOTE_: INSERT allows only one table and column list but allows multiple rows inside of values.
INSERT INTO person (person_id, first_name, last_name, age) 
-- list of columns in the parenthesis
VALUES (4, 
'rodgers', 
'nyangweso', 
25),
(5,
'jane',
'akinyi',
56),
(8,
'robert',
'okoth',
26);

----------------- insert from another table----------------------
INSERT INTO person p
SELECT * FROM old_person op
WHERE op.person_id >= 300;
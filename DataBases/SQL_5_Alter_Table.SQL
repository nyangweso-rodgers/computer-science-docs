-- ALTER Table
-- adding additional column using an ALTER table command
--Most of the time, people create there tables at once and them create the CONSTRAINTS using __ALTER TABLE__ command to overcome dependencies problems.
ALTER TABLE person 
ADD favourite_color VARCHAR(40) NULL DEFAULT 'PINK'; -- allow NULL values
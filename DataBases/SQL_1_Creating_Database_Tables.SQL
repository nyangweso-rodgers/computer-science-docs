-- CREATING DATABSE TABLES 
-- DATA DEFINITION LANGUANGE (DDL): is a SQL subset for creating databases & tables.
CREATE TABLE email_adress
(
    email_address_id INTEGER NOT NULL PRIMARY KEY,
    email_address VARCHAR(255),
    email_address_person_id INTEGER
);
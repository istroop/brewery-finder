-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS brewery;
DROP TABLE IF EXISTS app_user CASCADE;

CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  birthdate DATE,
  email_address varchar(100)
);

CREATE TABLE brewery (
    id SERIAL PRIMARY KEY,
    name varchar(255) NOT NULL,
    brewer int NOT NULL,
    hours_of_operation varchar(255),
    phone character varying(20),
    history varchar(500),
    image varchar(255),
    active_status bool,
    CONSTRAINT brewer_to_user_id_fkey FOREIGN KEY(brewer)
                     REFERENCES app_user (id)
);

COMMIT;
-- **************************************************************
-- This script destroys and re-creates the database
--
-- It also drops the users associated with the database
-- **************************************************************

-- The following line terminates any active connections to the database so that it can be destroyed
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'brewery_finder';

DROP DATABASE IF EXISTS brewery_finder;
CREATE DATABASE brewery_finder;

DROP USER brewery_finder_owner;
DROP USER brewery_finder_appuser;

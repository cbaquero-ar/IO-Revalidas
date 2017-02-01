--user: postgres

--Create Role role_revalidas
--Create User revalidas

CREATE ROLE role_revalidas WITH CREATEDB CREATEROLE LOGIN NOREPLICATION;
CREATE USER revalidas WITH PASSWORD 'revalidas17' ROLE role_revalidas;
GRANT ALL ON SCHEMA public TO role_revalidas;

--user: postgres

-- Database: exa_revalidas
--DROP DATABASE exa_revalidas;

CREATE DATABASE exa_revalidas WITH OWNER = revalidas
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

GRANT TEMPORARY, CONNECT ON DATABASE exa_revalidas TO PUBLIC;
GRANT ALL ON DATABASE exa_revalidas TO postgres;
GRANT ALL ON DATABASE exa_revalidas TO role_revalidas;

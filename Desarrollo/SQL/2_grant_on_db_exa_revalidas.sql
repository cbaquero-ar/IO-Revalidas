--user: postgres

GRANT TEMPORARY, CONNECT ON DATABASE exa_revalidas TO PUBLIC;
GRANT ALL ON DATABASE exa_revalidas TO postgres;
GRANT ALL ON DATABASE exa_revalidas TO role_revalidas;
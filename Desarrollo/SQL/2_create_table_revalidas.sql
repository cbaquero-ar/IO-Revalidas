-- user: revalidas

-- Table: public.revalidas

DROP TABLE IF EXISTS public.revalidas;

CREATE TABLE public.revalidas
(
    nro_solicitud integer,
    anio_ingreso text COLLATE pg_catalog."default",
    finales_adeudados integer,
    cursadas_adeudadas integer,
    optativas_adeudadas integer,
    adeuda_trab_final_inicio boolean,
    plan text COLLATE pg_catalog."default",
    tutor_r1 boolean,
    tutor_r2 boolean,
    usable boolean
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.revalidas
    OWNER to revalidas;

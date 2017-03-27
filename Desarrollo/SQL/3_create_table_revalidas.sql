-- user: revalidas

-- Table: public.revalidas

DROP TABLE IF EXISTS public.revalidas;

CREATE TABLE public.revalidas
(
    nro_solicitud integer,
    fecha_inscripcion date,
    anio_ingreso text COLLATE pg_catalog."default",
    finales_adeudados integer,
    cursadas_adeudadas integer,
    optativas_adeudadas integer,
    adeuda_trab_final_inicio boolean,
    plan text COLLATE pg_catalog."default",
    tutor_r1 boolean,
    tutor_r2 boolean,
	recibido boolean,
    fecha_recibido date,
    usable boolean,

   PRIMARY KEY ( nro_solicitud )
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.revalidas
    OWNER to revalidas;

-- user: revalidas

-- Table: public.revalidas

DROP TABLE IF EXISTS public.revalidas_18;
SET DATESTYLE TO DMY;
CREATE TABLE public.revalidas_18
(
    nro_solicitud integer,
    fecha_inscripcion date,
    anio_ingreso integer,
    finales_adeudados integer,
    cursadas_adeudadas integer,
    optativas_adeudadas integer,
    adeuda_trab_final_inicio boolean,
    plan text COLLATE pg_catalog."default",
    tutor_r1 boolean,
    tutor_r2 boolean,
	graduado boolean,
    fecha_graduado date,
    usable boolean,

   PRIMARY KEY ( nro_solicitud )
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.revalidas_18
    OWNER to revalidas;

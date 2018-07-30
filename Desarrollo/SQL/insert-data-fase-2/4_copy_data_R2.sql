--user: revalidas
SET DATESTYLE TO DMY;
DELETE FROM public.revalidas_18;
COPY public.revalidas_18 FROM '/home/revalidas-exa/repositorios/proyecto-revalidas/Desarrollo/Data/DatosRevalidas-RCA 23014.csv' USING DELIMITERS ',' with csv;

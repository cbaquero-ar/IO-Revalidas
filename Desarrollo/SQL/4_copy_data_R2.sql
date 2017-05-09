--user: revalidas
SET DATESTYLE TO DMY;
DELETE FROM public.revalidas;
COPY public.revalidas FROM 'C:\R2_data_final.csv' USING DELIMITERS ',' with csv;

# query data from postgreSQL
# Todos los atributos - año ingreso calendario
df_postgres <- dbGetQuery(con, "SELECT  
					  anio_ingreso,
					  plan,
					  finales_adeudados,
					  cursadas_adeudadas,
					  optativas_adeudadas,
					  adeuda_trab_final_inicio,
					  tutor_r1,
					  tutor_r2,
					  graduado
					  FROM revalidas 
					  WHERE usable=TRUE")
# Todos los atributos + dif_año_ingreso = resta de años
--Select el piso de la diferencia en años desde el ingreso hasta la inscripción al plan de reválidas.
SELECT	date_part('year',age(to_date(anio_ingreso::text||'-03-01','YYYY-mm-DD'),fecha_inscripcion)) as dif_anios_ingreso,
	plan,
	finales_adeudados,
	cursadas_adeudadas,
	optativas_adeudadas,
	adeuda_trab_final_inicio,
	tutor_r1,
	tutor_r2,
	graduado
	FROM revalidas 
	WHERE usable=TRUE

# Todos los atributos + dif_año_ingreso = rangos de 5 años
# Todos los atributos + dif_año_ingreso = rangos de 2 años

df_postgres [ , ]
str(df_postgres)



#install.packages(OneR)
require("OneR")
model <- OneR(df_postgres, verbose = TRUE)
summary(model)
plot(model)
prediction <- predict(model, df_postgres)
eval_model(prediction, df_postgres)
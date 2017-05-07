# Query data from postgreSQL
# Todos los atributos + dif_año_ingreso = resta de años
# Toma el PISO de la diferencia en años desde el ingreso hasta la inscripción al plan de reválidas.
df_postgres <- dbGetQuery(con, "SELECT
	date_part('year',age(to_date(anio_ingreso::text||'-03-01','YYYY-mm-DD'),fecha_inscripcion)) as dif_anios_ingreso,
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

df_postgres [ , ]
str(df_postgres)



#install.packages(OneR)
require("OneR")
model <- OneR(df_postgres, verbose = TRUE)
summary(model)
plot(model)
prediction <- predict(model, df_postgres)
eval_model(prediction, df_postgres)
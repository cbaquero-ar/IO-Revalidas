# Query data from postgreSQL
# Todos los atributos + dif_año_ingreso = resta de años
# Toma el PISO de la diferencia en años desde el ingreso hasta la inscripción al plan de reválidas
#Además, genera 2 atributos más por rangos para este atributo, con rnagos de 5 y 2 años.
df_postgres <- dbGetQuery(con, 
"SELECT  
	date_part('year',fecha_inscripcion)-anio_ingreso as dif_anios_ingreso_total, 	 
	floor((date_part('year',fecha_inscripcion)-anio_ingreso)/2)-4 as dif_anios_ingreso_rangos_de_2,
	floor((date_part('year',fecha_inscripcion)-anio_ingreso)/3)-2 as dif_anios_ingreso_rangos_de_3,
	floor((date_part('year',fecha_inscripcion)-anio_ingreso)/4)-1 as dif_anios_ingreso_rangos_de_4,
	floor((date_part('year',fecha_inscripcion)-anio_ingreso)/5)-1 as dif_anios_ingreso_rangos_de_5,
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
	AND (fecha_graduado IS NULL 
	OR fecha_graduado - fecha_inscripcion > 0 )
	")

df_postgres [ , ]
str(df_postgres)



#install.packages(OneR)
require("OneR")
model <- OneR(df_postgres, verbose = TRUE)
summary(model)
plot(model)
prediction <- predict(model, df_postgres)
eval_model(prediction, df_postgres)
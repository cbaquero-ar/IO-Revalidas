# query the data from postgreSQL 
#df_postgres <- dbGetQuery(con, "SELECT anio_ingreso,finales_adeudados,cursadas_adeudadas,optativas_adeudadas,adeuda_trab_final_inicio,plan,tutor_r1, recibido_fin_r1 from revalidas WHERE usable=TRUE")
df_postgres <- dbGetQuery(con, "SELECT  fecha_inscripcion,
										finales_adeudados,
										cursadas_adeudadas,
										optativas_adeudadas,
										adeuda_trab_final_inicio,
										recibido,
										fecha_recibido 
								from revalidas 
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
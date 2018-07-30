
#Set default CRAN mirror to download packages on file //installation-path/etc/Rprofile.site

#Set to install packages if they are not previously installed
list.of.packages <- c("OneR", "RPostgreSQL","rJava","RWeka")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages,repos='http://cran.us.r-project.org')


#Connect to PostgreSQL DB
require("RPostgreSQL")
 
# create a connection
# save the password that we can "hide" it as best as we can by collapsing it
pw <- {
  "revalidas17"
}

# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")
# creates a connection to the postgres database
# note that "con" will be used later in each connection to the database
con <- dbConnect(drv, dbname = "exa_revalidas",
                 host = "localhost", port = 5432,
                 user = "revalidas", password = pw)
rm(pw) # removes the password
 
# check for the revalidas table
dbExistsTable(con, "revalidas_18")
# query data from postgreSQL
# Todos los atributos - año ingreso calendario
    df_postgres <- dbGetQuery(con, "SELECT	date_part('year',age(to_date(anio_ingreso::text||'-03-01','YYYY-mm-DD'),fecha_inscripcion)) as dif_anios_ingreso,
        plan,
        finales_adeudados,
        cursadas_adeudadas,
        optativas_adeudadas,
        adeuda_trab_final_inicio,
        tutor_r1,
        tutor_r2,
        graduado
        FROM revalidas_18 
        WHERE usable=TRUE")

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


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
dbExistsTable(con, "revalidas")

#install.packages("RWeka")
require("RWeka")

df_postgres <- dbGetQuery(con, 
	"SELECT  
    plan,
	finales_adeudados,
	cursadas_adeudadas,
	optativas_adeudadas,
	adeuda_trab_final_inicio,
	graduado
	FROM revalidas 
	WHERE usable=TRUE
	AND (fecha_graduado IS NULL 
	OR fecha_graduado - fecha_inscripcion > 0 )")

## Identify a decision tree.
df_postgres <- lapply(df_postgres, as.factor)
m <- J48(graduado ~., data = df_postgres, control= Weka_control(M=1,U=TRUE))

m

## Use 10 fold cross-validation.
e <- evaluate_Weka_classifier(m, cost = matrix(c(0,2,1,0), ncol = 2),numFolds = 10, complexity = TRUE,seed = 123, class = TRUE)
e
summary(e)
e$details

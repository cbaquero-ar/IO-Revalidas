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
	WHERE usable=TRUE")

## Identify a decision tree.
df_postgres <- lapply(df_postgres, as.factor)
m <- J48(graduado ~., data = df_postgres, control= Weka_control(M=1,U=TRUE))

m

## Use 10 fold cross-validation.
e <- evaluate_Weka_classifier(m, cost = matrix(c(0,2,1,0), ncol = 2),numFolds = 10, complexity = TRUE,seed = 123, class = TRUE)
e
summary(e)
e$details
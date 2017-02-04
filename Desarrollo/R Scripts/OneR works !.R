# query the data from postgreSQL 
df_postgres <- dbGetQuery(con, "SELECT * from revalidas")
df_postgres [ , ]
str(df_postgres)

install.packages(OneR)
require("OneR")
model <- OneR(df_postgres, verbose = TRUE)
summary(model)
plot(model)
prediction <- predict(model, df_postgres)
eval_model(prediction, df_postgres)

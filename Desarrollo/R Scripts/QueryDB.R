# query the data from postgreSQL 
df_postgres <- dbGetQuery(con, "SELECT * from revalidas")
df_postgres [ , ]
str(df_postgres)
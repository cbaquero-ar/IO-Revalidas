# install.packages("RPostgreSQL")
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
# TRUE
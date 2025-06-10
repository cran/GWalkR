# Example of using GWalkR with a database connection
library(GWalkR)
library(DBI)
library(RSQLite)

# Create an in-memory SQLite database for demonstration
con <- dbConnect(RSQLite::SQLite(), ":memory:")

# Load the iris dataset into the database
data(iris)
dbWriteTable(con, "iris", iris)

# Create a more complex example dataset
data(mtcars)
dbWriteTable(con, "mtcars", mtcars)

# Method 1: Visualize a specific table
gwalkr(con, tableName = "iris")

gwalkr(con, tableName = "mtcars")

# Method 2: Visualize data from a SQL query
# This allows for filtering, joining, aggregating data before visualization
gwalkr(con, querySQL = "SELECT * FROM mtcars WHERE cyl = 4")

# Method 3: More complex SQL query with joins
dbWriteTable(con, "manufacturers", data.frame(
  make = c("Mazda", "Honda", "Toyota", "Mercedes", "Ford"),
  country = c("Japan", "Japan", "Japan", "Germany", "USA")
))

# Now create a visualization with a join query
gwalkr(con, querySQL = "
  SELECT m.*, manufacturers.country
  FROM mtcars m
  LEFT JOIN manufacturers ON manufacturers.make = 'Mazda'
  WHERE m.mpg > 20
")

# When running in a real application, don't forget to close the connection when done
# dbDisconnect(con)

# You can also use other database drivers like:
# - RPostgres for PostgreSQL
# - RMariaDB for MySQL/MariaDB
# - odbc for ODBC connections

# Example for PostgreSQL (requires the RPostgres package):
# con_pg <- dbConnect(
#   RPostgres::Postgres(),
#   dbname = "my_database",
#   host = "localhost",
#   port = 5432,
#   user = "postgres",
#   password = "password"
# )
#
# # Use a complex query with PostgreSQL-specific features
# gwalkr(con_pg, querySQL = "
#   SELECT
#     date_trunc('month', order_date) as month,
#     product_category,
#     SUM(sales_amount) as total_sales
#   FROM sales
#   WHERE order_date >= '2023-01-01'
#   GROUP BY 1, 2
#   ORDER BY 1, 2
# ")


library("duckdb")
# to start an in-memory database
con <- dbConnect(duckdb())
dbWriteTable(con, "mtcars", mtcars)
gwalkr(con, tableName = "mtcars")

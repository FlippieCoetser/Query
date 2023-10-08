# Query

![r-universe](https://flippiecoetser.r-universe.dev/badges/Query)

Generate SQL Queries with ease in R.

Query is a versatile and easy-to-use package designed to facilitate SQL generation for various database operations. By leveraging the power of R, the package allows users to create clean, efficient, and maintainable SQL code through a functional programming approach. Query supports a wide range of SQL operations, including SELECT, INSERT, UPDATE, and DELETE, allowing developers to interact with databases seamlessly.

Use Case Examples:

1. Select all in a table
2. Select specific records based on conditions
3. Insert records into a table
4. Update records in a table
5. Delete records from a table

Query also provides an set of utility functions and services, such as Query::SQL.Utilities() and Query::SQL.Functions(), to help users create flexible and reusable SQL code. It also offers the ability to chain operations together, making SQL generation more streamlined.

By utilizing Query, developers can easily build SQL queries, resulting in a more efficient and maintainable codebase. Whether you need to perform simple or complex database operations, Query has you covered. Start using Query today and experience the benefits of Query!

## Installation

At the time of writing this READMe, this `Query` R-Package is not available on CRAN. Use `devtools` to either install from GitHub or from a local copy of the repository.

### Install from GitHub

```r
devtools::install_github('https://github.com/FlippieCoetser/Query')
```

### Install from local copy

1. Generate `.tar.gz` file

```r
devtools::build()
```

2. Install `.tar.gz` file

```r
devtools::install_local('path_to_file/tar_gz_file', repos = NULL, type = 'source')
```

## Loading the Package

There are two ways to access the three sets of functions in the `Query` package:

1. Use the library function to load the package into the global namespace
2. Create an instance of each set of functions using the package namespace

### Use Global Namespace

When using the library function, the three sets of functions are loaded into the global namespace. This allows you to access the functions directly without having to use the package namespace.

```r
library(Query)
```

### Use Package Namespace

When using the package namespace, you can create an instance of each set of functions. This allows you to access the functions through the instance.

```r
sql           <- Query::SQL()
sql.utilities <- Query::SQL.Utilities()
sql.functions <- Query::SQL.Functions()
```

## Use Case Examples

1. Select all in a table:

```r
  fields <- list(
    'Id'            |> sql.utilities[['BRACKET']]() |> sql.functions[['LOWER']]('Id'),
    'Username'      |> sql.utilities[['BRACKET']](),
    'HashedPassword'|> sql.utilities[['BRACKET']](),
    'Salt'          |> sql.utilities[['BRACKET']]() |> sql.functions[['LOWER']]('Salt')
  )
  table <- 'User'

  query <-
    fields |> sql[['SELECT']]() |> sql[['FROM']](table)
```

- sql:

```sql
  SELECT
    LOWER([Id]) as Id,
    [Username],
    [HashedPassword],
    LOWER([Salt]) as Salt
  FROM [dbo].[User]
```

2.  Select specific records based on conditions:

```r
  fields <- list(
    'Id'            |> sql.utilities[['BRACKET']]() |> sql.functions[['LOWER']]('Id'),
    'Username'      |> sql.utilities[['BRACKET']](),
    'HashedPassword'|> sql.utilities[['BRACKET']](),
    'Salt'          |> sql.utilities[['BRACKET']]() |> sql.functions[['LOWER']]('Salt')
  )
  table <- 'User'
  key   <- 'Id'
  value <- 'b2970410-bd60-478d-baf6-46cbc14e10fc'

  query <-
    fields |> sql[['SELECT']]() |> sql[['FROM']]('User') |> sql[['WHERE']](key, value)
```

- sql:

```sql
  SELECT
    LOWER([Id]) as Id,
    [Username],
    [HashedPassword],
    LOWER([Salt]) as Salt
  FROM [dbo].[User]
  WHERE [Id] = 'b2970410-bd60-478d-baf6-46cbc14e10fc'
```

3. Insert records into a table:

```r
  table      <- 'User'
  keyValues  <- list(
    Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
    Username = 'test@gmail.com',
    HashedPassword = '2d2ee7bee3ae4795ba886',
    Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')

  query <-
    table |> sql[['INSERT']](keyValues) |> sql[['VALUES']](keyValues)
```

- sql:

```sql
  INSERT INTO [dbo].[User] ([Id], [Username], [HashedPassword], [Salt])
  VALUES (
    '4a0ec243-78ff-4461-8696-c41e7d64e108',
    'test@gmail.com', '2d2ee7bee3ae4795ba886ceffa3f03d0b1eeaf75fc9c19c4b22c06956e2d6d54a5a6b798a70758f6aae5918bbc42d91b44cd1ea2f6a445669cc3a5acc852f255',
    '53dfd42f-5394-46d7-a917-11b7da15816d')
```

4. Update records in a table:

```r
  table      <- 'User'
  keyValues  <- list(
    Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
    Username = 'test.updated@gmail.com',
    HashedPassword = '2d2ee7bee3ae4795ba886ceffa3f03d0b1eeaf75fc9c19c4b22c06956e2d6d54a5a6b798a70758f6aae5918bbc42d91b44cd1ea2f6a445669cc3a5acc852f255',
    Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')
  key   <- 'Id'
  value <- '4a0ec243-78ff-4461-8696-c41e7d64e108'

  query <-
    table |> sql[['UPDATE']]() |> sql[['SET']](keyValues) |> sql[['WHERE']](key, value)
```

- sql:

```sql
  UPDATE [dbo].[User]
  SET [Id] = '4a0ec243-78ff-4461-8696-c41e7d64e108',
      [Username] = 'test.updated@gmail.com',
      [HashedPassword] = '2d2ee7bee3ae4795ba886ceffa3f03d0b1eeaf75fc9c19c4b22c06956e2d6d54a5a6b798a70758f6aae5918bbc42d91b44cd1ea2f6a445669cc3a5acc852f255',
      [Salt] = '53dfd42f-5394-46d7-a917-11b7da15816d'
  WHERE [Id] = '4a0ec243-78ff-4461-8696-c41e7d64e108'
```

4. Delete records from a table:

```r
  table <- 'User'
  key   <- 'Id'
  value <- '4a0ec243-78ff-4461-8696-c41e7d64e108'

  query <-
    sql[['DELETE']]() |> sql[['FROM']](table) |> sql[['WHERE']](key, value)
```

- sql:

```sql
  DELETE
  FROM [dbo].[User]
  WHERE [Id] = '4a0ec243-78ff-4461-8696-c41e7d64e108'
```

> note: Github workflows use Github Secrets to set environment variables

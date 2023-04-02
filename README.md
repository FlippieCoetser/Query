# Query
Generate SQL Queries with ease in R.

Query is a versatile and easy-to-use package designed to facilitate SQL generation for various database operations. By leveraging the power of R, the package allows users to create clean, efficient, and maintainable SQL code through a functional programming approach. Query supports a wide range of SQL operations, including SELECT, INSERT, UPDATE, and DELETE, allowing developers to interact with databases seamlessly.

Use Case Examples:

1. Select all in a table
2. Select specific records based on conditions
3. Insert records into a table
4. Update records in a table
5. Delete records from a table

Query also provides an set of utility functions and services, such as Query::SQL.Utility.Service() and Query::SQL.Functions.Service(), to help users create flexible and reusable SQL code. It also offers the ability to chain operations together, making SQL generation more streamlined.

By utilizing Query, developers can easily build SQL queries, resulting in a more efficient and maintainable codebase. Whether you need to perform simple or complex database operations, Query has you covered. Start using Query today and experience the benefits of Query!

## Use Case Examples

1. Select all in a table:  
```r
  sql           <- Query::SQL.Orchestration()
  sql.utilities <- Query::SQL.Utility.Service()
  sql.functions <- Query::SQL.Functions.Service()

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
  sql           <- Query::SQL.Orchestration()
  sql.utilities <- Query::SQL.Utility.Service()
  sql.functions <- Query::SQL.Functions.Service()

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
  sql <- Query::SQL.Orchestration()

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
  sql <- Query::SQL.Orchestration()

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
  sql <- Query::SQL.Orchestration()

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
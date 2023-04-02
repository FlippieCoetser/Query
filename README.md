
> note: Github workflows use Github Secrets to set environment variables 

Use Case Examples

1. Select all in a table

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

produces this sql:

```sql
  SELECT 
    LOWER([Id]) as Id, 
    [Username], 
    [HashedPassword], 
    LOWER([Salt]) as Salt 
  FROM [dbo].[User]
```

2. Select where in a table

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

produces this sql:

```sql
  SELECT 
    LOWER([Id]) as Id, 
    [Username], 
    [HashedPassword], 
    LOWER([Salt]) as Salt 
  FROM [dbo].[User]
  WHERE [Id] = 'b2970410-bd60-478d-baf6-46cbc14e10fc'
```

3. Insert into table

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

produces this sql:

```sql
  INSERT INTO [dbo].[User] ([Id], [Username], [HashedPassword], [Salt]) 
  VALUES (
    '4a0ec243-78ff-4461-8696-c41e7d64e108', 
    'test@gmail.com', '2d2ee7bee3ae4795ba886ceffa3f03d0b1eeaf75fc9c19c4b22c06956e2d6d54a5a6b798a70758f6aae5918bbc42d91b44cd1ea2f6a445669cc3a5acc852f255', 
    '53dfd42f-5394-46d7-a917-11b7da15816d')
```

4. Update item in table:

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

produces this sql:

```sql
  UPDATE [dbo].[User]
  SET [Id] = '4a0ec243-78ff-4461-8696-c41e7d64e108',
      [Username] = 'test.updated@gmail.com', 
      [HashedPassword] = '2d2ee7bee3ae4795ba886ceffa3f03d0b1eeaf75fc9c19c4b22c06956e2d6d54a5a6b798a70758f6aae5918bbc42d91b44cd1ea2f6a445669cc3a5acc852f255', 
      [Salt] = '53dfd42f-5394-46d7-a917-11b7da15816d'
  WHERE [Id] = '4a0ec243-78ff-4461-8696-c41e7d64e108'
```

4. Delete item in table:

```r
  sql <- Query::SQL.Orchestration()

  table <- 'User'
  key   <- 'Id'
  value <- '4a0ec243-78ff-4461-8696-c41e7d64e108'

  query <-
    sql[['DELETE']]() |> sql[['FROM']](table) |> sql[['WHERE']](key, value) 
```

produces this sql:

```sql
  DELETE
  FROM [dbo].[User]
  WHERE [Id] = '4a0ec243-78ff-4461-8696-c41e7d64e108'
```
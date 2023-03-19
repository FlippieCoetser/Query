test_that('SELECT FROM Statements',{
  utilities <- SQL.Utility.Service()
  functions <- SQL.Functions.Service()

  processor <- DQL.Service() |> DQL.Processing()

  fields <- list(
    'Id'            |> utilities[['BRACKET']]() |> functions[['LOWER']]('Id'),
    'Username'      |> utilities[['BRACKET']](),
    'HashedPassword'|> utilities[['BRACKET']](),
    'Salt'          |> utilities[['BRACKET']]() |> functions[['LOWER']]('Salt')
  )

  output <- 'SELECT LOWER([Id]) as Id, [Username], [HashedPassword], LOWER([Salt]) as Salt FROM [dbo].[User] '

  fields |>
    processor[['SELECT']]()     |>
    processor[['FROM']]('User') |>
      expect_equal(output)
})
test_that('SELECT FROM WHERE Statements',{
  utilities <- SQL.Utility.Service()
  functions <- SQL.Functions.Service()

  processor <- DQL.Service() |> DQL.Processing()

  fields <- list(
    'Id'            |> utilities[['BRACKET']]() |> functions[['LOWER']]('Id'),
    'Username'      |> utilities[['BRACKET']](),
    'HashedPassword'|> utilities[['BRACKET']](),
    'Salt'          |> utilities[['BRACKET']]() |> functions[['LOWER']]('Salt')
  )
  key   <- 'Id'
  value <- 'b2970410-bd60-478d-baf6-46cbc14e10fc'

  output <- "SELECT LOWER([Id]) as Id, [Username], [HashedPassword], LOWER([Salt]) as Salt FROM [dbo].[User] WHERE [Id] = 'b2970410-bd60-478d-baf6-46cbc14e10fc' "

  fields |>
    processor[['SELECT']]()          |>
    processor[['FROM']]('User')      |>
    processor[['WHERE']](key, value) |>
      expect_equal(output)
})

test_that('INSERT INTO VALUES Statement',{
  # Given
  processor <- 
    DML.Service() |>
    DML.Processing()

  table <- 'User'
  keyValues  <- list(
    Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
    Username = 'test@gmail.com',
    HashedPassword = '2d2ee7bee3ae4795ba886',
    Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')

  output <- "INSERT INTO [dbo].[User] ([Id], [Username], [HashedPassword], [Salt]) VALUES ('4a0ec243-78ff-4461-8696-c41e7d64e108', 'test@gmail.com', '2d2ee7bee3ae4795ba886', '53dfd42f-5394-46d7-a917-11b7da15816d') "

  # Then
  table |>
    processor[['INSERT']](keyValues) |> 
    processor[['VALUES']](keyValues) |>         
      expect_equal(output)
})

test_that('UPDATE SET WHERE Statement',{
  # Given
  dml <- 
    DML.Service() |>
    DML.Processing()

  dql <-
    DQL.Service() |>
    DQL.Processing()

  table <- 'User'
  keyValues  <- list(
    Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
    Username = 'test.updated@gmail.com',
    HashedPassword = '2d2ee7bee3ae4795ba886ceffa3f03d0b1eeaf75fc9c19c4b22c06956e2d6d54a5a6b798a70758f6aae5918bbc42d91b44cd1ea2f6a445669cc3a5acc852f255',
    Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')
  key <- 'Id'
  value <- '4a0ec243-78ff-4461-8696-c41e7d64e108'

  output <- "UPDATE [dbo].[User] SET [Id] = '4a0ec243-78ff-4461-8696-c41e7d64e108', [Username] = 'test.updated@gmail.com', [HashedPassword] = '2d2ee7bee3ae4795ba886ceffa3f03d0b1eeaf75fc9c19c4b22c06956e2d6d54a5a6b798a70758f6aae5918bbc42d91b44cd1ea2f6a445669cc3a5acc852f255', [Salt] = '53dfd42f-5394-46d7-a917-11b7da15816d' WHERE [Id] = '4a0ec243-78ff-4461-8696-c41e7d64e108' "

  # Then
  table |>
    dml[['UPDATE']]() |> 
    dml[['SET']](keyValues) |> 
    dql[['WHERE']](key, value) |>       
      expect_equal(output)
})
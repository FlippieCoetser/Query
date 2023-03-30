describe("When SELECT FROM",{
  it("then a SELECT fields FROM schema table should be returned",{
    utilities <- SQL.Utility.Service()
    functions <- SQL.Functions.Service()
    orchestration <- SQL.Orchestration()

    fields <- list(
      'Id'            |> utilities[['BRACKET']]() |> functions[['LOWER']]('Id'),
      'Username'      |> utilities[['BRACKET']](),
      'HashedPassword'|> utilities[['BRACKET']](),
      'Salt'          |> utilities[['BRACKET']]() |> functions[['LOWER']]('Salt')
    )
    table <- 'User'

    output <- 'SELECT LOWER([Id]) as Id, [Username], [HashedPassword], LOWER([Salt]) as Salt FROM [dbo].[User] '

    fields |>
      orchestration[['SELECT']]() |> 
      orchestration[['FROM']](table) |> 
          expect_equal(output)
  })
})
describe("When SELECT FROM WHERE",{
  it("then a SELECT fields FROM schema table WHERE key = value should be returned",{
    utilities <- SQL.Utility.Service()
    functions <- SQL.Functions.Service()
    orchestration <- SQL.Orchestration()

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
        orchestration[['SELECT']]()          |> 
        orchestration[['FROM']]('User')      |> 
        orchestration[['WHERE']](key, value) |>
          expect_equal(output)
  })
})
describe("When INSERT INTO VALUES",{
  it("then a INSERT INTO schema table (fields) VALUES (values) should be returned",{
    orchestration <- SQL.Orchestration()

    table <- 'User'
    keyValues  <- list(
      Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
      Username = 'test@gmail.com',
      HashedPassword = '2d2ee7bee3ae4795ba886',
      Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')

    output <- "INSERT INTO [dbo].[User] ([Id], [Username], [HashedPassword], [Salt]) VALUES ('4a0ec243-78ff-4461-8696-c41e7d64e108', 'test@gmail.com', '2d2ee7bee3ae4795ba886', '53dfd42f-5394-46d7-a917-11b7da15816d') "

    # Then
    table |>
      orchestration[['INSERT']](keyValues) |> 
      orchestration[['VALUES']](keyValues) |>         
        expect_equal(output)
  })
})
describe("When UPDATE SET WHERE",{
  it("then a UPDATE schema table SET key = value WHERE key = value should be returned",{
    # Given
    orchestration <- SQL.Orchestration()

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
      orchestration[['UPDATE']]() |> 
      orchestration[['SET']](keyValues) |> 
      orchestration[['WHERE']](key, value) |>       
        expect_equal(output)
  })
})
describe("When DELETE FROM WHERE",{
  it("then a DELETE FROM schema table WHERE key = value should be returned",{
    # Given
    orchestration <- SQL.Orchestration()

    table <- 'User'
    key <- 'Id'
    value <- '4a0ec243-78ff-4461-8696-c41e7d64e108'

    output <- "DELETE FROM [dbo].[User] WHERE [Id] = '4a0ec243-78ff-4461-8696-c41e7d64e108' "

    # Then
      orchestration[['DELETE']]() |> 
      orchestration[['FROM']](table) |> 
      orchestration[['WHERE']](key, value) |>       
        expect_equal(output)
  })
})

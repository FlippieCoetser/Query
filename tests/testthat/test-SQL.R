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
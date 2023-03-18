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
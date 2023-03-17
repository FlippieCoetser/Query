test_that('DQL.Processing exist',{
  DQL.Processing   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('DQL.Processing() return list of processors',{
  DQL.Processing() |>
    is.list() |>
      expect_equal(TRUE)
})

# SELECT SQL Statement
test_that('processors contains SELECT processor',{
  # Given
  processor <- DQL.Processing()

  # Then
  processor[['SELECT']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("processor[['SELECT']]() returns a SELECT * statement",{
  # Given
  processor <- 
    DQL.Service() |>
    DQL.Processing()

  output <- 'SELECT * '

  # Then
  processor[['SELECT']]() |>         
    expect_equal(output)
})
test_that("fields |> processor[['SELECT']]() returns a SELECT fields statement",{
  # Given
  processor <- 
    DQL.Service() |>
    DQL.Processing()

  fields <- list('Id','Username','HashedPassword','Salt')
  output <- 'SELECT Id, Username, HashedPassword, Salt '

  # Then
  fields |>
    processor[['SELECT']]() |>         
      expect_equal(output)
})

# FROM SQL Statement
test_that('processors contains FROM processor',{
  # Given
  processor <- DQL.Processing()

  # Then
  processor[['FROM']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> processor[['FROM']](table) returns FROM table statement and prepend input",{
  # Given
  processor <- 
    DQL.Service() |>
    DQL.Processing()

  # When
  input <- 'input '
  table <- 'table'

  output <- 'input FROM [dbo].[table] '

  # Then
  input |>
    processor[['FROM']](table) |>
      expect_equal(output)
})

# WHERE SQL Statement
test_that('processors contains WHERE processor',{
  # Given
  processor <- DQL.Processing()

  # Then
  processor[['WHERE']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> processor[['WHERE']](key, value) returns WHERE key equal value with input prepended",{
  # Given
  processor <- 
    DQL.Service() |>
    DQL.Processing()

  # When
  input <- 'input '
  key   <- 'id'
  value <- 'value'

  output <- "input WHERE [id] = 'value' "

  # Then
  input |>
    processor[['WHERE']](key, value) |>
      expect_equal(output)
})
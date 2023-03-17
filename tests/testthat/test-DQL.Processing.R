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
test_that('services contains SELECT processor',{
  # Given
  processor <- DQL.Processing()

  # Then
  processor[['SELECT']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("service[['SELECT']]() returns a SELECT * statement",{
  # Given
  service <- 
    DQL.Service() |>
    DQL.Processing()

  output <- 'SELECT * '

  # Then
  service[['SELECT']]() |>         
    expect_equal(output)
})
test_that("fields |> service[['SELECT']]() returns a SELECT fields statement",{
  # Given
  service <- 
    DQL.Service() |>
    DQL.Processing()

  fields <- list('Id','Username','HashedPassword','Salt')
  output <- 'SELECT Id, Username, HashedPassword, Salt '

  # Then
  fields |>
    service[['SELECT']]() |>         
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
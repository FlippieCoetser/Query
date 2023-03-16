test_that('DQL.Service exist',{
  DQL.Service   |>
    is.null()   |>
      expect_equal(FALSE)
})
test_that('DQL.Service() return list of services',{
  DQL.Service() |>
    is.list()   |>
      expect_equal(TRUE)
})

# SELECT KEYWORD
test_that('services contains SELECT service',{
  # Given
  service <- DQL.Service()

  # Then
  service[['SELECT']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("service[['SELECT']]() returns SELECT keyword",{
  # Given
  service <- DQL.Service()

  output <- 'SELECT '

  # Then
  service[['SELECT']]() |>
    expect_equal(output)
})

# FIELDS
test_that('services contains FIELDS service',{
  # Given
  service <- DQL.Service()

  # Then
  service[['FIELDS']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> service[['FIELDS']](fields) collapse list using comma as separator and prepend input",{
  # Given
  service <- DQL.Service()
  
  input   <- 'input '
  output  <- 'input one, two, three '

  # When 
  fields <- list('one','two','three')

  # Then
  input                         |>
    service[['FIELDS']](fields) |>
      expect_equal(output)
})

# *
test_that('services contains * service',{
  # Given
  service <- DQL.Service()

  # Then
  service[['*']] |>
    Exist()      |>
      expect_equal(TRUE)
})
test_that("input |> service[['*']]() returns * and prepend input",{
  # Given
  service <- DQL.Service()
  
  input   <- 'input '
  output  <- 'input * '

  # Then
  input              |>
    service[['*']]() |>
      expect_equal(output)
})
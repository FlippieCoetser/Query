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

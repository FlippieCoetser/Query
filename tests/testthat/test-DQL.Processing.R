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
test_that('services contains SELECT service',{
  # Given
  service <- DQL.Service()

  # Then
  service[['SELECT']] |>
    Exist()           |>
      expect_equal(TRUE)
})
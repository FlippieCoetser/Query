test_that('DQL.Service exist',{
  DQL.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('DQL.Service() return list of services',{
  DQL.Service() |>
    is.list() |>
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
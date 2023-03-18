test_that('SQL.Functions.Service exist',{
  SQL.Functions.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('SQL.Functions.Service() return list of services',{
  SQL.Functions.Service() |>
    is.list() |>
      expect_equal(TRUE)
})

# LOWER FUNCTIONS
test_that('services contains LOWER service',{
  # Given
  service <- SQL.Functions.Service()

  # Then
  service[['LOWER']] |>
    Exist()           |>
      expect_equal(TRUE)
})
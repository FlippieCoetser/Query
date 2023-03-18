test_that('SQL.Utility.Service exist',{
  SQL.Utility.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('SQL.Utility.Service() return list of services',{
  SQL.Utility.Service() |>
    is.list() |>
      expect_equal(TRUE)
})

# BRACKET
test_that('services contains BRACKET service',{
  # Given
  service <- SQL.Utility.Service()

  # Then
  service[['BRACKET']] |>
    Exist()           |>
      expect_equal(TRUE)
})
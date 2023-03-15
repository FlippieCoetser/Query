test_that('String.Utility.Service exist',{
  String.Utility.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Service() return list of services',{
  String.Utility.Service() |>
    is.list() |>
      expect_equal(TRUE)
})

test_that('services contains Append service',{
  # Given
  service <- 
    String.Utility.Broker() |>
    String.Utility.Service()

  # Then
  service[['Append']] |>
    Exist()           |>
      expect_equal(TRUE)
})
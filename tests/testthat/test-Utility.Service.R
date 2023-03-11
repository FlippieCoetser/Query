test_that('Utility.Service exist',{
  Utility.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('Utility.Service() return list of services',{
  Utility.Service() |>
    is.list() |>
      expect_equal(TRUE)
})

# Prepend
test_that('service instance has Prepend service',{
  # Given
  service <- Utility.Service()

  # Then
  service[['Prepend']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> service[['Prepend']](string) Prepends string to field",{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- string |> paste(field, sep = '')

  # Then
  field |>
    service[['Prepend']](string) |>
      expect_equal(expected) 
})
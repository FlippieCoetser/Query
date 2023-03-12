test_that('Utility.Processing exist',{
  Utility.Processing   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('Utility.Processing() return list of processors',{
  Utility.Processing() |>
    is.list() |>
      expect_equal(TRUE)
})

# Prepend
test_that('processor instance has Prepend processor',{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  # Then
  processor[['Prepend']] |>
    is.null()          |>
      expect_equal(FALSE)
})
test_that("field |> processor[['Prepend']](string) Prepends string to field",{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- string |> paste(field, sep = '')

  # Then
  field |>
    processor[['Prepend']](string) |>
      expect_equal(expected) 
})
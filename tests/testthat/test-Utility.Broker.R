test_that('Utility.Broker exist',{
  Utility.Broker |>
    is.null()    |>
      expect_equal(FALSE)
})
test_that('Utility.Broker() return list of operations',{
  Utility.Broker() |>
    is.list()      |>
      expect_equal(TRUE)
})

# Prepend
test_that('broker instance has Prepend operation',{
  # Given
  broker <- Utility.Broker()

  # Then
  broker[['Prepend']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> broker[['Prepend']](string) Prepends string to field",{
  # Given
  broker <- Utility.Broker()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- string |> paste(field, sep = '')

  # Then
  field |>
    broker[['Prepend']](string) |>
      expect_equal(expected) 
})

# Append
test_that('broker instance has Append operation',{
  # Given
  broker <- Utility.Broker()

  # Then
  broker[['Append']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> broker[['Append']](string) Append string to field",{
  # Given
  broker <- Utility.Broker()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- field |> paste(string, sep = '')

  # Then
  field |>
    broker[['Append']](string) |>
      expect_equal(expected) 
})
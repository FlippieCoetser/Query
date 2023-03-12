test_that('Utility.Service exist',{
  Utility.Service |>
    is.null()     |>
      expect_equal(FALSE)
})
test_that('Utility.Service() return list of services',{
  Utility.Service() |>
    is.list()       |>
      expect_equal(TRUE)
})

# Prepend
test_that('service instance has Prepend service',{
  # Given
  service <- Utility.Service()

  # Then
  service[['Prepend']] |>
    is.null()          |>
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

# Append
test_that('service instance has Append service',{
  # Given
  service <- Utility.Service()

  # Then
  service[['Append']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> service[['Append']](string) Append string to field",{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- field |> paste(string, sep = '')

  # Then
  field |>
    service[['Append']](string) |>
      expect_equal(expected) 
})

# IncloseInSquareBrackets
test_that('broker instance has IncloseInSquareBrackets service',{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  # Then
  service[['IncloseInSquareBrackets']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> service[['IncloseInSquareBrackets']]() inclose field in square brackets",{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  field  <- 'field'

  # When
  expected <- '[field]'

  # Then
  field |>
    service[['IncloseInSquareBrackets']]() |>
      expect_equal(expected) 
})

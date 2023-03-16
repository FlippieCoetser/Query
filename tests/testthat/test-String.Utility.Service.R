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
test_that("field |> service[['Append']](string) appends string to end of field",{
  # Given
  service <- 
    String.Utility.Broker() |>
    String.Utility.Service()

  # When
  field <- 'field'
  string <- 'string'

  # Then
  field |>
    service[['Append']](string) |>
      expect_equal('fieldstring')
})
test_that("field |> service[['Append']](string) throws error if field null",{
  # Given
  service <- 
    String.Utility.Broker() |>
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field <- NULL
  string <- 'string'

  # Then
  field |>
    service[['Append']](string) |>
      expect_error(error)
})
test_that("field |> service[['Append']](string) throws error if string null",{
  # Given
  service <- 
    String.Utility.Broker() |>
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field <- 'field' 
  string <- NULL

  # Then
  field |>
    service[['Append']](string) |>
      expect_error(error)
})

# Prepend Operation
test_that('services contains Prepend service',{
  # Given
  service <- 
    String.Utility.Broker() |>
    String.Utility.Service()

  # Then
  service[['Prepend']] |>
    Exist()            |>
      expect_equal(TRUE)
})
test_that("field |> service[['Prepend']](string) appends string to front of field",{
  # Given
  service <- 
    String.Utility.Broker() |>
    String.Utility.Service()

  # When
  field <- 'field'
  string <- 'string'

  # Then
  field |>
    service[['Prepend']](string) |>
      expect_equal('stringfield')
})
test_that("field |> service[['Prepend']](string) throws error if field null",{
  # Given
  service <- 
    String.Utility.Broker() |>
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field <- NULL
  string <- 'string'

  # Then
  field |>
    service[['Prepend']](string) |>
      expect_error(error)
})
test_that("field |> service[['Prepend']](string) throws error if string null",{
  # Given
  service <- 
    String.Utility.Broker() |>
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field <- 'field'
  string <- NULL

  # Then
  field |>
    service[['Prepend']](string) |>
      expect_error(error)
})
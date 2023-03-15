test_that('String.Utility.Broker exist',{
  String.Utility.Broker   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Broker() return list of operations',{
  String.Utility.Broker() |>
    is.list() |>
      expect_equal(TRUE)
})

# Append Operation
test_that('broker instance has Append operation',{
  # Given
  broker <- String.Utility.Broker()

  # Then
  broker[['Append']] |>
    Exist()          |>
      expect_equal(TRUE)
})
test_that("field |> broker[['Append']](string) appends string to end of field",{
  # Given
  broker <- String.Utility.Broker()

  # When
  field <- 'field'
  string <- 'string'

  # Then
  field |>
    broker[['Append']](string) |>
      expect_equal('fieldstring')
})

# Prepend Operation
test_that('broker instance has Prepend operation',{
  # Given
  broker <- String.Utility.Broker()

  # Then
  broker[['Prepend']] |>
    Exist()          |>
      expect_equal(TRUE)
})
test_that("field |> broker[['Prepend']](string) appends string to front of field",{
  # Given
  broker <- String.Utility.Broker()

  # When
  field <- 'field'
  string <- 'string'

  # Then
  field |>
    broker[['Prepend']](string) |>
      expect_equal('stringfield')
})
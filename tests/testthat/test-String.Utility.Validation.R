test_that('String.Utility.Validation exist',{
  String.Utility.Validation   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Validation() return list of validators',{
  String.Utility.Validation() |>
    is.list() |>
      expect_equal(TRUE)
})

# Exist Validator
test_that('validators contains Exist validator',{
  # Given
  validators <- String.Utility.Validation()

  # Then
  validators[['Exist']] |>
    Exist()             |>
      expect_equal(TRUE)
})
test_that("input |> validate[['Exist']]() throws exception if input NULL",{
  # Given
  validate <- String.Utility.Validation()
  error     <- 'argument is NULL'

  # When
  input <- NULL

  # Then
  input |>
    validate[['Exist']]() |>
      expect_error(error)
})
test_that("input |> validate[['Exist']]() throw no exception if input is not NULL",{
  # Given
  validate <- String.Utility.Validation()

  # When
  input <- ''

  # Then
  input |>
    validate[['Exist']]() |>
      expect_no_error()
})
test_that("input |> validate[['Exist']]() returns input if input is not NULL",{
  # Given
  validate <- String.Utility.Validation()

  # When
  input <- ''

  # Then
  input |>
    validate[['Exist']]() |>
      expect_equal(input)
})

# Is String Validator
test_that('validators contains IsString validator',{
  # Given
  validators <- String.Utility.Validation()

  # Then
  validators[['IsString']] |>
    Exist()             |>
      expect_equal(TRUE)
})
test_that("input |> validate[['IsString']]() throws exception if input is not character",{
  # Given
  validate <- String.Utility.Validation()
  error     <- 'argument is not a String'

  # When
  input <- 1

  # Then
  input |>
    validate[['IsString']]() |>
      expect_error(error)
})
test_that("input |> validate[['IsString']]() throw no exception if input is character",{
  # Given
  validate <- String.Utility.Validation()

  # When
  input <- ''

  # Then
  input |>
    validate[['IsString']]() |>
      expect_no_error()
})
test_that("input |> validate[['IsString']]() returns input if input is String",{
  # Given
  validate <- String.Utility.Validation()

  # When
  input <- ''

  # Then
  input |>
    validate[['IsString']]() |>
      expect_equal(input)
})

# Is Vector Validator
test_that('validators contains IsVector validator',{
  # Given
  validators <- String.Utility.Validation()

  # Then
  validators[['IsVector']] |>
    Exist()             |>
      expect_equal(TRUE)
})
test_that("input |> validate[['IsVector']]() throws exception if input is not vector",{
  # Given
  validate <- String.Utility.Validation()
  error     <- 'argument is not a Vector'

  # When
  input <- data.frame()

  # Then
  input |>
    validate[['IsVector']]() |>
      expect_error(error)
})
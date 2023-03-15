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

# Is String Validator
test_that('validators contains IsString validator',{
  # Given
  validators <- String.Utility.Validation()

  # Then
  validators[['IsString']] |>
    Exist()             |>
      expect_equal(TRUE)
})
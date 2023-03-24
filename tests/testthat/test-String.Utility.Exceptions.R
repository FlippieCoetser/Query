test_that('String.Utility.Exceptions exist',{
  String.Utility.Exceptions   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Exceptions() return list of exceptions',{
  String.Utility.Exceptions() |>
    is.list() |>
      expect_equal(TRUE)
})

# Null Exception
test_that('exceptions contains argument Null exception',{
  # Given
  exceptions <- String.Utility.Exceptions()

  # Then
  exceptions[['ArgumentNullException']] |>
    Exist()                     |>
      expect_equal(TRUE)
})
test_that("FALSE |> exception[['ArgumentNullException']]() throws no exception",{
  # Given
  exception <- String.Utility.Exceptions()

  # Then 
  FALSE |>
    exception[['ArgumentNullException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['ArgumentNullException']]() throws Null exception",{
  # Given
  exception <- String.Utility.Exceptions()
  error     <- 'argument is NULL'

  # Then 
  TRUE |>
    exception[['ArgumentNullException']]() |>
      expect_error(error)
})

# String Exception
test_that('exceptions contains argument not Character exception',{
  # Given
  exceptions <- String.Utility.Exceptions()

  # Then
  exceptions[['ArgumentNotCharacterException']] |>
    Exist()                       |>
      expect_equal(TRUE)
})
test_that("FALSE |> exception[['ArgumentNotCharacterException']]() throws no exception",{
  # Given
  exception <- String.Utility.Exceptions()

  # Then 
  FALSE |>
    exception[['ArgumentNotCharacterException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['ArgumentNotCharacterException']]() throws String exception",{
  # Given
  exception <- String.Utility.Exceptions()
  error     <- 'argument is not a String'

  # Then 
  TRUE |>
    exception[['ArgumentNotCharacterException']]() |>
      expect_error(error)
})

# Vector Exception
test_that('exceptions contains argument not Vector exception',{
  # Given
  exceptions <- String.Utility.Exceptions()

  # Then
  exceptions[['ArgumentNotVectorException']] |>
    Exist()                       |>
      expect_equal(TRUE)
})
test_that("FALSE |> exception[['ArgumentNotVectorException']]() throws no exception",{
  # Given
  exception <- String.Utility.Exceptions()

  # Then 
  FALSE |>
    exception[['ArgumentNotVectorException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['ArgumentNotVectorException']]() throws Vector exception",{
  # Given
  exception <- String.Utility.Exceptions()
  error     <- 'argument is not a Vector'

  # Then 
  TRUE |>
    exception[['ArgumentNotVectorException']]() |>
      expect_error(error)
})
test_that('Utility.Exceptions exist',{
  Utility.Exceptions   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('Utility.Exceptions() return list of exceptions',{
  Utility.Exceptions() |>
    is.list() |>
      expect_equal(TRUE)
})

# Null Exception
test_that("exception instance has NullException",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  exception[['NullException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['NullException']]() throw no exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  FALSE |>
    exception[['NullException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['NullException']]() throw NULL exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  TRUE |>
    exception[['NullException']]() |>
      expect_error('argument is NULL')
})

# Character Exception
test_that("exception instance has character exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  exception[['CharacterException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['CharacterException']]() throw no exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  FALSE |>
    exception[['CharacterException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['CharacterException']]() throw numeric exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  TRUE |>
    exception[['CharacterException']]() |>
      expect_error('argument is not of type character')
})

# List Exception
test_that("exception instance has ListException",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  exception[['ListException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['ListException']]() throw no exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  FALSE |>
    exception[['ListException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['ListException']]() throw NULL exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  TRUE |>
    exception[['ListException']]() |>
      expect_error('argument is not of type list')
})

# Vector Exception
test_that("exception instance has VectorException",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  exception[['VectorException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['VectorException']]() throw no exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  FALSE |>
    exception[['VectorException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['VectorException']]() throw Vector exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  TRUE |>
    exception[['VectorException']]() |>
      expect_error('argument is not of type vector')
})

# List or Vector Exception
test_that("exception instance has ListOrVectorException",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  exception[['ListOrVectorException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['ListOrVectorException']]() throw no exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  FALSE |>
    exception[['ListOrVectorException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['ListOrVectorException']]() throw ListOrVector exception",{
  # Given
  exception <- Utility.Exceptions()

  # Then
  TRUE |>
    exception[['ListOrVectorException']]() |>
      expect_error('argument is not a list or vector')
})
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
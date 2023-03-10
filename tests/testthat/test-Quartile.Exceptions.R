test_that('Quartile.Exceptions exist',{
  Quartile.Exceptions |>
    is.null()      |>
      expect_equal(FALSE)
})
test_that('Quartile.Exceptions returns list of exceptions',{
  Quartile.Exceptions() |>
    is.list()        |>
      expect_equal(TRUE)
})

# Null Exception
test_that("exception instance has NullException",{
  # Given
  exception <- Quartile.Exceptions()

  # Then
  exception[['NullException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['NullException']]() throw no exception",{
  # Given
  exception <- Quartile.Exceptions()

  # Then
  FALSE |>
    exception[['NullException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['NullException']]() throw NULL exception",{
  # Given
  exception <- Quartile.Exceptions()

  # Then
  TRUE |>
    exception[['NullException']]() |>
      expect_error('argument is NULL')
})

# Numeric Exception
test_that("exception instance has numeric exception",{
  # Given
  exception <- Quartile.Exceptions()

  # Then
  exception[['NumericException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['NumericException']]() throw no exception",{
  # Given
  exception <- Quartile.Exceptions()

  # Then
  FALSE |>
    exception[['NumericException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['NumericException']]() throw numeric exception",{
  # Given
  exception <- Quartile.Exceptions()

  # Then
  TRUE |>
    exception[['NumericException']]() |>
      expect_error('argument is not numeric')
})

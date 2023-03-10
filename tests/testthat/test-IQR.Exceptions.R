test_that('IQR.Exceptions exist',{
  IQR.Exceptions |>
    is.null()    |>
      expect_equal(FALSE)
})
test_that('IQR.Exceptions returns list of exceptions',{
  IQR.Exceptions() |>
    is.list()      |>
      expect_equal(TRUE)
})

# Null Exception
test_that("exception instance has NullException",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  exception[['NullException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['NullException']]() throw no exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  FALSE |>
    exception[['NullException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['NullException']]() throw NULL exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  TRUE |>
    exception[['NullException']]() |>
      expect_error('argument is NULL')
})

# Numeric Exception
test_that("exception instance has numeric exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  exception[['NumericException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['NumericException']]() throw no exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  FALSE |>
    exception[['NumericException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['NumericException']]() throw numeric exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  TRUE |>
    exception[['NumericException']]() |>
      expect_error('argument is not numeric')
})

# List Exception
test_that("exception instance has numeric exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  exception[['ListException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['ListException']]() throw no exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  FALSE |>
    exception[['ListException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['ListException']]() throw numeric exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  TRUE |>
    exception[['ListException']]() |>
      expect_error('argument is not list')
})

# First Quartile Missing Exception
test_that("exception instance has numeric exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  exception[['FirstQuartileMissingException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['FirstQuartileMissingException']]() throw no exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  FALSE |>
    exception[['FirstQuartileMissingException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['FirstQuartileMissingException']]() throw numeric exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  TRUE |>
    exception[['FirstQuartileMissingException']]() |>
      expect_error('first quartile missing')
})

# Third Quartile Missing Exception
test_that("exception instance has numeric exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  exception[['ThirdQuartileMissingException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['ThirdQuartileMissingException']]() throw no exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  FALSE |>
    exception[['ThirdQuartileMissingException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['ThirdQuartileMissingException']]() throw numeric exception",{
  # Given
  exception <- IQR.Exceptions()

  # Then
  TRUE |>
    exception[['ThirdQuartileMissingException']]() |>
      expect_error('third quartile missing')
})
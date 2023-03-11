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
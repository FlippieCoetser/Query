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
test_that('exceptions contains Null exception',{
  # Given
  exceptions <- String.Utility.Exceptions()

  # Then
  exceptions[['NullException']] |>
    Exist()          |>
      expect_equal(TRUE)
})
test_that("FALSE |> exception[['NullExceptions']]() throws no exception",{
  # Given
  exception <- String.Utility.Exceptions()

  # Then 
  FALSE |>
    exception[['NullException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['NullExceptions']]() throws Null exception",{
  # Given
  exception <- String.Utility.Exceptions()
  error     <- 'argument is NULL'

  # Then 
  TRUE |>
    exception[['NullException']]() |>
      expect_error(error)
})
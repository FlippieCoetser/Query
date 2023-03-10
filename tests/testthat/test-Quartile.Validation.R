test_that("Quartile.Validation exist",{
  Quartile.Validation |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("Quartile.Validation() returns list of validators",{
  Quartile.Validation() |>
    is.list()        |>
      expect_equal(TRUE)
})

# Data Exist Validator
test_that("validator instance has Exist validator",{
  # Given
  validator <- Quartile.Validation()

  # Then
  validator[["Exist"]]  |>
    is.null()           |>
      expect_equal(FALSE)
})
test_that("data |> validator[['Exist']]() should throw error when data is null",{
  # Given
  validator <- Quartile.Validation()

  # THEN
  NULL |>
    validator[['Exist']]() |>
      expect_error()
})

# Data Is Numeric Validator
test_that("validator instance has IsNumeric validator",{
  # Given
  validator <- Quartile.Validation()

  # Then
  validator[["IsNumeric"]]  |>
    is.null()               |>
      expect_equal(FALSE)
})
test_that("data |> validator[['IsNumeric']]() should throw error when data is string",{
  # Given
  validator <- Quartile.Validation()

  # Then
  '' |>
    validator[['IsNumeric']]() |>
      expect_error()
})

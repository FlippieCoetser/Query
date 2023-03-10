test_that("IQR.Validation exist",{
  IQR.Validation |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("IQR.Validation() returns list of validators",{
  IQR.Validation() |>
    is.list()        |>
      expect_equal(TRUE)
})

# Exist Validator
test_that("validator instance has Exist validator",{
  # Given
  validator <- IQR.Validation()

  # Then
  validator[["Exist"]]  |>
    is.null()           |>
      expect_equal(FALSE)
})
test_that("data |> validator[['Exist']]() should throw error when data is null",{
  # Given
  validator <- IQR.Validation()

  # THEN
  NULL |>
    validator[['Exist']]() |>
      expect_error()
})

# Is Numeric Validator
test_that("validator instance has IsNumeric validator",{
  # Given
  validator <- IQR.Validation()

  # Then
  validator[["IsNumeric"]]  |>
    is.null()               |>
      expect_equal(FALSE)
})
test_that("data |> validator[['IsNumeric']]() should throw error when data is string",{
  # Given
  validator <- IQR.Validation()

  # Then
  '' |>
    validator[['IsNumeric']]() |>
      expect_error()
})

# Is Numeric Validator
test_that("validator instance has IsList validator",{
  # Given
  validator <- IQR.Validation()

  # Then
  validator[["IsList"]]  |>
    is.null()               |>
      expect_equal(FALSE)
})
test_that("data |> validator[['IsList']]() should throw error when data is number",{
  # Given
  validator <- IQR.Validation()

  # Then
  8 |>
    validator[['IsList']]() |>
      expect_error()
})

# Has First Quartile
test_that("validator instance has HasFirstQuartile validator",{
  # Given
  validator <- IQR.Validation()

  # Then
  validator[['HasFirstQuartile']]  |>
    is.null()               |>
      expect_equal(FALSE)
})
test_that("data |> validator[['HasFirstQuartile']]() should throw error when data has no first member",{
  # Given
  validator <- IQR.Validation()

  # When
  quartiles <- list()

  # Then
  quartiles |>
    validator[['HasFirstQuartile']]() |>
        expect_error()
})
test_that("data |> validator[['HasFirstQuartile']]() should not throw exception when data has first member",{
  # Given
  validator <- IQR.Validation()

  # When
  quartiles <- list()
  quartiles[['first']] <- 8

  # Then
  quartiles |>
    validator[['HasFirstQuartile']]() |>
      expect_no_error()
})

# Has Third Quartile
test_that("validator instance has HasThirdQuartile validator",{
  # Given
  validator <- IQR.Validation()

  # Then
  validator[['HasThirdQuartile']]  |>
    is.null()               |>
      expect_equal(FALSE)
})
test_that("data |> validator[['HasThirdQuartile']]() should throw error when data has no third member",{
  # Given
  validator <- IQR.Validation()

  # When
  quartiles <- list()

  # Then
  quartiles |>
    validator[['HasThirdQuartile']]() |>
        expect_error()
})
test_that("data |> validator[['HasThirdQuartile']]() should not throw exception when data has third member",{
  # Given
  validator <- IQR.Validation()

  # When
  quartiles <- list()
  quartiles[['third']] <- 8

  # Then
  quartiles |>
    validator[['HasThirdQuartile']]() |>
      expect_no_error()
})
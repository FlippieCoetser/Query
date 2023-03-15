test_that('Utility.Validation exist',{
  Utility.Validation   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('Utility.Validation() return list of validators',{
  Utility.Validation() |>
    is.list() |>
      expect_equal(TRUE)
})

# Exist Validator
test_that("validator instance has Exist validator",{
  # Given
  validator <- Utility.Validation()

  # Then
  validator[["Exist"]]  |>
    is.null()           |>
      expect_equal(FALSE)
})
test_that("data |> validator[['Exist']]() should throw error when data is null",{
  # Given
  validator <- Utility.Validation()

  # THEN
  NULL |>
    validator[['Exist']]() |>
      expect_error()
})

# Is Character Validator
test_that("validator instance has IsCharacter validator",{
  # Given
  validator <- Utility.Validation()

  # Then
  validator[["IsCharacter"]]  |>
    is.null()               |>
      expect_equal(FALSE)
})
test_that("data |> validator[['IsCharacter']]() should throw error when data is not character",{
  # Given
  validator <- Utility.Validation()

  # Then
  1 |>
    validator[['IsCharacter']]() |>
      expect_error()
})

# Is List Validator
test_that("validator instance has IsList validator",{
  # Given
  validator <- Utility.Validation()

  # Then
  validator[["IsList"]]  |>
    is.null()               |>
      expect_equal(FALSE)
})
test_that("data |> validator[['IsList']]() should throw error when data is not character",{
  # Given
  validator <- Utility.Validation()

  # Then
  1 |>
    validator[['IsList']]() |>
      expect_error()
})

# Is Vector Validator
test_that("validator instance has IsVector validator",{
  # Given
  validator <- Utility.Validation()

  # Then
  validator[["IsVector"]]   |>
    is.null()               |>
      expect_equal(FALSE)
})
test_that("data |> validator[['IsVector']]() should throw exception when data is not a vector",{
  # Given
  validator <- Utility.Validation()

  # Then
  1 |>
    validator[['IsVector']]() |>
      expect_error()
})
test_that("data |> validator[['IsVector']]() should not throw exception when data is a vector",{
  # Given
  validator <- Utility.Validation()

  # Then
  c(1) |>
    validator[['IsVector']]() |>
      expect_no_error()
})

# Is List or Vector Validator
test_that("validator instance has IsListOrVector validator",{
  # Given
  validator <- Utility.Validation()

  # Then
  validator[["IsListOrVector"]]   |>
    is.null()               |>
      expect_equal(FALSE)
})
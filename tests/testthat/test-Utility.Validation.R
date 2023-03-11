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
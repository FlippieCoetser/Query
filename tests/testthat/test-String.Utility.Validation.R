test_that('String.Utility.Validation exist',{
  String.Utility.Validation   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Validation() return list of validators',{
  String.Utility.Validation() |>
    is.list() |>
      expect_equal(TRUE)
})

# Exist Validator
test_that('validators contains Exist validator',{
  # Given
  validators <- String.Utility.Validation()

  # Then
  validators[['Exist']] |>
    Exist()             |>
      expect_equal(TRUE)
})
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
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
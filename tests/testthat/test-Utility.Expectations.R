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
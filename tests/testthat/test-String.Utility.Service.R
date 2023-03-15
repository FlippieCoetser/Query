test_that('String.Utility.Service exist',{
  String.Utility.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Service() return list of services',{
  String.Utility.Service() |>
    is.list() |>
      expect_equal(TRUE)
})
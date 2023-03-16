test_that('String.Utility.Processing exist',{
  String.Utility.Processing   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Processing() return list of processors',{
  String.Utility.Processing() |>
    is.list() |>
      expect_equal(TRUE)
})
test_that('DML.Service exist',{
  DML.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('DML.Service() return list of services',{
  DML.Service() |>
    is.list() |>
      expect_equal(TRUE)
})
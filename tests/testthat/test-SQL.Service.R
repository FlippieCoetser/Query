test_that('SQL.Service exist',{
  SQL.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('SQL.Service() return list of services',{
  SQL.Service() |>
    is.list() |>
      expect_equal(TRUE)
})
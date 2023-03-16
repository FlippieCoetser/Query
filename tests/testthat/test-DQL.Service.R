test_that('DQL.Service exist',{
  DQL.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('DQL.Service() return list of services',{
  DQL.Service() |>
    is.list() |>
      expect_equal(TRUE)
})
test_that('String.Utility.Broker exist',{
  String.Utility.Broker   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Broker() return list of operations',{
  String.Utility.Broker() |>
    is.list() |>
      expect_equal(TRUE)
})
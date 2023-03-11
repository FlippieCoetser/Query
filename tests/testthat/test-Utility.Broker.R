test_that('Utility.Broker exist',{
  Utility.Broker |>
    is.null()    |>
      expect_equal(FALSE)
})
test_that('Utility.Broker() return list of operations',{
  Utility.Broker() |>
    is.list()      |>
      expect_equal(TRUE)
})

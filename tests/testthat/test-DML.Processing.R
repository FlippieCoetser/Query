test_that('DML.Processing exist',{
  DML.Processing   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('DML.Processing() return list of processors',{
  DML.Processing() |>
    is.list() |>
      expect_equal(TRUE)
})
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

# INSERT SQL Statement
test_that('processors contains INSERT processor',{
  # Given
  processor <- DML.Processing()

  # Then
  processor[['INSERT']] |>
    Exist()           |>
      expect_equal(TRUE)
})
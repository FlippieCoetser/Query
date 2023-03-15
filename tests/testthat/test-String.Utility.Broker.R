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

# Append Operation
test_that('broker instance has Append operation',{
  # Given
  broker <- String.Utility.Broker()

  # Then
  broker[['Append']] |>
    Exist()          |>
      expect_equal(TRUE)
})
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

# Inclose Operation
test_that('broker instance has Inclose operation',{
  # Given
  broker <- String.Utility.Broker()

  # Then
  broker[['Inclose']] |>
    Exist()          |>
      expect_equal(TRUE)
})
test_that("field |> broker[['Inclose']](before, after) inclose field with before and after",{
  # Given
  broker <- String.Utility.Broker()

  # When
  field  <- 'field'
  before <- 'before'
  after  <- 'after'

  # Then
  field |>
    broker[['Inclose']](before,after) |>
      expect_equal('beforefieldafter')
})
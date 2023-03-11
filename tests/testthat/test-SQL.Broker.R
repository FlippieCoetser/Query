test_that("SQL.Broker exist",{
  SQL.Broker |>
    is.null()  |>
      expect_equal(FALSE)
})
test_that("SQL.Broker() returns list of operations",{
  SQL.Broker() |>
    is.list()    |>
      expect_equal(TRUE)
})

# INCLOSE
test_that('broker instance has INCLOSE operation',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['INCLOSE']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> broker[['INCLOSE']]() Inclose field with square brackets",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  broker <- SQL.Broker()

  field  <- 'field'

  # When
  expected <- field |> utilities[['Prepend']]('[') |> utilities[['Prepend']](']')

  # Then
  field |>
    broker[['INCLOSE']]() |>
      expect_equal(expected) 
})

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
  expected <- field |> utilities[['Prepend']]('[') |> utilities[['Append']](']')

  # Then
  field |>
    broker[['INCLOSE']]() |>
      expect_equal(expected) 
})

# LOWER
test_that('broker instance has LOWER operation',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['LOWER']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> broker[['LOWER']]() Inject field into lower() as alias SQL Statement",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  broker <- SQL.Broker()

  field  <- 'field'
  alias <- 'alias'

  # When
  expected <- field |> 
    utilities[['Prepend']]('LOWER(') |> 
    utilities[['Append']](') as ')   |> 
    utilities[['Append']](alias)

  # Then
  field |>
    broker[['LOWER']](alias) |>
      expect_equal(expected) 
})

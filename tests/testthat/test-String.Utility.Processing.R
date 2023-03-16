test_that('String.Utility.Processing exist',{
  String.Utility.Processing   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Processing() return list of processors',{
  String.Utility.Processing() |>
    is.list() |>
      expect_equal(TRUE)
})

# Append Processor
test_that('processors contain Append processor',{
  # Given 
  processor <- 
    String.Utility.Service()
    String.Utility.Processing()

  # Then
  processor[['Append']] |>
    Exist()              |>
      expect_equal(TRUE)
})
test_that("field |> processor[['Append']](string) appends string to end of field",{
  # Given 
  processor <- 
    String.Utility.Service()
    String.Utility.Processing()

  # When
  field  <- 'field'
  string <- 'string'

  # Then
  field |>
    processor[['Append']](string) |>
      expect_equal('fieldstring')
})

# Prepend Processor
test_that('processors contain Prepend processor',{
  # Given 
  processor <- 
    String.Utility.Service()
    String.Utility.Processing()

  # Then
  processor[['Prepend']] |>
    Exist()              |>
      expect_equal(TRUE)
})
test_that("field |> processor[['Prepend']](string) appends string to start of field",{
  # Given 
  processor <- 
    String.Utility.Service()
    String.Utility.Processing()

  # When
  field  <- 'field'
  string <- 'string'

  # Then
  field |>
    processor[['Prepend']](string) |>
      expect_equal('stringfield')
})

# Inclose Processor
test_that('processors contain Inclose processor',{
  # Given 
  processor <- 
    String.Utility.Service()
    String.Utility.Processing()

  # Then
  processor[['Inclose']] |>
    Exist()              |>
      expect_equal(TRUE)
})
test_that("field |> processor[['Inclose']]() inclose field with square brackets",{
  # Given
  service <- 
    String.Utility.Service() |>
    String.Utility.Processing()

  # When
  field  <- 'field'

  # Then
  field |>
    service[['Inclose']]() |>
      expect_equal('[field]')
})
test_that("field |> processor[['Inclose']](type = 'Round') inclose field with round brackets",{
  # Given
  service <- 
    String.Utility.Service() |>
    String.Utility.Processing()

  # When
  field  <- 'field'
  type   <- 'Round'

  # Then
  field |>
    service[['Inclose']](type) |>
      expect_equal('(field)')
})
test_that("field |> processor[['Inclose']](type = 'Quotes') inclose field with quotes",{
  # Given
  service <- 
    String.Utility.Service() |>
    String.Utility.Processing()

  # When
  field  <- 'field'
  type   <- 'Quotes'

  # Then
  field |>
    service[['Inclose']](type) |>
      expect_equal("'field'")
})

# Collapse Processor
test_that('processors contain Collapse processor',{
  # Given 
  processor <- 
    String.Utility.Service()
    String.Utility.Processing()

  # Then
  processor[['Collapse']] |>
    Exist()              |>
      expect_equal(TRUE)
})
test_that("fields |> processor[['Collapse']]() collapse items using comma separator",{
  # Given 
  processor <- 
    String.Utility.Service()
    String.Utility.Processing()

  fields  <- list(
    'one',
    'two',
    'three'
  )

  # When
  expected <- "one, two, three"

  # Then
  fields |>
    processor[['Collapse']]() |>
      expect_equal(expected) 
})
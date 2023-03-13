test_that('Utility.Processing exist',{
  Utility.Processing   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('Utility.Processing() return list of processors',{
  Utility.Processing() |>
    is.list() |>
      expect_equal(TRUE)
})

# Prepend
test_that('processor instance has Prepend processor',{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  # Then
  processor[['Prepend']] |>
    is.null()          |>
      expect_equal(FALSE)
})
test_that("field |> processor[['Prepend']](string) Prepends string to field",{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- string |> paste(field, sep = '')

  # Then
  field |>
    processor[['Prepend']](string) |>
      expect_equal(expected) 
})

# Append
test_that('processor instance has Append processor',{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  # Then
  processor[['Append']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> processor[['Append']](string) Append string to field",{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- field |> paste(string, sep = '')

  # Then
  field |>
    processor[['Append']](string) |>
      expect_equal(expected) 
})

# Inclose
test_that('processor instance has Inclose processor',{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  # Then
  processor[['Inclose']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> processor[['Inclose']]() inclose field in square brackets",{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  field  <- 'field'

  # When
  expected <- '[field]'

  # Then
  field |>
    processor[['Inclose']]() |>
      expect_equal(expected) 
})
test_that("field |> processor[['Inclose']]('Round') inclose field in round brackets",{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  field  <- 'field'

  # When
  expected <- '(field)'

  # Then
  field |>
    processor[['Inclose']]('Round') |>
      expect_equal(expected) 
})
test_that("field |> processor[['Inclose']]('Quotes') inclose field in quotes",{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  field  <- 'field'

  # When
  expected <- "'field'"

  # Then
  field |>
    processor[['Inclose']]('Quotes') |>
      expect_equal(expected) 
})

# CollapseWithComma
test_that('processor instance has CollapseWithComma processor',{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  # Then
  processor[['CollapseWithComma']] |>
    is.null()          |>
      expect_equal(FALSE)
})
test_that("fields |> processor[['CollapseWithComma']]() collapse items in fields using comma separator",{
  # Given
  processor <- 
    Utility.Broker()  |>
    Utility.Service() |>
    Utility.Processing()

  fields  <- list(
    'one',
    'two',
    'three'
  )

  # When
  expected <- "one, two, three"

  # Then
  fields |>
    processor[['CollapseWithComma']]() |>
      expect_equal(expected) 
})
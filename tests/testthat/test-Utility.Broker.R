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

# Prepend
test_that('broker instance has Prepend operation',{
  # Given
  broker <- Utility.Broker()

  # Then
  broker[['Prepend']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> broker[['Prepend']](string) Prepends string to field",{
  # Given
  broker <- Utility.Broker()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- string |> paste(field, sep = '')

  # Then
  field |>
    broker[['Prepend']](string) |>
      expect_equal(expected) 
})

# Append
test_that('broker instance has Append operation',{
  # Given
  broker <- Utility.Broker()

  # Then
  broker[['Append']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> broker[['Append']](string) Append string to field",{
  # Given
  broker <- Utility.Broker()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- field |> paste(string, sep = '')

  # Then
  field |>
    broker[['Append']](string) |>
      expect_equal(expected) 
})

# IncloseInSquareBrackets
test_that('broker instance has IncloseInSquareBrackets operation',{
  # Given
  broker <- Utility.Broker()

  # Then
  broker[['IncloseInSquareBrackets']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> broker[['IncloseInSquareBrackets']]() inclose field in square brackets",{
  # Given
  broker <- Utility.Broker()

  field  <- 'field'

  # When
  expected <- '[field]'

  # Then
  field |>
    broker[['IncloseInSquareBrackets']]() |>
      expect_equal(expected) 
})

# IncloseInRoundBrackets
test_that('broker instance has IncloseInRoundBrackets operation',{
  # Given
  broker <- Utility.Broker()

  # Then
  broker[['IncloseInRoundBrackets']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> broker[['IncloseInRoundBrackets']]() inclose field in round brackets",{
  # Given
  broker <- Utility.Broker()

  field  <- 'field'

  # When
  expected <- '(field)'

  # Then
  field |>
    broker[['IncloseInRoundBrackets']]() |>
      expect_equal(expected) 
})

# IncloseInQuotes
test_that('broker instance has IncloseInQuotes operation',{
  # Given
  broker <- Utility.Broker()

  # Then
  broker[['IncloseInQuotes']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> broker[['IncloseInQuotes']]() inclose field in quotes",{
  # Given
  broker <- Utility.Broker()

  field  <- 'field'

  # When
  expected <- "'field'"

  # Then
  field |>
    broker[['IncloseInQuotes']]() |>
      expect_equal(expected) 
})

# CollapseWithComma
test_that('broker instance has CollapseWithComma operation',{
  # Given
  broker <- Utility.Broker()

  # Then
  broker[['CollapseWithComma']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("fields |> broker[['CollapseWithComma']]() collapse items in fields using comma separator",{
  # Given
  broker <- Utility.Broker()

  fields  <- list(
    'one',
    'two',
    'three'
  )

  # When
  expected <- "one, two, three"

  # Then
  fields |>
    broker[['CollapseWithComma']]() |>
      expect_equal(expected) 
})
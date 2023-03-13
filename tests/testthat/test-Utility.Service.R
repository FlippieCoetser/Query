test_that('Utility.Service exist',{
  Utility.Service |>
    is.null()     |>
      expect_equal(FALSE)
})
test_that('Utility.Service() return list of services',{
  Utility.Service() |>
    is.list()       |>
      expect_equal(TRUE)
})

# Prepend
test_that('service instance has Prepend service',{
  # Given
  service <- Utility.Service()

  # Then
  service[['Prepend']] |>
    is.null()          |>
      expect_equal(FALSE)
})
test_that("field |> service[['Prepend']](string) Prepends string to field",{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- string |> paste(field, sep = '')

  # Then
  field |>
    service[['Prepend']](string) |>
      expect_equal(expected) 
})

# Append
test_that('service instance has Append service',{
  # Given
  service <- Utility.Service()

  # Then
  service[['Append']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> service[['Append']](string) Append string to field",{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  field  <- 'field'
  string <- 'string'

  # When
  expected <- field |> paste(string, sep = '')

  # Then
  field |>
    service[['Append']](string) |>
      expect_equal(expected) 
})

# IncloseInSquareBrackets
test_that('service instance has IncloseInSquareBrackets service',{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  # Then
  service[['IncloseInSquareBrackets']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> service[['IncloseInSquareBrackets']]() inclose field in square brackets",{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  field  <- 'field'

  # When
  expected <- '[field]'

  # Then
  field |>
    service[['IncloseInSquareBrackets']]() |>
      expect_equal(expected) 
})

# IncloseInRoundBrackets
test_that('service instance has IncloseInRoundBrackets service',{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  # Then
  service[['IncloseInRoundBrackets']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> service[['IncloseInRoundBrackets']]() inclose field in round brackets",{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  field  <- 'field'

  # When
  expected <- '(field)'

  # Then
  field |>
    service[['IncloseInRoundBrackets']]() |>
      expect_equal(expected) 
})

# IncloseInQuotes
test_that('service instance has IncloseInQuotes service',{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  # Then
  service[['IncloseInQuotes']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("field |> service[['IncloseInQuotes']]() inclose field in quotes",{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  field  <- 'field'

  # When
  expected <- "'field'"

  # Then
  field |>
    service[['IncloseInQuotes']]() |>
      expect_equal(expected) 
})

# CollapseWithComma
test_that('service instance has CollapseWithComma service',{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  # Then
  service[['CollapseWithComma']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("fields |> service[['CollapseWithComma']]() collapse items in fields using comma separator",{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  fields  <- list(
    'one',
    'two',
    'three'
  )

  # When
  expected <- "one, two, three"

  # Then
  fields |>
    service[['CollapseWithComma']]() |>
      expect_equal(expected) 
})
test_that("fields |> service[['CollapseWithComma']]() throws exception if fields in not list",{
  # Given
  service <- 
    Utility.Broker()  |>
    Utility.Service()

  fields  <- 1

  # Then
  fields |>
    service[['CollapseWithComma']]() |>
      expect_error() 
})
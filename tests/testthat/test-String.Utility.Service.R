test_that('String.Utility.Service exist',{
  String.Utility.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Service() return list of services',{
  String.Utility.Service() |>
    is.list() |>
      expect_equal(TRUE)
})

test_that('services contains Append service',{
  # Given
  service <- 
    String.Utility.Service()

  # Then
  service[['Append']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("field |> service[['Append']](string) appends string to end of field",{
  # Given
  service <- 
    String.Utility.Service()

  # When
  field <- 'field'
  string <- 'string'

  # Then
  field |>
    service[['Append']](string) |>
      expect_equal('fieldstring')
})
test_that("field |> service[['Append']](string) throws error if field null",{
  # Given
  service <- 
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field <- NULL
  string <- 'string'

  # Then
  field |>
    service[['Append']](string) |>
      expect_error(error)
})
test_that("field |> service[['Append']](string) throws error if string null",{
  # Given
  service <- 
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field <- 'field' 
  string <- NULL

  # Then
  field |>
    service[['Append']](string) |>
      expect_error(error)
})

# Prepend Operation
test_that('services contains Prepend service',{
  # Given
  service <- 
    String.Utility.Service()

  # Then
  service[['Prepend']] |>
    Exist()            |>
      expect_equal(TRUE)
})
test_that("field |> service[['Prepend']](string) appends string to front of field",{
  # Given
  service <- 
    String.Utility.Service()

  # When
  field <- 'field'
  string <- 'string'

  # Then
  field |>
    service[['Prepend']](string) |>
      expect_equal('stringfield')
})
test_that("field |> service[['Prepend']](string) throws error if field null",{
  # Given
  service <- 
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field <- NULL
  string <- 'string'

  # Then
  field |>
    service[['Prepend']](string) |>
      expect_error(error)
})
test_that("field |> service[['Prepend']](string) throws error if string null",{
  # Given
  service <- 
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field <- 'field'
  string <- NULL

  # Then
  field |>
    service[['Prepend']](string) |>
      expect_error(error)
})

# Inclose Service
test_that('services instance has Inclose service',{
  # Given
  service <- 
    String.Utility.Service()

  # Then
  service[['Inclose']] |>
    Exist()            |>
      expect_equal(TRUE)
})
test_that("field |> service[['Inclose']](before, after) inclose field with before and after",{
  # Given
  service <- 
    String.Utility.Service()

  # When
  field  <- 'field'
  before <- 'before'
  after  <- 'after'

  # Then
  field |>
    service[['Inclose']](before,after) |>
      expect_equal('beforefieldafter')
})
test_that("field |> service[['Inclose']](before, after) throws error if field null",{
  # Given
  service <- 
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field  <- NULL
  before <- 'before'
  after  <- 'after'

  # Then
  field |>
    service[['Inclose']](before,after) |>
      expect_error(error)
})
test_that("field |> service[['Inclose']](before, after) throws error if before null",{
  # Given
  service <- 
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field  <- 'field'
  before <- NULL
  after  <- 'after'

  # Then
  field |>
    service[['Inclose']](before,after) |>
      expect_error(error)
})
test_that("field |> service[['Inclose']](before, after) throws error if before is not character",{
  # Given
  service <- 
    String.Utility.Service()

  error <- 'argument is not a String'

  # When
  field  <- 'field'
  before <- 1
  after  <- 'after'

  # Then
  field |>
    service[['Inclose']](before,after) |>
      expect_error(error)
})
test_that("field |> service[['Inclose']](before, after) throws error if after null",{
  # Given
  service <- 
    String.Utility.Service()

  error <- 'argument is NULL'

  # When
  field  <- 'field'
  before <- 'before'
  after  <- NULL

  # Then
  field |>
    service[['Inclose']](before,after) |>
      expect_error(error)
})
test_that("field |> service[['Inclose']](before, after) throws error if after is not character",{
  # Given
  service <- 
    String.Utility.Service()

  error <- 'argument is not a String'

  # When
  field  <- 'field'
  before <- 'before'
  after  <- 1

  # Then
  field |>
    service[['Inclose']](before,after) |>
      expect_error(error)
})

# Collapse Service
test_that('services instance has Collapse service',{
  # Given
  service <- 
    String.Utility.Service()

  # Then
  service[['Collapse']] |>
    Exist()            |>
      expect_equal(TRUE)
})
test_that("fields |> service[['Collapse']]() collapse items using comma separator",{
  # Given
  service <- 
    String.Utility.Service()

  fields  <- list(
    'one',
    'two',
    'three'
  )

  # When
  expected <- "one, two, three"

  # Then
  fields |>
    service[['Collapse']]() |>
      expect_equal(expected) 
})

# CreateKeyValuePair Service
test_that('services instance has CreateKeyValuePairs service',{
  # Given
  service <- 
    String.Utility.Service()

  # Then
  service[['CreateKeyValuePairs']] |>
    Exist()            |>
      expect_equal(TRUE)
})
test_that("keys |> service[['CreateKeyValuePairs']](values) creates key value pairs",{
  # Given
  service <- 
    String.Utility.Service()

  keys  <- list(
    1,
    2,
    3
  )

  values  <- list(
    'one',
    'two',
    'three'
  )

  # When
  expected <- c(
    '1 = one',
    '2 = two',
    '3 = three'
  )

  # Then
  keys |>
    service[['CreateKeyValuePairs']](values) |>
      expect_equal(expected) 
})
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

  field  <- '[field]'
  alias <- 'alias'

  # When
  expected <- 'LOWER([field]) as alias'

  # Then
  field |>
    broker[['LOWER']](alias) |>
      expect_equal(expected) 
})

# SELECT
test_that('broker instance has SELECT operation',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['SELECT']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("fields |> broker[['SELECT']]() Prepend SELECT statement to a collapsed list of fields",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  broker <- SQL.Broker()

  fields <- c(
    'Id'             |> broker[['INCLOSE']]() |> broker[['LOWER']]('Id'),
    'Username'       |> broker[['INCLOSE']](),
    'HashedPassword' |> broker[['INCLOSE']](),
    'Salt'           |> broker[['INCLOSE']]() |> broker[['LOWER']]('Salt'))

  # When
  expected <- fields |> paste(collapse = ', ') |> utilities[['Prepend']]('SELECT ')

  # Then
  fields |>
    broker[['SELECT']]() |>
      expect_equal(expected) 
})

# FROM
test_that('broker instance has FROM operation',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['FROM']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("table |> broker[['FROM']]() Append table after FROM statement",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  broker <- SQL.Broker()

  fields <- c(
    'Id'             |> broker[['INCLOSE']]() |> broker[['LOWER']]('Id'),
    'Username'       |> broker[['INCLOSE']](),
    'HashedPassword' |> broker[['INCLOSE']](),
    'Salt'           |> broker[['INCLOSE']]() |> broker[['LOWER']]('Salt'))

  select <- fields |> broker[['SELECT']]()
  table  <- 'table'

  # When
  expected <- 
    table |> 
      broker[['INCLOSE']]() |>
      utilities[['Prepend']](' FROM [dbo].') |> 
      utilities[['Prepend']](select)

  # Then
  select |>
    broker[['FROM']](table) |>
      expect_equal(expected) 
})

# WHERE
test_that('broker instance has WHERE operation',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['WHERE']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("from |> broker[['WHERE']](field, value) Inject where field equals value SQL Statement",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  broker <- SQL.Broker()

  fields <- c(
    'Id'             |> broker[['INCLOSE']]() |> broker[['LOWER']]('Id'),
    'Username'       |> broker[['INCLOSE']](),
    'HashedPassword' |> broker[['INCLOSE']](),
    'Salt'           |> broker[['INCLOSE']]() |> broker[['LOWER']]('Salt'))

  select <- fields |> broker[['SELECT']]()
  table  <- 'User'
  from   <- select |> broker[['FROM']](table)
  field  <- 'Id'
  value  <- 'b2970410-bd60-478d-baf6-46cbc14e10fc'

  # When
  expected <- 
    field |> 
      broker[['INCLOSE']]()             |>
      utilities[['Prepend']](' WHERE')  |> 
      utilities[['Append']](" = '")     |>
      utilities[['Append']](value)      |>
      utilities[['Append']]("'")        |>
      utilities[['Prepend']](from)

  # Then
  from |>
    broker[['WHERE']](field, value) |>
      expect_equal(expected) 
})

# INSERT
test_that('broker instance has INSERT operation',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['INSERT']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("table |> broker[['INSERT']](fields) append collapsed list for fields to Insert into table SQL Statement",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  broker <- SQL.Broker()

  table <- 'User'
  fields <- c(
    'Id'             |> broker[['INCLOSE']](),
    'Username'       |> broker[['INCLOSE']](),
    'HashedPassword' |> broker[['INCLOSE']](),
    'Salt'           |> broker[['INCLOSE']]())

  expected <- 
    fields |> 
      paste(collapse = ', ') |> 
      utilities[['Prepend']]('] (') |> 
      utilities[['Append']](')') |>
      utilities[['Prepend']](table) |>
      utilities[['Prepend']]('INSERT INTO [dbo].[')

  # WHEN
  table |>
    broker[['INSERT']](fields) |>
      expect_equal(expected)
})

# VALUES
test_that('broker instance has VALUES operation',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['VALUES']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("insert |> broker[['VALUES']](values) append collapsed list for fields to Insert into table SQL Statement",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  broker <- SQL.Broker()

  values <- list(
    '4a0ec243-78ff-4461-8696-c41e7d64e108',
    'test@gmail.com',
    '2d2ee7bee3ae4795ba886ceffa3f03d0b1eeaf75fc9c19c4b22c06956e2d6d54a5a6b798a70758f6aae5918bbc42d91b44cd1ea2f6a445669cc3a5acc852f255',
    '53dfd42f-5394-46d7-a917-11b7da15816d')
  insert <- 'insert'

  expected <- 
    "'" |>
      paste(values, sep = '') |>
      paste("'", sep = '')    |>
      paste(collapse = ', ')  |>
      utilities[['Prepend']](' VALUES (') |>
      utilities[['Append']](')') |>
      utilities[['Prepend']](insert) 

  # Then
  insert |>
    broker[['VALUES']](values) |>
      expect_equal(expected)
})

# UTILITIES
test_that('broker instance has UTILITIES operation',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['UTILITIES']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that('broker[["UTILITIES"]] return list of operations',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['UTILITIES']] |>
    is.list()         |>
      expect_equal(TRUE)
})
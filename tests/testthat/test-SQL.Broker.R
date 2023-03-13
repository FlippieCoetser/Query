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

  fields <- list(
    'Id'             |> broker[['INCLOSE']]() |> broker[['LOWER']]('Id'),
    'Username'       |> broker[['INCLOSE']](),
    'HashedPassword' |> broker[['INCLOSE']](),
    'Salt'           |> broker[['INCLOSE']]() |> broker[['LOWER']]('Salt'))

  # When
  expected <- fields |> paste(collapse = ', ') |> utilities[['Prepend']]('SELECT ') |> utilities[['Append']](' ')

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

  fields <- list(
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
      utilities[['Prepend']]('FROM [dbo].') |> 
      utilities[['Prepend']](select)  |>
      utilities[['Append']](' ')

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
    Utility.Service() |>
    Utility.Processing()

  broker <- SQL.Broker()

  fields <- list(
    'Id'             |> broker[['INCLOSE']]() |> broker[['LOWER']]('Id'),
    'Username'       |> broker[['INCLOSE']](),
    'HashedPassword' |> broker[['INCLOSE']](),
    'Salt'           |> broker[['INCLOSE']]() |> broker[['LOWER']]('Salt'))

  from   <- 
    fields |> 
    broker[['SELECT']]() |> 
    broker[['FROM']]('User')

  field  <- 'Id'

  value  <- 'b2970410-bd60-478d-baf6-46cbc14e10fc' |> utilities[['Inclose']]('Quotes')

  # When
  expected <- 
    field |> 
      utilities[['Inclose']]()          |>
      utilities[['Prepend']]('WHERE ')  |> 
      utilities[['Append']](" = ")      |>
      utilities[['Append']](value)      |>
      utilities[['Prepend']](from)      |>
      utilities[['Append']](' ')

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

  table <- 'User' |> broker[['INCLOSE']]()
  fields <- list(
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
      utilities[['Prepend']]('INSERT INTO [dbo].[') |>
      utilities[['Append']](' ')

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
    Utility.Broker()  |> 
    Utility.Service() |>
    Utility.Processing()

  broker <- SQL.Broker()

  values <- list(
    '4a0ec243-78ff-4461-8696-c41e7d64e108' |> utilities[['Inclose']]('Quotes'),
    'test@gmail.com'                       |> utilities[['Inclose']]('Quotes'),
    '2d2ee7bee3ae4795ba886ceffa3f03d0b155' |> utilities[['Inclose']]('Quotes'),
    '53dfd42f-5394-46d7-a917-11b7da15816d' |> utilities[['Inclose']]('Quotes'))
  insert <- 'insert'

  expected <- 
    values |>
      utilities[['Collapse']]() |>
      utilities[['Inclose']]('Round')    |>
      utilities[['Prepend']]('VALUES ') |>
      utilities[['Prepend']](insert) |>
      utilities[['Append']](' ')

  # Then
  insert |>
    broker[['VALUES']](values) |>
      expect_equal(expected)
})


# UPDATE
test_that('broker instance has UPDATE operation',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['UPDATE']] |>
    is.null()         |>
      expect_equal(FALSE)
})

# UPDATE
test_that("table |> broker[['UPDATE']]() injects table name and inserts an update SQL statement",{
  # Given
  broker <- SQL.Broker()

  table <- 'User'

  # When
  expected <- 'UPDATE [dbo].[User] '
  # Then
  table |>
    broker[['UPDATE']]() |>
      expect_equal(expected)
})

# UTILITIES
test_that('broker instance has UTILITIES',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['UTILITIES']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that('broker[["UTILITIES"]] return list of utility operations',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['UTILITIES']] |>
    is.list()         |>
      expect_equal(TRUE)
})

# SCHEMA UTILITY
test_that("broker[['UTILITIES']] has SCHEMA operation",{
  # Given
  broker <- SQL.Broker()
  utilities <- broker[['UTILITIES']]

  # Then
  utilities[['SCHEMA']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> utilities[['SCHEMA']](table) inclose table with square brackets and add default schema",{
  # Given
  broker <- SQL.Broker()
  utilities <- broker[['UTILITIES']]

  # When
  input  <- ''
  table  <- 'User'
  output <- '[dbo].[User] '
  
  # Then
  input |> 
    utilities[['SCHEMA']](table) |>
      expect_equal(output)
})

# INCLOSE UTILITY
test_that("broker[['UTILITIES']] has INCLOSE operation",{
  # Given
  broker <- SQL.Broker()
  utilities <- broker[['UTILITIES']]

  # Then
  utilities[['INCLOSE']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("field |> utilities[['INCLOSE']]() inclose field with square brackets",{
  # Given
  broker <- SQL.Broker()
  utilities <- broker[['UTILITIES']]

  # When
  field  <- 'Id'
  output <- '[Id]'
  
  # Then
  field |> 
    utilities[['INCLOSE']]() |>
      expect_equal(output)
})

# FUNCTIONS
test_that('broker instance has FUNCTIONS',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['FUNCTIONS']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that('broker[["FUNCTIONS"]] return list of operations',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['FUNCTIONS']] |>
    is.list()         |>
      expect_equal(TRUE)
})

# LOWER FUNCTION
test_that("broker[['FUNCTIONS']] has LOWER operation",{
  # Given
  broker <- SQL.Broker()
  utilities <- broker[['FUNCTIONS']]

  # Then
  utilities[['LOWER']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("field |> functions[['LOWER']]() Inject field into lower() as alias SQL Statement",{
  # Given
  broker <- SQL.Broker()
  functions <- broker[['FUNCTIONS']]

  # When
  field  <- 'Id'
  output <- 'LOWER(Id) as Id'
  
  # Then
  field |> 
    functions[['LOWER']](field) |>
      expect_equal(output)
})

# KEYWORDS
test_that('broker instance has KEYWORDS',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['KEYWORDS']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that('broker[["KEYWORDS"]] return list of operations',{
  # Given
  broker <- SQL.Broker()

  # Then
  broker[['KEYWORDS']] |>
    is.list()         |>
      expect_equal(TRUE)
})

# SELECT KEYWORD
test_that("broker[['KEYWORDS']] has SELECT operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  # Then
  keywords[['SELECT']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['SELECT']]() Inject SELECT and Prepend input",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  input <- 'input '
  output <- 'input SELECT '

  # Then
  input |>
    keywords[['SELECT']]() |>
      expect_equal(output)
})

# FROM KEYWORD
test_that("broker[['KEYWORDS']] has FROM operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  # Then
  keywords[['FROM']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['FROM']]() Inject FROM and Prepend input",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  input <- 'input '
  output <- 'input FROM '

  # Then
  input |>
    keywords[['FROM']]() |>
      expect_equal(output)
})

# WHERE KEYWORD
test_that("broker[['KEYWORDS']] has WHERE operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  # Then
  keywords[['WHERE']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['WHERE']]() Inject WHERE and Prepend input",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  input <- 'input '
  output <- 'input WHERE '

  # Then
  input |>
    keywords[['WHERE']]() |>
      expect_equal(output)
})

# INSERT KEYWORD
test_that("broker[['KEYWORDS']] has INSERT operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  # Then
  keywords[['INSERT']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['INSERT']]() Inject INSERT and Prepend input",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  input <- 'input '
  output <- 'input INSERT '

  # Then
  input |>
    keywords[['INSERT']]() |>
      expect_equal(output)
})

# VALUES KEYWORD
test_that("broker[['KEYWORDS']] has VALUES operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  # Then
  keywords[['VALUES']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['VALUES']]() Inject VALUES and Prepend input",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  input <- 'input '
  output <- 'input VALUES '

  # Then
  input |>
    keywords[['VALUES']]() |>
      expect_equal(output)
})

# UPDATE KEYWORD
test_that("broker[['KEYWORDS']] has UPDATE operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  # Then
  keywords[['UPDATE']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['UPDATE']]() Inject UPDATE and Prepend input",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  input <- 'input '
  output <- 'input UPDATE '

  # Then
  input |>
    keywords[['UPDATE']]() |>
      expect_equal(output)
})
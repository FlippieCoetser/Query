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

# SET KEYWORD
test_that("broker[['KEYWORDS']] has SET operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  # Then
  keywords[['SET']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['SET']]() Inject SET and Prepend input",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  input <- 'input '
  output <- 'input SET '

  # Then
  input |>
    keywords[['SET']]() |>
      expect_equal(output)
})

# INTO KEYWORD
test_that("broker[['KEYWORDS']] has INTO operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  # Then
  keywords[['INTO']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['INTO']]() Inject INTO and Prepend input",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['KEYWORDS']]

  input <- 'input '
  output <- 'input INTO '

  # Then
  input |>
    keywords[['INTO']]() |>
      expect_equal(output)
})

# COLUMNS UTILITY
test_that("broker[['UTILITIES']] has COLUMNS operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['UTILITIES']]

  # Then
  keywords[['COLUMNS']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['COLUMNS']]() Inject COLUMNS and Prepend input",{
  # Given
  broker <- SQL.Broker()
  utilities <- broker[['UTILITIES']]

  input <- 'input '
  columns  <- list(
    'one',
    'two',
    'three'
  )
  output <- "input one, two, three "

  # Then
  input |>
    utilities[['COLUMNS']](columns) |>
      expect_equal(output)
})

# KEYVALUE UTILITY
test_that("broker[['UTILITIES']] has KEYVALUE operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['UTILITIES']]

  # Then
  keywords[['KEYVALUE']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['KEYVALUE']]() Inject COLUMNS and Prepend input",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service() |>
    Utility.Processing()

  broker <- SQL.Broker()

  input <- ''
  key   <- 'Id'
  value <- 'b2970410-bd60-478d-baf6-46cbc14e10fc' |> utilities[['Inclose']]('Quotes')

  output <- "[Id] = 'b2970410-bd60-478d-baf6-46cbc14e10fc' "

  # Then
  input |>
    broker[['UTILITIES']][['KEYVALUE']](key,value) |>
      expect_equal(output)
})

# INCLOSELIST UTILITY
test_that("broker[['UTILITIES']] has INCLOSELIST operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['UTILITIES']]

  # Then
  keywords[['INCLOSELIST']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['INCLOSELIST']]() Inject COLUMNS and Prepend input",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service() |>
    Utility.Processing()

  broker <- SQL.Broker()

  input    <- ''
  columns  <- list(
    'Id'             |> utilities[['Inclose']](),
    'Username'       |> utilities[['Inclose']](),
    'HashedPassword' |> utilities[['Inclose']](),
    'Salt'           |> utilities[['Inclose']]()
  )

  output <- "([Id], [Username], [HashedPassword], [Salt]) "

  # Then
  input |>
    broker[['UTILITIES']][['INCLOSELIST']](columns) |>
      expect_equal(output)
})

# KEYVALUES UTILITY
test_that("broker[['UTILITIES']] has KEYVALUES operation",{
  # Given
  broker <- SQL.Broker()
  keywords <- broker[['UTILITIES']]

  # Then
  keywords[['KEYVALUES']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['KEYVALUES']](pairs) Inject Key Value Pairs and Prepend input",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service() |>
    Utility.Processing()

  broker <- SQL.Broker()

  input    <- ''
  pairs <- list(
    Username = 'test.updated@gmail.com' |> utilities[['Inclose']]('Quotes'),
    HashedPassword = '2d2ee7bee3ae4795ba886' |> utilities[['Inclose']]('Quotes'),
    Salt = '53dfd42f-5394-46d7-a917-11b7da15816d' |> utilities[['Inclose']]('Quotes')
  )

  output <- "[Username] = 'test.updated@gmail.com', [HashedPassword] = '2d2ee7bee3ae4795ba886', [Salt] = '53dfd42f-5394-46d7-a917-11b7da15816d' "

  # Then
  input |>
    broker[['UTILITIES']][['KEYVALUES']](pairs) |>
      expect_equal(output)
})

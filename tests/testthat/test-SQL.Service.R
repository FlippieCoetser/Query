test_that('SQL.Service exist',{
  SQL.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('SQL.Service() return list of services',{
  SQL.Broker() |>
  SQL.Service() |>
    is.list() |>
      expect_equal(TRUE)
})

# UTILITIES
test_that('service instance has UTILITIES',{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  # Then
  service[['UTILITIES']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that('service[["UTILITIES"]] return list of utility services',{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  # Then
  service[['UTILITIES']] |>
    is.list()         |>
      expect_equal(TRUE)
})

# SCHEMA UTILITY
test_that("service[['UTILITIES']] has SCHEMA operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  utilities <- service[['UTILITIES']]

  # Then
  utilities[['SCHEMA']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> utilities[['SCHEMA']](table) inclose table with square brackets and add default schema",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  utilities <- service[['UTILITIES']]

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
test_that("service[['UTILITIES']] has INCLOSE operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  utilities <- service[['UTILITIES']]

  # Then
  utilities[['INCLOSE']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("field |> utilities[['INCLOSE']]() inclose field with square brackets",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  utilities <- service[['UTILITIES']]

  # When
  field  <- 'Id'
  output <- '[Id]'
  
  # Then
  field |> 
    utilities[['INCLOSE']]() |>
      expect_equal(output)
})

# COLUMNS UTILITY
test_that("service[['UTILITIES']] has COLUMNS operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  utilities <- service[['UTILITIES']]

  # Then
  utilities[['COLUMNS']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> utilities[['COLUMNS']]() Inject COLUMNS and Prepend input",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  utilities <- service[['UTILITIES']]

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
test_that("service[['UTILITIES']] has KEYVALUE operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  utilities <- service[['UTILITIES']]

  # Then
  utilities[['KEYVALUE']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> utilities[['KEYVALUE']]() Inject COLUMNS and Prepend input",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service() |>
    Utility.Processing()

  service <- 
    SQL.Broker() |>
    SQL.Service()

  input <- ''
  key   <- 'Id'
  value <- 'b2970410-bd60-478d-baf6-46cbc14e10fc' |> utilities[['Inclose']]('Quotes')

  output <- "[Id] = 'b2970410-bd60-478d-baf6-46cbc14e10fc' "

  # Then
  input |>
    service[['UTILITIES']][['KEYVALUE']](key,value) |>
      expect_equal(output)
})

# INCLOSELIST UTILITY
test_that("utilities[['UTILITIES']] has INCLOSELIST operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  utilities <- service[['UTILITIES']]

  # Then
  utilities[['INCLOSELIST']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> utilities[['INCLOSELIST']]() Inject COLUMNS and Prepend input",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service() |>
    Utility.Processing()

  service <- 
    SQL.Broker() |>
    SQL.Service()

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
    service[['UTILITIES']][['INCLOSELIST']](columns) |>
      expect_equal(output)
})

# FUNCTIONS
test_that('broker instance has FUNCTIONS',{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  # Then
  service[['FUNCTIONS']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that('service[["FUNCTIONS"]] return list of operations',{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  # Then
  service[['FUNCTIONS']] |>
    is.list()         |>
      expect_equal(TRUE)
})

# LOWER FUNCTION
test_that("service[['FUNCTIONS']] has LOWER operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  functions <- service[['FUNCTIONS']]

  # Then
  functions[['LOWER']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("field |> functions[['LOWER']]() Inject field into lower() as alias SQL Statement",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  functions <- service[['FUNCTIONS']]

  # When
  field  <- 'Id'
  output <- 'LOWER(Id) as Id'
  
  # Then
  field |> 
    functions[['LOWER']](field) |>
      expect_equal(output)
})

# KEYWORDS
test_that('service instance has KEYWORDS',{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  # Then
  service[['KEYWORDS']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that('service[["KEYWORDS"]] return list of operations',{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  # Then
  service[['KEYWORDS']] |>
    is.list()         |>
      expect_equal(TRUE)
})

# SELECT KEYWORD
test_that("service[['KEYWORDS']] has SELECT service",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  # Then
  keywords[['SELECT']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['SELECT']]() Inject SELECT and Prepend input",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  input <- 'input '
  output <- 'input SELECT '

  # Then
  input |>
    keywords[['SELECT']]() |>
      expect_equal(output)
})

# FROM KEYWORD
test_that("service[['KEYWORDS']] has FROM operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  # Then
  keywords[['FROM']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['FROM']]() Inject FROM and Prepend input",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  input <- 'input '
  output <- 'input FROM '

  # Then
  input |>
    keywords[['FROM']]() |>
      expect_equal(output)
})

# WHERE KEYWORD
test_that("service[['KEYWORDS']] has WHERE operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  # Then
  keywords[['WHERE']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['WHERE']]() Inject WHERE and Prepend input",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  input <- 'input '
  output <- 'input WHERE '

  # Then
  input |>
    keywords[['WHERE']]() |>
      expect_equal(output)
})

# INSERT KEYWORD
test_that("service[['KEYWORDS']] has INSERT operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  # Then
  keywords[['INSERT']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['INSERT']]() Inject INSERT and Prepend input",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  input <- 'input '
  output <- 'input INSERT '

  # Then
  input |>
    keywords[['INSERT']]() |>
      expect_equal(output)
})

# VALUES KEYWORD
test_that("service[['KEYWORDS']] has VALUES operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  # Then
  keywords[['VALUES']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['VALUES']]() Inject VALUES and Prepend input",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  input <- 'input '
  output <- 'input VALUES '

  # Then
  input |>
    keywords[['VALUES']]() |>
      expect_equal(output)
})

# UPDATE KEYWORD
test_that("service[['KEYWORDS']] has UPDATE operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  # Then
  keywords[['UPDATE']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['UPDATE']]() Inject UPDATE and Prepend input",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  input <- 'input '
  output <- 'input UPDATE '

  # Then
  input |>
    keywords[['UPDATE']]() |>
      expect_equal(output)
})

# SET KEYWORD
test_that("service[['KEYWORDS']] has SET operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  # Then
  keywords[['SET']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['SET']]() Inject SET and Prepend input",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  input <- 'input '
  output <- 'input SET '

  # Then
  input |>
    keywords[['SET']]() |>
      expect_equal(output)
})

# INTO KEYWORD
test_that("service[['KEYWORDS']] has INTO operation",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  # Then
  keywords[['INTO']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("input |> keywords[['INTO']]() Inject INTO and Prepend input",{
  # Given
  service <- 
    SQL.Broker() |>
    SQL.Service()

  keywords <- service[['KEYWORDS']]

  input <- 'input '
  output <- 'input INTO '

  # Then
  input |>
    keywords[['INTO']]() |>
      expect_equal(output)
})

test_that('DML.Service exist',{
  DML.Service   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('DML.Service() return list of services',{
  DML.Service() |>
    is.list() |>
      expect_equal(TRUE)
})

# INSERT KEYWORD
test_that('services contains INSERT service',{
  # Given
  service <- DML.Service()

  # Then
  service[['INSERT']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> service[['INSERT']]() returns INSERT keyword prepended with input",{
  # Given
  service <- DML.Service()

  input  <- 'input '
  output <- 'input INSERT '
  
  # Then
  input |>
    service[['INSERT']]() |>
      expect_equal(output)
})

# INTO KEYWORD
test_that('services contains INTO service',{
  # Given
  service <- DML.Service()

  # Then
  service[['INTO']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> service[['INTO']]() returns INTO keyword prepended with input",{
  # Given
  service <- DML.Service()

  input  <- 'input '
  output <- 'input INTO '
  
  # Then
  input |>
    service[['INTO']]() |>
      expect_equal(output)
})

# VALUES KEYWORD
test_that('services contains VALUES service',{
  # Given
  service <- DML.Service()

  # Then
  service[['VALUES']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> service[['VALUES']]() returns VALUES keyword prepended with input",{
  # Given
  service <- DML.Service()

  input  <- 'input '
  output <- 'input VALUES '
  
  # Then
  input |>
    service[['VALUES']]() |>
      expect_equal(output)
})

# KEYS KEYWORD
test_that('services contains KEYS service',{
  # Given
  service <- DML.Service()

  # Then
  service[['KEYS']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> service[['KEYS']](keyValues) returns a string of bracketed keys inclosed with round brackets prepended with input",{
  # Given
  service <- DML.Service()

  input <- 'input '
  keyValues  <- list(
    Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
    Username = 'test@gmail.com',
    HashedPassword = '2d2ee7bee3ae4795ba886',
    Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')

  output <- 'input ([Id], [Username], [HashedPassword], [Salt]) '
  
  # Then
  input |>
    service[['KEYS']](keyValues) |>
      expect_equal(output)
})

# NEWVALUES KEYWORD
test_that('services contains NEWVALUES service',{
  # Given
  service <- DML.Service()

  # Then
  service[['NEWVALUES']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> service[['NEWVALUES']](keyValues) returns a string of values inclosed with round brackets prepended with input",{
  # Given
  service <- DML.Service()

  input <- 'input '
  keyValues  <- list(
    Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
    Username = 'test@gmail.com',
    HashedPassword = '2d2ee7bee3ae4795ba886',
    Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')

  output <- "input ('4a0ec243-78ff-4461-8696-c41e7d64e108', 'test@gmail.com', '2d2ee7bee3ae4795ba886', '53dfd42f-5394-46d7-a917-11b7da15816d') "
  
  # Then
  input |>
    service[['NEWVALUES']](keyValues) |>
      expect_equal(output)
})

# SCHEMA KEYWORD
test_that('services contains SCHEMA service',{
  # Given
  service <- DML.Service()

  # Then
  service[['SCHEMA']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> service[['SCHEMA']](schema) returns schema prepended with input",{
  # Given
  service <- DML.Service()

  input  <- 'input '
  schema <- 'schema'
  output <- 'input [schema].'

  # Then
  input |>
    service[['SCHEMA']](schema) |>
      expect_equal(output)
})
test_that("input |> service[['SCHEMA']]() returns dbo in brackets with dot and prepended with input",{
  # Given
  service <- DML.Service()

  input  <- 'input '
  output <- 'input [dbo].'

  # Then
  input |>
    service[['SCHEMA']]() |>
      expect_equal(output)
})

# TABLE KEYWORD
test_that('services contains TABLE service',{
  # Given
  service <- DML.Service()

  # Then
  service[['TABLE']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> service[['TABLE']](table) returns table prepended with input",{
  # Given
  service <- DML.Service()

  input  <- 'input '
  table  <- 'table'
  output <- 'input [table] '

  # Then
  input |>
    service[['TABLE']](table) |>
      expect_equal(output)
})

# UPDATE KEYWORD
test_that('services contains UPDATE service',{
  # Given
  service <- DML.Service()

  # Then
  service[['UPDATE']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> service[['UPDATE']]() returns UPDATE keyword prepended with input",{
  # Given
  service <- DML.Service()

  input  <- 'input '
  output <- 'input UPDATE '
  
  # Then
  input |>
    service[['UPDATE']]() |>
      expect_equal(output)
})
test_that("service[['UPDATE']]() returns UPDATE keyword ",{
  # Given
  service <- DML.Service()
  
  output <- 'UPDATE '
  
  # Then
  service[['UPDATE']]() |>
    expect_equal(output)
})

# SET KEYWORD
test_that('services contains SET service',{
  # Given
  service <- DML.Service()

  # Then
  service[['SET']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> service[['SET']]() returns SET keyword prepended with input",{
  # Given
  service <- DML.Service()

  input  <- 'input '
  output <- 'input SET '
  
  # Then
  input |>
    service[['SET']]() |>
      expect_equal(output)
})
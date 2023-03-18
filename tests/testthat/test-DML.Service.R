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
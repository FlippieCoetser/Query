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
test_that('DML.Processing exist',{
  DML.Processing   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('DML.Processing() return list of processors',{
  DML.Processing() |>
    is.list() |>
      expect_equal(TRUE)
})

# INSERT SQL Statement
test_that('processors contains INSERT processor',{
  # Given
  processor <- DML.Processing()

  # Then
  processor[['INSERT']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("processor[['INSERT']]() returns a INSERT INTO (keys) statement",{
  # Given
  processor <- 
    DML.Service() |>
    DML.Processing()

  table <- 'User'
  keyValues  <- list(
    Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
    Username = 'test@gmail.com',
    HashedPassword = '2d2ee7bee3ae4795ba886',
    Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')

  output <- 'INSERT INTO [dbo].[User] ([Id], [Username], [HashedPassword], [Salt]) '

  # Then
  table |>
    processor[['INSERT']](keyValues) |>         
    expect_equal(output)
})

# VALUES SQL Statement
test_that('processors contains VALUES processor',{
  # Given
  processor <- DML.Processing()

  # Then
  processor[['VALUES']] |>
    Exist()           |>
      expect_equal(TRUE)
})
test_that("input |> processor[['VALUES']](keyValues) returns a VALUES (values) statement",{
  # Given
  processor <- 
    DML.Service() |>
    DML.Processing()

  input <- 'input '
  keyValues  <- list(
    Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
    Username = 'test@gmail.com',
    HashedPassword = '2d2ee7bee3ae4795ba886',
    Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')

  output <- "input VALUES ('4a0ec243-78ff-4461-8696-c41e7d64e108', 'test@gmail.com', '2d2ee7bee3ae4795ba886', '53dfd42f-5394-46d7-a917-11b7da15816d') "

  # Then
  input |>
    processor[['VALUES']](keyValues) |>         
    expect_equal(output)
})

# UPDATE SQL Statement
test_that('processors contains UPDATE processor',{
  # Given
  processor <- DML.Processing()

  # Then
  processor[['UPDATE']] |>
    Exist()           |>
      expect_equal(TRUE)
})
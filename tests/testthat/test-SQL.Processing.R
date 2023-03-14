test_that('SQL.Processing exist',{
  SQL.Processing |>
    is.null()    |>
      expect_equal(FALSE)
})
test_that('SQL.Processing() return list of processors',{
  SQL.Broker()     |>
  SQL.Service()    |>
  SQL.Processing() |>
    is.list()      |>
      expect_equal(TRUE)
})

# SELECT
test_that('broker instance has SELECT operation',{
  # Given
  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  # Then
  processor[['SELECT']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("columns |> processor[['SELECT']]() inject SELECT SQL statement with columns",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service() |>
    Utility.Processing()

  broker <-
    SQL.Broker() 
    
  processor <- 
    broker |>
    SQL.Service() |>
    SQL.Processing()

  columns <- list(
    'Id'             |> utilities[['Inclose']]() |> broker[['FUNCTIONS']][['LOWER']]('Id'),
    'Username'       |> utilities[['Inclose']](),
    'HashedPassword' |> utilities[['Inclose']](),
    'Salt'           |> utilities[['Inclose']]() |> broker[['FUNCTIONS']][['LOWER']]('Salt'))

  # When
  output <- 'SELECT LOWER([Id]) as Id, [Username], [HashedPassword], LOWER([Salt]) as Salt '

  # Then
  columns |>
    processor[['SELECT']]() |>
      expect_equal(output)
})

# FROM
test_that('processor instance has FROM operation',{
  # Given
  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  # Then
  processor[['FROM']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("table |> broker[['FROM']]() Append table after FROM statement",{
    # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  input  <- ''
  table  <- 'User'
  output <- 'FROM [dbo].[User] '

  # Then
  input |>
    processor[['FROM']](table) |>
      expect_equal(output)
})

# WHERE
test_that('processor instance has WHERE operation',{
  # Given
  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  # Then
  processor[['WHERE']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("input |> processor[['WHERE']](key, value) Inject where field equals value SQL Statement",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service() |>
    Utility.Processing()

  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  input  <- ''
  key  <- 'Id'
  value <- 'b2970410-bd60-478d-baf6-46cbc14e10fc' |> utilities[['Inclose']]('Quotes')
  output <- "WHERE [Id] = 'b2970410-bd60-478d-baf6-46cbc14e10fc' "

  # Then
  input |>
    processor[['WHERE']](key, value) |>
      expect_equal(output) 
})

# INSERT
test_that('processor instance has INSERT operation',{
  # Given
  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  # Then
  processor[['INSERT']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("input |> processor[['INSERT']](table) append collapsed list for fields to Insert into table SQL Statement",{
    # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service() |>
    Utility.Processing()

  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  table    <- 'User'
  columns  <- list(
    'Id'             |> utilities[['Inclose']](),
    'Username'       |> utilities[['Inclose']](),
    'HashedPassword' |> utilities[['Inclose']](),
    'Salt'           |> utilities[['Inclose']]()
  )
  output <- "INSERT INTO [dbo].[User] ([Id], [Username], [HashedPassword], [Salt]) "

  # Then
  processor[['INSERT']](table, columns) |>
    expect_equal(output)
})

# VALUES
test_that('processor instance has VALUES operation',{
  # Given
  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  # Then
  processor[['VALUES']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("insert |> processor[['VALUES']](values) append collapsed list for fields to Insert into table SQL Statement",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service() |>
    Utility.Processing()

  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  input    <- ''
  values  <- list(
    '4a0ec243-78ff-4461-8696-c41e7d64e108' |> utilities[['Inclose']]('Quotes'),
    'test@gmail.com'                       |> utilities[['Inclose']]('Quotes'),
    '2d2ee7bee3ae4795ba88'                 |> utilities[['Inclose']]('Quotes'),
    '53dfd42f-5394-46d7-a917-11b7da15816d' |> utilities[['Inclose']]('Quotes')
  )
  output <- "VALUES ('4a0ec243-78ff-4461-8696-c41e7d64e108', 'test@gmail.com', '2d2ee7bee3ae4795ba88', '53dfd42f-5394-46d7-a917-11b7da15816d') "

  # Then
  input |>
    processor[['VALUES']](values) |>
      expect_equal(output)
})

# UPDATE
test_that('processor instance has UPDATE operation',{
  # Given
  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  # Then
  processor[['UPDATE']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("table |> processor[['UPDATE']]() Append table after UPDATE statement",{
    # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  table  <- 'User'
  output <- 'UPDATE [dbo].[User] '

  # Then
  table |>
    processor[['UPDATE']]() |>
      expect_equal(output)
})

# SET
test_that('processor instance has SET operation',{
  # Given
  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  # Then
  processor[['SET']] |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("pairs |> processor[['SET']]() Append key value pairs after SET statement",{
  # Given
  utilities <-
    Utility.Broker() |> 
    Utility.Service() |>
    Utility.Processing()

  processor <-
    SQL.Broker() |>
    SQL.Service() |>
    SQL.Processing()

  input <- ''
  pairs <- list(
    Username = 'test.updated@gmail.com' |> utilities[['Inclose']]('Quotes'),
    HashedPassword = '2d2ee7bee3ae4795ba886' |> utilities[['Inclose']]('Quotes'),
    Salt = '53dfd42f-5394-46d7-a917-11b7da15816d' |> utilities[['Inclose']]('Quotes')
  )

  output <- "SET [Username] = 'test.updated@gmail.com', [HashedPassword] = '2d2ee7bee3ae4795ba886', [Salt] = '53dfd42f-5394-46d7-a917-11b7da15816d' "

  # Then
  input |>
    processor[['SET']](pairs) |>
      expect_equal(output)
})
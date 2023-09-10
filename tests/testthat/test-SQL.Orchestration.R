describe("Given SQL.Orchestration",{
  it("exist",{
    # Given
    SQL.Orchestration |> is.null() |> expect_equal(FALSE)
  })
})

describe("When orchestration <- SQL.Orchestration()",{
  it("then orchestration is a list",{
    # Given
    orchestrations <- SQL.Orchestration()

    # Then
    orchestrations |> is.list() |> expect_equal(TRUE)
  })
  it("then orchestration contains SELECT orchestration",{
    # Given
    orchestration <- SQL.Orchestration()

    # Then
    orchestration[['SELECT']] |> Exist() |> expect_equal(TRUE)
  })
  it("then orchestration contains FROM orchestration",{
    # Given
    orchestration <- SQL.Orchestration()

    # Then
    orchestration[['FROM']] |> Exist() |> expect_equal(TRUE)
  })
  it("then orchestration contains WHERE orchestration",{
    # Given
    orchestration <- SQL.Orchestration()

    # Then
    orchestration[['WHERE']] |> Exist() |> expect_equal(TRUE)
  })
  it("then orchestration contains INSERT orchestration",{
    # Given
    orchestration <- SQL.Orchestration()

    # Then
    orchestration[['INSERT']] |> Exist() |> expect_equal(TRUE)
  })
  it("then orchestration contains VALUES orchestration",{
    # Given
    orchestration <- SQL.Orchestration()

    # Then
    orchestration[['VALUES']] |> Exist() |> expect_equal(TRUE)
  })
  it("then orchestration contains UPDATE orchestration",{
    # Given
    orchestration <- SQL.Orchestration()

    # Then
    orchestration[['UPDATE']] |> Exist() |> expect_equal(TRUE)
  })
  it("then orchestration contains SET orchestration",{
    # Given
    orchestration <- SQL.Orchestration()

    # Then
    orchestration[['SET']] |> Exist() |> expect_equal(TRUE)
  })
  it("then orchestration contains DELETE orchestration",{
    # Given
    orchestration <- SQL.Orchestration()

    # Then
    orchestration[['DELETE']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When orchestration[['SELECT']]()",{
  it("then 'SELECT * ' is returned",{
    # Given
    orchestration <- SQL.Orchestration()

    # Then 
    orchestration[['SELECT']]() |> expect_equal('SELECT * ')
  })
})

describe("When fields |> orchestration[['SELECT']]()",{
  it("then fields collapse list using comma as separator and prepend 'SELECT '",{
    # Given
    orchestration <- SQL.Orchestration()
    utilities <- SQL.Utility.Service()
    functions <- SQL.Functions.Service()

    # When
    fields <- list(
      'Id'            |> utilities[['BRACKET']]() |> functions[['LOWER']]('Id'),
      'Username'      |> utilities[['BRACKET']](),
      'HashedPassword'|> utilities[['BRACKET']](),
      'Salt'          |> utilities[['BRACKET']]() |> functions[['LOWER']]('Salt')
    )
    output <- 'SELECT LOWER([Id]) as Id, [Username], [HashedPassword], LOWER([Salt]) as Salt '

    # Then 
    fields |> orchestration[['SELECT']]() |> expect_equal(output)
  })
})

describe("When input |> orchestration[['FROM']](table)",{
  it("then 'FROM [table] ' is returned",{
    # Given
    orchestration <- SQL.Orchestration()
    utilities <- SQL.Utility.Service()
    functions <- SQL.Functions.Service()

    # When
    input <- 'SELECT * '
    table <- 'Users'

    # Then 
    input |> orchestration[['FROM']](table) |> expect_equal("SELECT * FROM [dbo].[Users] ")
  })
})

describe("When input |> orchestration[['WHERE']](key,value)",{
  it("then WHERE [id] = 'value' is returned",{
    # Given
    orchestration <- SQL.Orchestration()

    # When
    input <- 'input '
    key   <- 'id'
    value <- 'value'

    output <- "input WHERE [id] = 'value' "

    # Then
    input |> orchestration[['WHERE']](key, value) |>  expect_equal(output)
  })
})

describe("When input |> orchestration[['INSERT']]()",{
  it("then INSERT INTO [dbo].[User] ([Id], [Username], [HashedPassword], [Salt]) is returned",{
    # Given
    orchestration <- SQL.Orchestration()

    table <- 'User'
    keyValues  <- list(
      Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
      Username = 'test@gmail.com',
      HashedPassword = '2d2ee7bee3ae4795ba886',
      Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')

    output <- 'INSERT INTO [dbo].[User] ([Id], [Username], [HashedPassword], [Salt]) '

    # Then
    table |> orchestration[['INSERT']](keyValues) |> expect_equal(output)
  })
})

describe("When input |> orchestration[['VALUES']](keyValues)",{
  it("then VALUES Appended with values collapsed in round brackets is returned",{
    # Given
    orchestration <- SQL.Orchestration()

    input <- 'input '
    keyValues  <- list(
      Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
      Username = 'test@gmail.com',
      HashedPassword = '2d2ee7bee3ae4795ba886',
      Salt =  '53dfd42f-5394-46d7-a917-11b7da15816d')

    output <- "input VALUES ('4a0ec243-78ff-4461-8696-c41e7d64e108', 'test@gmail.com', '2d2ee7bee3ae4795ba886', '53dfd42f-5394-46d7-a917-11b7da15816d') "

    # Then
    input |> orchestration[['VALUES']](keyValues) |> expect_equal(output)
  })
  it("then NULL values are not inclosed in quotes",{
    # Given
    orchestration <- SQL.Orchestration()

    input <- 'input '
    keyValues  <- list(
      Id = '4a0ec243-78ff-4461-8696-c41e7d64e108',
      Username = 'test@gmail.com',
      HashedPassword = '2d2ee7bee3ae4795ba886',
      Salt =  NULL)

    output <- "input VALUES ('4a0ec243-78ff-4461-8696-c41e7d64e108', 'test@gmail.com', '2d2ee7bee3ae4795ba886', NULL) "

    # Then
    input |> orchestration[['VALUES']](keyValues) |> expect_equal(output)

  })
})

describe("When table |> orchestration[['UPDATE']]()",{
  it("then UPDATE [dbo].[table] is returned",{
    # Given
    orchestration <- SQL.Orchestration()

    table <- 'User'

    output <- "UPDATE [dbo].[User] "

    # Then
    table |> orchestration[['UPDATE']]() |> expect_equal(output)
  })
})

describe("When input |> orchestration[['SET']](keyValues)",{
  it("then SET with key value pairs collapsed with comma prepended with input returned",{
    # Given
    orchestration <- SQL.Orchestration()

    input  <- ''
    keyValues <- list(
      Username = 'test.updated@gmail.com', 
      HashedPassword = '2d2ee7bee3ae4795ba886', 
      Salt = '53dfd42f-5394-46d7-a917-11b7da15816d'
    )

    output <- "SET [Username] = 'test.updated@gmail.com', [HashedPassword] = '2d2ee7bee3ae4795ba886', [Salt] = '53dfd42f-5394-46d7-a917-11b7da15816d' "
  
    # Then
    input |> orchestration[['SET']](keyValues) |> expect_equal(output)
  })
})

describe("When input |> orchestration[['DELETE']]()",{
  it("then DELETE is returned",{
    # Given
    orchestration <- SQL.Orchestration()

    output <- "DELETE "

    # Then
    orchestration[['DELETE']]() |> expect_equal(output)
  })
})
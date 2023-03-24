describe("Given SQL.Functions.Service",{
  it("exist",{
    # Given
    SQL.Functions.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("When services <- SQL.Functions.Service()",{
  it("then services is a list",{
    # Given
    services <- SQL.Functions.Service()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
  it("then services contains LOWER service",{
    # Given
    services <- SQL.Functions.Service()

    # Then
    services[['LOWER']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When field |> service[['LOWER']](alias)",{
  it("then LOWER(field) as alias is returned",{
    # Given
    service <- SQL.Functions.Service()

    # When
    field <- 'field'
    alias <- 'Id'

    # Then
    field |> service[['LOWER']](alias) |> expect_equal('LOWER(field) as Id')
  })
  it("then an argument is null exception is thrown if field is NULL",{
    # Given
    service <- SQL.Functions.Service()

    # When
    field <- NULL
    alias <- 'Id'

    # Then
    field |> service[['LOWER']](alias) |> expect_error('argument is NULL')
  })
})

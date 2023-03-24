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
  it("then an argument not character exception is thrown if field is not Character",{
    # Given
    service <- SQL.Functions.Service()

    # When
    field <- 1
    alias <- 'Id'

    # Then
    field |> service[['LOWER']](alias) |> expect_error('argument is not of type character')
  })
  it("then an argument not character exceptions is thrown if alias is not Character",{
    # Given
    service <- SQL.Functions.Service()

    # When
    field <- 'field'
    alias <- 1

    # Then
    field |> service[['LOWER']](alias) |> expect_error('argument is not of type character')
  })
})
describe("When field |> service[['LOWER']]()",{
  it("then LOWER(field) as field is returned",{
    # Given
    service <- SQL.Functions.Service()

    # When
    field <- 'field'

    # Then
    field |> service[['LOWER']]() |> expect_equal('LOWER(field) as field')
  })
    it("then an argument is null exception is thrown if field is NULL",{
    # Given
    service <- SQL.Functions.Service()

    # When
    field <- NULL

    # Then
    field |> service[['LOWER']]() |> expect_error('argument is NULL')
  })
  it("then an argument not character exception is thrown if field is not Character",{
    # Given
    service <- SQL.Functions.Service()

    # When
    field <- 1

    # Then
    field |> service[['LOWER']]() |> expect_error('argument is not of type character')
  })
})
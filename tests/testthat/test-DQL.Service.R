describe("Given DQL.Service",{
  it("exist",{
    # Given
    DQL.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("When service <- DQL.Service()",{
  it("then service is a list",{
    # Given
    service <- DQL.Service()

    # Then
    service |> is.list() |> expect_equal(TRUE)
  })
  it("then service contains SELECT service",{
    # Given
    service <- DQL.Service()

    # Then
    service[['SELECT']] |> Exist() |> expect_equal(TRUE)
  })
  it("then service contains FROM service",{
    # Given
    service <- DQL.Service()

    # Then
    service[['FROM']] |> Exist() |> expect_equal(TRUE)
  })
  it("then service contains WHERE service",{
    # Given
    service <- DQL.Service()

    # Then
    service[['WHERE']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When input |> service[['SELECT']]()",{
  it("then SELECT keyword is returned",{
    # Given
    service <- DQL.Service()

    input  <- 'input '
    output <- 'input SELECT '

    # Then
    input |> service[['SELECT']]() |> expect_equal(output)
  })
})

describe("When input |> service[['FROM']]()",{
  it("then FROM keyword is returned",{
    # Given
    service <- DQL.Service()

    input  <- 'input '
    output <- 'input FROM '

    # Then
    input |> service[['FROM']]() |> expect_equal(output)
  })
})

describe("When input |> service[['WHERE']]()",{
  it("then WHERE keyword is returned",{
    # Given
    service <- DQL.Service()

    input  <- 'input '
    output <- 'input WHERE '

    # Then
    input |> service[['WHERE']]() |> expect_equal(output)
  })
})

describe("Given SQL.Utility.Service",{
  it("exist",{
    # Given
    SQL.Utility.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("When services <- SQL.Utility.Service()",{
  it("then services is a list",{
    # Given
    services <- SQL.Utility.Service()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
  it("then services contains BRACKET service",{
    # Given
    service <- SQL.Utility.Service()

    # Then
    service[['BRACKET']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When value |> service[['BRACKET']]()",{
  it("then [value] is returned",{
    # Given
    service <- SQL.Utility.Service()

    # When
    value <- 'value'

    # Then 
    value |>
      service[['BRACKET']]() |>
        expect_equal('[value]')
  })
  it("then an argument is null exception is thrown when value is NULL",{
    # Given
    service <- SQL.Utility.Service()

    # When
    value <- NULL

    # Then 
    value |> service[['BRACKET']]() |> expect_error("argument is NULL")
  })
})

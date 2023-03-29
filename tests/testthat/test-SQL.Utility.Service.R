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
  it("then services contains FIELDS service",{
    # Given
    service <- SQL.Utility.Service()

    # Then
    service[['FIELDS']] |> Exist() |> expect_equal(TRUE)
  })
  it("then services contains * service",{
    # Given
    service <- SQL.Utility.Service()

    # Then
    service[['*']] |> Exist() |> expect_equal(TRUE)
  })
  it("then services contains SCHEMA service",{
    # Given
    service <- SQL.Utility.Service()

    # Then
    service[['SCHEMA']] |> Exist() |> expect_equal(TRUE)
  })
  it("then services contains TABLE service",{
    # Given
    service <- SQL.Utility.Service()

    # Then
    service[['TABLE']] |> Exist() |> expect_equal(TRUE)
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

describe("When input |> service[['FIELDS']](fields)",{
  it("then fields collapse list using comma as separator and prepend input",{
    # Given
    service <- SQL.Utility.Service()

    # When
    input   <- 'input '
    output  <- 'input one, two, three '

    # When 
    fields <- list('one','two','three')

    # Then
    input                         |>
      service[['FIELDS']](fields) |>
        expect_equal(output)
  })
})

describe("When input |> service[['SCHEMA']]()",{
  it("then [dbo]. prepend input is returned",{
    # Given
    service <- SQL.Utility.Service()

    # When
    input   <- 'input '
    output  <- 'input [dbo].'

    # Then
    input                   |>
      service[['SCHEMA']]() |>
        expect_equal(output)
  })
})

describe("When input |> service[['SCHEMA']](schema)",{
  it("then [schema]. prepend input is returned",{
    # Given
    service <- SQL.Utility.Service()

    # When
    input   <- 'input '
    schema  <- 'schema'
    output  <- 'input [schema].'

    # Then
    input                   |>
      service[['SCHEMA']](schema) |>
        expect_equal(output)
  })
})

describe("When input |> service[['TABLE']](table)",{
  it("then [table] prepend input is returned",{
    # Given
    service <- SQL.Utility.Service()

    # When
    input   <- 'input '
    table   <- 'table'
    output  <- 'input [table] '

    # Then
    input                   |>
      service[['TABLE']](table) |>
        expect_equal(output)
  })
})
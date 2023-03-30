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
  it("then services contains KEY service",{
    # Given
    service <- SQL.Utility.Service()

    # Then
    service[['KEY']] |> Exist() |> expect_equal(TRUE)
  })
  it("then services contains OPERATOR service",{
    # Given
    service <- SQL.Utility.Service()

    # Then
    service[['OPERATOR']] |> Exist() |> expect_equal(TRUE)
  })
  it("then services contains VALUE service",{
    # Given
    service <- SQL.Utility.Service()

    # Then
    service[['VALUE']] |> Exist() |> expect_equal(TRUE)
  })
  it("then services contains KEYS service",{
    # Given
    service <- SQL.Utility.Service()

    # Then
    service[['KEYS']] |> Exist() |> expect_equal(TRUE)
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

describe("When input |> service[['KEY']](key)",{
  it("then [key] prepend input is returned",{
    # Given
    service <- SQL.Utility.Service()

    # When
    input   <- 'input '
    key     <- 'key'
    output  <- 'input [key] '

    # Then
    input                   |>
      service[['KEY']](key) |>
        expect_equal(output)
  })
})

describe("When input |> service[['OPERATOR']]()",{
  it("then = prepend input is returned",{
    # Given
    service <- SQL.Utility.Service()

    # When
    input     <- 'input '
    operator  <- '='
    output    <- 'input = '

    # Then
    input                     |>
      service[['OPERATOR']]() |>
        expect_equal(output)
  })
})

describe("When input |> service[['OPERATOR']](operator)",{
  it("then operator prepend input is returned",{
    # Given
    service <- SQL.Utility.Service()

    # When
    input     <- 'input '
    operator  <- ':'
    output    <- 'input : '

    # Then
    input                     |>
      service[['OPERATOR']](operator) |>
        expect_equal(output)
  })
})

describe("When input |> service[['VALUE']](value)",{
  it("then value in quotes prepend input is returned if value character",{
    # Given
    service <- SQL.Utility.Service()

    # When
    input   <- 'input '
    value   <- 'value'
    output  <- "input 'value' "

    # Then
    input                   |>
      service[['VALUE']](value) |>
        expect_equal(output)
  })
  it("then value prepend input is returned if value not character",{
    # Given
    service <- SQL.Utility.Service()

    # When
    input   <- 'input '
    value   <- 1
    output  <- 'input 1 '

    # Then
    input                   |>
      service[['VALUE']](value) |>
        expect_equal(output)
  })
})
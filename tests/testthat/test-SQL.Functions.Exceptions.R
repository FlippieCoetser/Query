describe("Given SQL.Functions.Exceptions",{
  it("exist",{
    # Given
    SQL.Functions.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When exceptions <- SQL.Functions.Exceptions()",{
  it("then exceptions is a list",{
    # Given
    exceptions <- SQL.Functions.Exceptions()

    # Then
    exceptions |> is.list() |> expect_equal(TRUE)
  })
  it("then exceptions contains ArgumentNullException",{
    # Given
    exceptions <- SQL.Functions.Exceptions()

    # Then
    exceptions[['ArgumentNullException']] |> Exist() |> expect_equal(TRUE)
  }) 
  it("then exceptions contains ArgumentNotCharacterException",{
    #Given
    exceptions <- SQL.Functions.Exceptions()

    # Then
    exceptions[['ArgumentNotCharacterException']] |> Exist() |> expect_equal(TRUE)
  }) 
})

describe("When input |> exception[['ArgumentNullException']]()",{
  it("then no exception is thrown when input FALSE",{
    #Given
    exception <- SQL.Functions.Exceptions()

    # When 
    input <- FALSE

    #Then
    input |> exception[['ArgumentNullException']]() |> expect_no_error()
  })
  it("then argument is null exception is thrown when input TRUE",{
    # Given
    exception <- SQL.Functions.Exceptions()

    # When 
    input <- TRUE

    # Then
    input |> exception[['ArgumentNullException']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> exception[['ArgumentNotCharacterException']]()",{
  it("then no exception is thrown when input is FALSE",{
    #Given
    exception <- SQL.Functions.Exceptions()

    # When 
    input <- FALSE

    #Then
    input |> exception[['ArgumentNotCharacterException']]() |> expect_no_error()
  })
  it("then argument is not character exception is thrown when input is TRUE",{
    # Given
    exception <- SQL.Functions.Exceptions()

    # When 
    input <- TRUE

    # Then
    input |> exception[['ArgumentNotCharacterException']]() |> expect_error('argument is not of type character')
  })
})
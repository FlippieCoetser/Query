describe("Given SQL.Utility.Exceptions",{
  it("exist",{
    # Given
    SQL.Utility.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When exceptions <- SQL.Utility.Exceptions()",{
  it("then exceptions is a list",{
    # Given
    exceptions <- SQL.Utility.Exceptions()

    # Then
    exceptions |> is.list() |> expect_equal(TRUE)
  })
  it("then exceptions contains ArgumentNullException",{
    # Given
    exceptions <- SQL.Utility.Exceptions()

    # Then
    exceptions[['ArgumentNullException']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When input |> exception[['ArgumentNullException']]()",{
  it("then no exception is thrown when input FALSE",{
    #Given
    exception <- SQL.Utility.Exceptions()

    # When 
    input <- FALSE

    #Then
    input |> exception[['ArgumentNullException']]() |> expect_no_error()
  })
  it("then argument is null exception is thrown when input TRUE",{
    # Given
    exception <- SQL.Utility.Exceptions()

    # When 
    input <- TRUE

    # Then
    input |> exception[['ArgumentNullException']]() |> expect_error('argument is NULL')
  })
})
describe("Given String.Utility.Exception",{
  it("exist",{
    # Given
    String.Utility.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When exceptions <- String.Utility.Exceptions()",{
  it("then exceptions is a list",{
    # Given
    exceptions <- String.Utility.Exceptions()

    # Then
    exceptions |> is.list() |> expect_equal(TRUE)
  })
  it("then exceptions contains ArgumentNullException",{
    # Given
    exceptions <- String.Utility.Exceptions()

    # Then
    exceptions[['ArgumentNullException']] |> Exist() |> expect_equal(TRUE)
  })
  it("then exceptions contains ArgumentNotCharacterException",{
    #Given
    exceptions <- String.Utility.Exceptions()

    # Then
    exceptions[['ArgumentNotCharacterException']] |> Exist() |> expect_equal(TRUE)
  })
  it("then exceptions contains ArgumentNotVectorException",{
    # Given
    exceptions <- String.Utility.Exceptions()

    # Then
    exceptions[['ArgumentNotVectorException']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When input |> exception[['ArgumentNullException']]()",{
  it("then no exception is thrown when input FALSE",{
    #Given
    exception <- String.Utility.Exceptions()

    # When 
    input <- FALSE

    #Then
    input |> exception[['ArgumentNullException']]() |> expect_no_error()
  })
  it("then argument is null exception is thrown when input TRUE",{
    # Given
    exception <- String.Utility.Exceptions()

    # When 
    input <- TRUE

    # Then
    input |> exception[['ArgumentNullException']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> exception[['ArgumentNotCharacterException']]()",{
  it("then no exception is thrown when input FALSE",{
    # Given
    exception <- String.Utility.Exceptions()

    # When 
    input <- FALSE

    # Then
    input |> exception[['ArgumentNotCharacterException']]() |> expect_no_error()
  })
  it("then argument is not a String exception is thrown when input TRUE",{
    # Given
    exception <- String.Utility.Exceptions()

    # When 
    input <- TRUE

    # Then
    input |> exception[['ArgumentNotCharacterException']]() |> expect_error('argument is not of type Character')
  })
})

describe("When input |> exception[['ArgumentNotVectorException']]()",{
  it("then no exception is thrown when input FALSE",{
    # Given
    exception <- String.Utility.Exceptions()

    # When 
    input <- FALSE

    # Then
    input |> exception[['ArgumentNotVectorException']]() |> expect_no_error()
  })
  it("then argument is not a Vector exception is thrown when input TRUE",{
    # Given
    exception <- String.Utility.Exceptions()

    # When 
    input <- TRUE

    # Then
    input |> exception[['ArgumentNotVectorException']]() |> expect_error('argument is not of type Vector')
  })
})

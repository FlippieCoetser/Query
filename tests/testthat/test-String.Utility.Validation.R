describe("Given String.Utility.Validation",{
  it("exist",{
    # Given
    String.Utility.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When validators <- String.Utility.Validation()",{
  it("then validators is a list",{
    # Given
    validators <- String.Utility.Exceptions()

    # Then
    validators |> is.list() |> expect_equal(TRUE)
  })
  it("then validators contains Exist validator",{
    # Given
    validators <- String.Utility.Validation()

    # Then
    validators[['Exist']] |> Exist() |> expect_equal(TRUE)
  })
  it("then validators contains IsCharacter validator",{
    # Given
    validators <- String.Utility.Validation()

    # Then
    validators[['IsCharacter']] |> Exist() |> expect_equal(TRUE)
  })
  it("then validators contains IsVector validator",{
    # Given
    validators <- String.Utility.Validation()

    # Then
    validators[['IsVector']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When input |> validate[['Exist']]()",{
  it("then no exception is thrown when input not NULL",{
    # Given
    validate <- String.Utility.Validation()

    # When
    input <- ''

    # Then
    input |> validate[['Exist']]() |> expect_no_error()
  })
  it("then input is returned when input not NULL",{ 
    # Given
    validate <- String.Utility.Validation()

    # When
    input <- ''

    # Then
    input |> validate[['Exist']]() |> expect_equal(input)
  })
  it("then an argument null exception is thrown when input NULL",{
    # Given
    validators <- String.Utility.Validation()

    # When
    input <- NULL

    # Then
    input |> validators[['Exist']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> validate[['IsCharacter']]()",{
  it("then no exception is thrown when input is a Character",{
    # Given
    validate <- String.Utility.Validation()

    # When
    input <- ''

    # Then
    input |> validate[['IsCharacter']]() |> expect_no_error()
  })
  it("then input is returned when input is a Character",{ 
    # Given
    validate <- String.Utility.Validation()

    # When
    input <- ''

    # Then
    input |> validate[['IsCharacter']]() |> expect_equal(input)
  })
  it("then an argument not character exception is thrown when input not Character",{
    # Given
    validators <- String.Utility.Validation()

    # When
    input <- 1

    # Then
    input |> validators[['IsCharacter']]() |> expect_error('argument is not of type Character')
  })
})

describe("When input |> validate[['IsVector']]()",{
  it("then no exception is thrown when input is a Vector",{
    # Given
    validate <- String.Utility.Validation()

    # When
    input <- vector()

    # Then
    input |> validate[['IsVector']]() |> expect_no_error()
  })
  it("then input is returned when input is a Vector",{ 
    # Given
    validate <- String.Utility.Validation()

    # When
    input <- vector()

    # Then
    input |> validate[['IsVector']]() |> expect_equal(input)
  })
  it("then an argument not vector exception is thrown when input not Vector",{
    # Given
    validators <- String.Utility.Validation()

    # When
    input <- data.frame()

    # Then
    input |> validators[['IsVector']]() |> expect_error('argument is not of type Vector')
  })
})

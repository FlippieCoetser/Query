describe("Given SQL.Functions.Validation",{
  it("exist",{
    # Given
    SQL.Functions.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When validators <- SQL.Functions.Validation()",{
  it("then validators is a list",{
    # Given
    validators <- SQL.Functions.Validation()
    
    # Then
    validators |> is.list() |> expect_equal(TRUE)
  })
  it("then validators contains Exist validator",{
    # Given
    validators <- SQL.Functions.Validation()
    
    # Then
    validators[['Exist']] |> Exist() |> expect_equal(TRUE)
  })
  it("then validators contains IsCharacter validator",{
    # Given
    validators <- SQL.Functions.Validation()
    
    # Then
    validators[['IsCharacter']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When input |> validators[['Exist']]()",{
  it("then no exception is thrown when input not NULL",{
    #Given
    validators <- SQL.Functions.Validation()
    
    # When 
    input <- ''
    
    #Then
    input |> validators[['Exist']]() |> expect_no_error()
  })
  it("then input is returned when input not NULL",{
    #Given
    validators <- SQL.Functions.Validation()
    
    # When 
    input <- ''
    
    #Then
    input |> validators[['Exist']]() |> expect_equal(input)
  })
  it("then argument is null exception is thrown when input NULL",{
    # Given
    validators <- SQL.Functions.Validation()
    
    # When 
    input <- NULL
    
    # Then
    input |> validators[['Exist']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> validators[['IsCharacter']]()",{
  it("then no exception is thrown when input is character",{
    #Given
    validators <- SQL.Functions.Validation()
    
    # When 
    input <- ''
    
    #Then
    input |> validators[['IsCharacter']]() |> expect_no_error()
  })
  it("then argument is not character exception is thrown when input is not character",{
    # Given
    validators <- SQL.Functions.Validation()
    
    # When 
    input <- 1
    
    # Then
    input |> validators[['IsCharacter']]() |> expect_error('argument is not of type character')
  })
})
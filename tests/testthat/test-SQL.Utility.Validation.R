describe("Given SQL.Utility.Validation",{
  it("exist",{
    # Given
    SQL.Utility.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When validators <- SQL.Utility.Validation()",{
  it("then validators is a list",{
    # Given
    validators <- SQL.Utility.Validation()
    
    # Then
    validators |> is.list() |> expect_equal(TRUE)
  })
  it("then validators contains Exist validator",{
    # Given
    validators <- SQL.Utility.Validation()
    
    # Then
    validators[['Exist']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When input |> validators[['Exist']]()",{
  it("then no exception is thrown when input not NULL",{
    #Given
    validators <- SQL.Utility.Validation()
    
    # When 
    input <- ''
    
    #Then
    input |> validators[['Exist']]() |> expect_no_error()
  })
  it("then argument is null exception is thrown when input NULL",{
    # Given
    validators <- SQL.Utility.Validation()
    
    # When 
    input <- NULL
    
    # Then
    input |> validators[['Exist']]() |> expect_error('argument is NULL')
  })
})
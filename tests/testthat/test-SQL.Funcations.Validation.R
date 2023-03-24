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
})

describe("Given SQL.Functions.Validation",{
  it("exist",{
    # Given
    SQL.Functions.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When validators <- SQL.Utility.Validation()",{
  it("then validators is a list",{
    # Given
    validators <- SQL.Utility.Validation()
    
    # Then
    validators |> is.list() |> expect_equal(TRUE)
  })
})
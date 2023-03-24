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
})

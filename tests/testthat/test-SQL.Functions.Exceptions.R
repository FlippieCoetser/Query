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
})
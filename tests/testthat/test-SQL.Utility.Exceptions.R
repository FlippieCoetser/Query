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
})

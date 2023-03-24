describe("Given SQL.Functions.Validation",{
  it("exist",{
    # Given
    SQL.Functions.Validation |> is.null() |> expect_equal(FALSE)
  })
})
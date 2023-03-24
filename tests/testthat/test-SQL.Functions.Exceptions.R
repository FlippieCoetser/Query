describe("Given SQL.Functions.Exceptions",{
  it("exist",{
    # Given
    SQL.Functions.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})
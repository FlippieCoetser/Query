describe("Given SQL.Utility.Validation",{
  it("exist",{
    # Given
    SQL.Utility.Validation |> is.null() |> expect_equal(FALSE)
  })
})

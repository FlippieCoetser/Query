describe("Given SQL.Utility.Exception",{
  it("exist",{
    # Given
    SQL.Utility.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})
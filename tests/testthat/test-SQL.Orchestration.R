describe("Given SQL.Orchestration",{
  it("exist",{
    # Given
    SQL.Orchestration |> is.null() |> expect_equal(FALSE)
  })
})

describe("When orchestration <- SQL.Orchestration()",{
  it("then orchestration is a list",{
    # Given
    orchestrations <- SQL.Orchestration()

    # Then
    orchestrations |> is.list() |> expect_equal(TRUE)
  })
  it("then orchestration contains SELECT orchestration",{
    # Given
    orchestration <- SQL.Orchestration()

    # Then
    orchestration[['SELECT']] |> Exist() |> expect_equal(TRUE)
  })
})
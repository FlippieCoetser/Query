SQL.Functions.Validation <- \() {
  exceptions <- SQL.Functions.Exceptions()
  validators <- list()
  validators[['Exist']] <- \(input) {
    input |> is.null() |> exceptions[['ArgumentNullException']]()
  }
  return(validators)
}
SQL.Utility.Validation <- \() {
  exceptions <- SQL.Utility.Exceptions()
  validators <- list()
  validators[['Exist']] <- \(input) { 
    input |> is.null() |> exceptions[['ArgumentNullException']]()
   }
  return(validators)
}
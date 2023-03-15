String.Utility.Validation <- \() {
  exception <- String.Utility.Exceptions()

  validators <- list()
  validators[['Exist']] <- \(input) {
    input |> is.null() |> exception[['NullException']]()
  }
  validators[['IsString']] <- \(input) {
    input |> is.character() |> isFALSE() |> exception[['StringException']]()
  }
  return(validators)
}
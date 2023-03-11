Utility.Validation <- \() {
  validators <- list()
  validators[['Exist']]     <- \(data) {
    data |> is.null() |> exception[['NullException']]()
    return(data)
  }
  validators[['IsCharacter']] <- \(data) {
    data |> is.character() |> isFALSE() |> exception[['NumericException']]()
    return(data)
  }
  return(validators)
}
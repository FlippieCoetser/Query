Utility.Validation <- \() {
  exception <- Utility.Exceptions()
  
  validators <- list()
  validators[['Exist']]     <- \(data) {
    data |> is.null() |> exception[['NullException']]()
    return(data)
  }
  validators[['IsCharacter']] <- \(data) {
    data |> is.character() |> isFALSE() |> exception[['CharacterException']]()
    return(data)
  }
  return(validators)
}
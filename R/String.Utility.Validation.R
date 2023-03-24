String.Utility.Validation <- \() {
  exception <- String.Utility.Exceptions()

  validators <- list()
  validators[['Exist']]    <- \(input) {
    input |> is.null() |> exception[['ArgumentNullException']]()
    return(input)
  }
  validators[['IsCharacter']] <- \(input) {
    input |> is.character() |> isFALSE() |> exception[['ArgumentNotCharacterException']]()
    return(input)
  }
  validators[['IsVector']] <- \(input) { 
    input |> is.vector() |> isFALSE() |> exception[['ArgumentNotVectorException']]()
    return(input)
  }
  return(validators)
}
String.Utility.Validation <- \() {
  exception <- String.Utility.Exceptions()

  validators <- list()
  validators[['Exist']]    <- \(input) {
    input |> is.null() |> exception[['ArgumentNullException']]()
    return(input)
  }
  validators[['IsString']] <- \(input) {
    input |> is.character() |> isFALSE() |> exception[['ArgumentNotCharacterException']]()
    return(input)
  }
  validators[['IsVector']] <- \(input) { 
    input |> is.character() |> isFALSE() |> exception[['ArgumentNotVectorException']]()
    return(input)
  }
  return(validators)
}
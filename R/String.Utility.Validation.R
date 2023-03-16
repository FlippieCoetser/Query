String.Utility.Validation <- \() {
  exception <- String.Utility.Exceptions()

  validators <- list()
  validators[['Exist']] <- \(input) {
    input |> is.null() |> exception[['NullException']]()
    return(input)
  }
  validators[['IsString']] <- \(input) {
    input |> is.character() |> isFALSE() |> exception[['StringException']]()
    return(input)
  }
  validators[['IsVector']] <- \(input) { 
    input |> is.character() |> isFALSE() |> exception[['VectorException']]()
    return(input)
  }
  return(validators)
}
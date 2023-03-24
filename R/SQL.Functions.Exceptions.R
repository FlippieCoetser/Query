SQL.Functions.Exceptions <- \() {
  exceptions <- list()
  exceptions[['ArgumentNullException']]         <- \(input) {
    if(input) { stop('argument is NULL') }
  }
  exceptions[['ArgumentNotCharacterException']] <- \(input) {
    if(input) { stop('argument is not of type character') }
  }
  return(exceptions)
}
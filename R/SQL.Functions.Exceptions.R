SQL.Functions.Exceptions <- \() {
  exceptions <- list()
  exceptions[['ArgumentNullException']] <- \(input) {
    if(input) { stop('argument is NULL') }
  }
  exceptions[['ArgumentNotCharacterException']] <- \(input) {
  }
  return(exceptions)
}
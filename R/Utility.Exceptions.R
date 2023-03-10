Utility.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NullException']]    <- \(invoke) {
    if (invoke) {stop('argument is NULL')}
  }
  exceptions[['CharacterException']] <- \(invoke) {
    if (invoke) {stop('argument is not of type character')}
  }
  exceptions[['ListException']] <- \(invoke) {
    if (invoke) {stop('argument is not of type list')}
  }
  return(exceptions)
}
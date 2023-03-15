String.Utility.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NullException']] <- \(invoke) {
    if (invoke) {stop('argument is NULL')}
  }
  exceptions[['StringException']] <- \(invoke) {
    if (invoke) {stop('argument is not a String')}
  }
  return(exceptions)
}
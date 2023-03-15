String.Utility.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NullException']] <- \(invoke) {
    if (invoke) {stop('argument is NULL')}
  }
  exceptions[['StringException']] <- \() {
    
  }
  return(exceptions)
}
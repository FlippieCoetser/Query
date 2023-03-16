String.Utility.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NullException']] <- \(invoke) {
    if (invoke) {stop('argument is NULL')}
  }
  exceptions[['StringException']] <- \(invoke) {
    if (invoke) {stop('argument is not a String')}
  }
  exceptions[['VectorException']] <- \(invoke) {
    if (invoke) {stop('argument is not a Vector')}    
  }
  return(exceptions)
}
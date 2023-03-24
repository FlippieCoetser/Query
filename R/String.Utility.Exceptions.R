String.Utility.Exceptions <- \() {
  exceptions <- list()
  exceptions[['ArgumentNullException']] <- \(invoke) {
    if (invoke) {stop('argument is NULL')}
  }
  exceptions[['ArgumentNotCharacterException']] <- \(invoke) {
    if (invoke) {stop('argument is not a String')}
  }
  exceptions[['ArgumentNotVectorException']] <- \(invoke) {
    if (invoke) {stop('argument is not a Vector')}    
  }
  return(exceptions)
}
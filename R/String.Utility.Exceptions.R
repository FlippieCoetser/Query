String.Utility.Exceptions <- \() {
  exceptions <- list()
  exceptions[['ArgumentNullException']]         <- \(invoke) {
    if (invoke) {stop('argument is NULL')}
  }
  exceptions[['ArgumentNotCharacterException']] <- \(invoke) {
    if (invoke) {stop('argument is not of type Character')}
  }
  exceptions[['ArgumentNotVectorException']]    <- \(invoke) {
    if (invoke) {stop('argument is not of type Vector')}    
  }
  return(exceptions)
}
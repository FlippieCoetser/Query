IQR.Exceptions <- \(){
  exceptions <- list()

  exceptions[['NullException']]    <- \(invoke) {
    if (invoke) {stop('argument is NULL')}
  }
  exceptions[['NumericException']] <- \(invoke) {
    if (invoke) {stop('argument is not numeric')}
  }
  exceptions[['ListException']] <- \(invoke) {
    if (invoke) {stop('argument is not list')}
  }
  exceptions[['FirstQuartileMissingException']] <- \(invoke) {
    if (invoke) {stop('first quartile missing')}
  }
  exceptions[['ThirdQuartileMissingException']] <- \(invoke) {
    if (invoke) {stop('third quartile missing')}
  }

  return(exceptions)
}
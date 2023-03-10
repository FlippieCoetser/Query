#' Quartile Exceptions
#'
#' @description
#' `Quartile.Exceptions()` is an internal function that returns a set of exceptions used by `Quartile.Validation()` service.
#' * The first exception: `NullException`, indicates to the user that no data have to provided for analysis.
#' * The second exception: `DataTypeException`, indicates to the user than the data provided is not numerical data.
#' @usage NULL
#' @returns A `list` of exceptions: 
#' * `NullException()`
#' * `DataTypeException()`
Quartile.Exceptions <- \() {
  exceptions <- list()

  exceptions[['NullException']]     <- \(invoke) {
    if (invoke) {stop('argument is NULL')}
  }
  exceptions[['NumericException']] <- \(invoke) {
    if (invoke) {stop('argument is not numeric')}
  }

  return(exceptions)
}
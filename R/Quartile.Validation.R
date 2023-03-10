#' Quartile Validations
#'
#' @description
#' `Quartile.Validations()` is an internal function that returns a set of validators used by `Quartile.Service()`.
#' * The first validator: `DataExist`, checks if a non-null data argument was provided.
#' * The second validator: `DataIsNumeric`, checks if the data argument provided contains numerical data.
#' @usage NULL
#' @returns A `list` of validators: 
#' * `DataExist()`
#' * `DataIsNumeric()`
Quartile.Validation <- \() {
  exception <- Quartile.Exceptions()

  validators <- list()

  validators[['Exist']]     <- \(data) {
    data |> is.null() |> exception[['NullException']]()
    return(data)
  }
  validators[['IsNumeric']] <- \(data) {
    data |> is.numeric() |> isFALSE() |> exception[['NumericException']]()
    return(data)
  }

  return(validators)
}
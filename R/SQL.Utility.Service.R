#' Helper Utilities
#' 
#' @description
#' Utility services not included in the standard set of SQL functions and used to perform primitive operations
#' 
#' @usage NULL
#' @returns A `list` of Helper Utilities: 
#' * `BRACKET(value)`
#' @export
SQL.Utility.Service <- \() {
  validate <- SQL.Utility.Validation()
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['BRACKET']] <- \(value) {
    value |> validate[['Exist']]()

    value |> utilities[['Inclose']]()
  }
  return(services)
}
#' SQL Functions'
#' 
#' @description
#' SQL contains a set of Utility Functions used to perform primitive operations
#' 
#' @usage NULL
#' @returns A `list` of SQL Functions: 
#' * `LOWER(value, alias)`
#' @export
SQL.Functions.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['LOWER']] <- \(value, alias) {
    value |>
      utilities[['Prepend']]('LOWER(') |>
      utilities[['Append']](') as ')   |>
      utilities[['Append']](alias)
  }
  return(services)
}
#' Data Query Language'
#' 
#' @description
#' DQL is a subset or SQL and used to perform queries against tables in SQL Database
#' 
#' @usage NULL
#' @returns A `list` of DQL Services: 
#' * `SELECT()`
#' * `FROM()`
#' * `WHERE()`
DQL.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['SELECT']]   <- \(input = '') {
    'SELECT' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['FROM']]     <- \(input) {
    'FROM' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['WHERE']]    <- \(input) {
    'WHERE' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  return(services)
}
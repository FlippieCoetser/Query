#' Data Query Language'
#' 
#' @description
#' DQL is a subset or SQL and used to perform queries against tables in SQL Database
#' 
#' @usage NULL
#' @returns A `list` of DQL Commands: 
#' * `SELECT(fields)`
#' * `FROM(table)`
#' * `WHERE(key, value)`
#' @export
DQL.Processing <- \(service) {
  processors <- list()
  processors[['SELECT']] <- \(fields = '*') {
    if ( fields |> is.list()) {
      service[['SELECT']]() |>
      service[['FIELDS']](fields)
    } else {
      service[['SELECT']]() |>
      service[['*']]()
    }
  }
  processors[['FROM']]   <- \(input, table) {
    input |>
      service[['FROM']]()   |>
      service[['SCHEMA']]() |>
      service[['TABLE']](table)
  }
  processors[['WHERE']]  <- \(input, key, value) {
    input |>
      service[['WHERE']]()     |>
      service[['KEY']](key)    |>
      service[['OPERATOR']]()  |>
      service[['VALUE']](value)  
  }
  return(processors)
}
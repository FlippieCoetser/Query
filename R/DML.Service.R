#' Data Manipulating Language
#' 
#' @description
#' DML is a subset or SQL and used to manipulating data in SQL Database
#' 
#' @usage NULL
#' @returns A `list` of DML Services: 
#' * `INSERT()`
#' * `INTO()`
#' * `SCHEMA(schema)`
#' * `TABLE(table)`
#' * `VALUES()`
#' * `KEYS(keyValues)`
#' * `NEWVALUES(keyValues)`
#' * `UPDATE()`
#' * `SET()`
#' * `KEYVALUES(keyValues)`
#' * `DELETE()`
DML.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['INSERT']]   <- \(input = '') {
    'INSERT' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['INTO']] <- \(input) {
    'INTO' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input) 
  }
  services[['VALUES']] <- \(input) {
    'VALUES' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input) 
  }
  services[['UPDATE']] <- \(input = '') {
    'UPDATE' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['SET']] <- \(input) {
    'SET' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['DELETE']] <- \(input = '') {
    'DELETE' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  return(services)
}
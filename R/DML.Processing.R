#' Data Manipulating Language
#' 
#' @description
#' DML is a subset or SQL and used to manipulating data in SQL Database
#' 
#' @usage NULL
#' @returns A `list` of DML Commands: 
#' * `INSERT(keyValues)`
#' * `VALUES(keyValues)`
#' * `UPDATE(table)`
#' * `SET(keyValues)`
#' * `DELETE(keyValues)`
#' @export
DML.Processing <- \(service) {
  processors <- list()
  processors[['INSERT']] <- \(table, keyValues) {
    service[['INSERT']]() |>
    service[['INTO']]()   |>
    service[['SCHEMA']]() |>
    service[['TABLE']](table)  |>
    service[['KEYS']](keyValues)
  }
  processors[['VALUES']] <- \(input, keyValues) {
    input |>
      service[['VALUES']]() |>
      service[['NEWVALUES']](keyValues)
  }
  processors[['UPDATE']] <- \(table) {
    service[['UPDATE']]() |>
    service[['SCHEMA']]() |>
    service[['TABLE']](table)
  }
  processors[['SET']] <- \(input, keyValues) {
    input |>
      service[['SET']]() |>
      service[['KEYVALUES']](keyValues)
  }
  processors[['DELETE']] <- \(...) {
    service[['DELETE']]()
  }
  return(processors)
}
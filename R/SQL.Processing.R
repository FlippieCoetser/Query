SQL.Processing <- \(service) {
  processors <- list()
  processors[['SELECT']] <- \(columns) {
    service[['KEYWORDS']][['SELECT']]() |>
    service[['UTILITIES']][['COLUMNS']](columns)
  }
  processors[['FROM']]   <- \(input, table) {
    input |>
      service[['KEYWORDS']][['FROM']]() |>
      service[['UTILITIES']][['SCHEMA']](table)
  }
  processors[['WHERE']]  <- \(input, key, value) {
    input |>
      service[['KEYWORDS']][['WHERE']]() |>
      service[['UTILITIES']][['KEYVALUE']](key, value)
  }
  processors[['INSERT']] <- \(table, columns) {
    service[['KEYWORDS']][['INSERT']]()       |>
    service[['KEYWORDS']][['INTO']]()         |>
    service[['UTILITIES']][['SCHEMA']](table) |>
    service[['UTILITIES']][['INCLOSELIST']](columns)
  }
  processors[['VALUES']] <- \(input, values) {
    input |>
      service[['KEYWORDS']][['VALUES']]() |>
      service[['UTILITIES']][['INCLOSELIST']](values)
  }
  processors[['UPDATE']] <- \(table) {
    service[['KEYWORDS']][['UPDATE']]() |>
    service[['UTILITIES']][['SCHEMA']](table) 
  }
  processors[['SET']]    <- \(input, pairs) {
    input |>
      service[['KEYWORDS']][['SET']]() |>
      service[['UTILITIES']][['KEYVALUES']](pairs) 
  }
  processors[['DELETE']] <- \() {
    service[['KEYWORDS']][['DELETE']]()
  }
  return(processors)
}
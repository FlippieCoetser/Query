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
  return(processors)
}
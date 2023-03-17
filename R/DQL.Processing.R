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
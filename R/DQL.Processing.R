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
  processors[['FROM']] <- \(input, table) {
    input |>
      service[['FROM']]()   |>
      service[['SCHEMA']]() |>
      service[['TABLE']](table)
  }
  return(processors)
}
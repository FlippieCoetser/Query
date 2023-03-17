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
  return(processors)
}
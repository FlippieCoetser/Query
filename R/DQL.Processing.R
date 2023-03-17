DQL.Processing <- \(service) {
  processors <- list()
  processors[['SELECT']] <- \(fields) {
    service[['SELECT']]() |>
    service[['*']]()
  }
  return(processors)
}
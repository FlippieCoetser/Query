Utility.Processing <- \(service) {
  processors <- list()
  processors[['Prepend']] <- \(field, string) {
    field |> service[['Prepend']](string)
  }
  return(processors)
}
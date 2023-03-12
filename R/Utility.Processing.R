Utility.Processing <- \(service) {
  processors <- list()
  processors[['Prepend']] <- \(field, string) {
    field |> service[['Prepend']](string)
  }
  processors[['Append']] <- \(field, string) {
    field |> service[['Append']](string)
  }
  return(processors)
}
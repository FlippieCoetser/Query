Utility.Broker <- \() {
  operations <- list()
  operations[['Prepend']] <- \(field, string) {
    string |> paste(field, sep = '')
  }
  return(operations)
}
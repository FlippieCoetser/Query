Utility.Broker <- \() {
  operations <- list()
  operations[['Prepend']] <- \(field, string) {
    string |> paste(field, sep = '')
  }
  operations[['Append']] <- \(field, string) {
    field |> paste(string, sep = '')
  }
  return(operations)
}
String.Utility.Broker <- \() {
  operations <- list()
  operations[['Append']] <- \(field, string) {
    field |> paste(string, sep = '')
  }
  operations[['Prepend']] <- \(field, string) {
    string |> paste(field, sep = '')
  }
  return(operations)
}
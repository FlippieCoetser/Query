String.Utility.Broker <- \() {
  operations <- list()
  operations[['Append']] <- \(field, string) {
    field |> paste(string, sep = '')
  }
  operations[['Prepend']] <- \(field, string) {
    string |> paste(field, sep = '')
  }
  operations[['Inclose']] <- \(field, before, after) {
    before |> paste(field, sep = '') |> paste(after, sep = '')
  }
  return(operations)
}
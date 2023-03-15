String.Utility.Broker <- \() {
  operations <- list()
  operations[['Append']] <- \(field, string) {
    field |> paste(string, sep = '')
  }
  return(operations)
}
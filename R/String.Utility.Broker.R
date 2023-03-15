String.Utility.Broker <- \() {
  operations <- list()
  operations[['Append']] <- \(field, string) {
    field |> paste(string, sep = '')
  }
  operations[['Prepend']] <- \(field, string) {
    
  }
  return(operations)
}
String.Utility.Broker <- \() {
  operations <- list()
  operations[['Inclose']] <- \(field, before, after) {
    before |> paste(field, sep = '') |> paste(after, sep = '')
  }
  return(operations)
}
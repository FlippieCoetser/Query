SQL.Functions.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['LOWER']] <- \(value, alias) {
    value |>
      utilities[['Prepend']]('LOWER(') |>
      utilities[['Append']](') as ')   |>
      utilities[['Append']](alias)
  }
  return(services)
}
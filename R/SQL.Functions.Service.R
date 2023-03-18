SQL.Functions.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['LOWER']] <- \(value) {
    value |>
      utilities[['Prepend']]('LOWER(') |>
      utilities[['Append']](')')
  }
  return(services)
}
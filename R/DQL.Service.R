DQL.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['SELECT']] <- \(input = '') {
    input |>
      utilities[['Append']]('SELECT') |>
      utilities[['Append']](' ')
  }
  services[['FIELDS']] <- \(input, fields) {
    fields |>
      utilities[['Collapse']]()    |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['*']]      <- \(input) {
    input |>
      utilities[['Append']]('*') |>
      utilities[['Append']](' ')
  }
  services[['FROM']]   <- \(input) {
    input |>
      utilities[['Append']]('FROM') |>
      utilities[['Append']](' ')
  }
  return(services)
}
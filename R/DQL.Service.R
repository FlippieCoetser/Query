DQL.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['SELECT']] <- \(input = '') {
    'SELECT' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['FIELDS']] <- \(input, fields) {
    fields |>
      utilities[['Collapse']]()    |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['*']]      <- \(input) {
    '*' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['FROM']]   <- \(input) {
    'FROM' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['TABLE']]  <- \(input, table) {
    table |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['SCHEMA']] <- \(input, schema) {
    schema |>
      utilities[['Append']]('.') |>
      utilities[['Prepend']](input)
  }
  return(services)
}
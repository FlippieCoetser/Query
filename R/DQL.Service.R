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
  services[['*']]        <- \(input) {
    '*' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['FROM']]     <- \(input) {
    'FROM' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['SCHEMA']]   <- \(input, schema = 'dbo') {
    schema |>
      utilities[['Inclose']]()   |>
      utilities[['Append']]('.') |>
      utilities[['Prepend']](input)
  }
  services[['TABLE']]    <- \(input, table) {
    table |>
      utilities[['Inclose']]()     |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['WHERE']]    <- \(input) {
    
  }
  services[['KEY']]      <- \(input, key) {
    key |>
      utilities[['Inclose']]()     |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['OPERATOR']] <- \(input, operator = '=' ) {
    operator |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['VALUE']]    <- \(input, value) {
    if (value |> is.character()) {
      value |>
        utilities[['Inclose']]('Quotes') |>
        utilities[['Append']](' ')       |>
        utilities[['Prepend']](input)
    } else {
      value |>
        utilities[['Append']](' ')   |>
        utilities[['Prepend']](input)
    }
  }
  return(services)
}
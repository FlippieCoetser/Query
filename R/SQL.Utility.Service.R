#' Helper Utilities
#' 
#' @description
#' Utility services not included in the standard set of SQL functions and used to perform primitive operations
#' 
#' @usage NULL
#' @returns A `list` of Helper Utilities: 
#' * `BRACKET(value)`
#' @export
SQL.Utility.Service <- \() {
  validate <- SQL.Utility.Validation()
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['BRACKET']]  <- \(value) {
    value |> validate[['Exist']]()

    value |> utilities[['Inclose']]()
  }
  services[['FIELDS']]   <- \(input, fields) {
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
  services[['KEYS']]     <- \(input, keyValues) {
    keyValues |>
      names()                         |>
      utilities[['Inclose']]()        |>
      utilities[['Collapse']]()       |>
      utilities[['Inclose']]('Round') |>
      utilities[['Append']](' ')      |>
      utilities[['Prepend']](input) 
  }
  services[['NEWVALUES']] <- \(input, keyValues) {
    keyValues |>
      utilities[['Inclose']]('Quotes') |>
      utilities[['Collapse']]()        |>
      utilities[['Inclose']]('Round')  |>
      utilities[['Append']](' ')       |>
      utilities[['Prepend']](input) 
  }
  services[['KEYVALUES']] <- \(input, keyValues) {
    keys   <- keyValues |> names() |> utilities[['Inclose']]()
    values <- keyValues |> utilities[['Inclose']]('Quotes')

    keys |>  
      utilities[['Pair']](values) |>
      utilities[['Collapse']]() |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['FORMATNULL']] <- \(value) {
    "'NULL'" |> gsub("NULL",value)
  }
  return(services)
}
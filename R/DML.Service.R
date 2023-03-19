#' Data Manipulating Language
#' 
#' @description
#' DML is a subset or SQL and used to manipulating data in SQL Database
#' 
#' @usage NULL
#' @returns A `list` of DML Services: 
#' * `INSERT()`
#' * `INTO()`
#' * `SCHEMA(schema)`
#' * `TABLE(table)`
#' * `VALUES()`
#' * `KEYS(keyValues)`
#' * `NEWVALUES(keyValues)`
#' @export
DML.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['INSERT']]   <- \(input = '') {
    'INSERT' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['INTO']] <- \(input) {
    'INTO' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input) 
  }
  services[['SCHEMA']] <- \(input, schema = 'dbo') {
    schema |>
      utilities[['Inclose']]()   |>
      utilities[['Append']]('.') |>
      utilities[['Prepend']](input)
  }
  services[['TABLE']] <- \(input, table) {
    table |>
      utilities[['Inclose']]()     |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['VALUES']] <- \(input) {
    'VALUES' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input) 
  }
  services[['KEYS']] <- \(input, keyValues) {
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
  services[['UPDATE']] <- \(input = '') {
    'UPDATE' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['SET']] <- \(input) {
    'SET' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['KEYVALUES']] <- \(input, keyValues) {
    keys <- keyValues |> names() |> utilities[['Inclose']]()
    values <- keyValues |> utilities[['Inclose']]('Quotes')

    keys |>  
      utilities[['CreateKeyValuePairs']](values) |>
      utilities[['Collapse']]() |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['DELETE']] <- \(input) {
    'DELETE' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  return(services)
}
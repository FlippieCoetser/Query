SQL.Broker <- \(...){
  utilities <-
    Utility.Broker() |> 
    Utility.Service()|>
    Utility.Processing()

  operations <- list()
  operations[['UTILITIES']] <- list()
  operations[['UTILITIES']][['SCHEMA']]      <- \(input, table) {
    table |>
      utilities[['Inclose']]() |>
      utilities[['Prepend']]('[dbo].') |>
      utilities[['Append']](' ') |>
      utilities[['Prepend']](input)
  }
  operations[['UTILITIES']][['COLUMNS']]     <- \(input, columns) {
    columns |>
      utilities[['Collapse']]()  |>
      utilities[['Append']](' ') |>
      utilities[['Prepend']](input)
  }
  operations[['UTILITIES']][['KEYVALUE']]    <- \(input, key, value) {
    key |>
      utilities[['Inclose']]()     |>
      utilities[['Append']](' = ') |>
      utilities[['Append']](value) |>
      utilities[['Append']](' ') |>
      utilities[['Prepend']](input)
  }
  operations[['UTILITIES']][['KEYVALUES']]   <- \(input, pairs) { 
    pairs <- pairs |> lapply(utilities[['IncloseString']])
    Values <- \(name, items) { paste(name, items, sep='')} 
    pairs |> 
      names() |> 
      utilities[['Inclose']]() |> 
      utilities[['Append']](' = ') |> 
      Values(pairs) |> 
      utilities[['Collapse']]()  |>
      utilities[['Append']](' ') |>
      utilities[['Prepend']](input)
  }
  operations[['UTILITIES']][['INCLOSEVALUES']] <- \(input, values) {
    values |>
      utilities[['IncloseStrings']]() |>
      utilities[['Collapse']]()  |>
      utilities[['Inclose']]('Round')  |>
      utilities[['Append']](' ') |>
      utilities[['Prepend']](input)
  }
  operations[['UTILITIES']][['INCLOSELIST']] <- \(input, items) {
    items |>
      utilities[['Collapse']]()  |>
      utilities[['Inclose']]('Round')  |>
      utilities[['Append']](' ') |>
      utilities[['Prepend']](input)
  }
  operations[['UTILITIES']][['INCLOSE']]     <- \(field, type = 'Square') {
    field |> 
      utilities[['Inclose']](type)
  }

  operations[['FUNCTIONS']] <- list()
  operations[['FUNCTIONS']][['LOWER']] <- \(field, alias) {
    field |> 
      utilities[['Prepend']]('LOWER(') |> 
      utilities[['Append']](') as ')   |> 
      utilities[['Append']](alias)
  }

  operations[['KEYWORDS']] <- list()
  operations[['KEYWORDS']][['SELECT']] <- \(input = '') {
    input |>
      utilities[['Append']]('SELECT') |>
      utilities[['Append']](' ')
  }
  operations[['KEYWORDS']][['FROM']]   <- \(input) {
    input |>
      utilities[['Append']]('FROM') |>
      utilities[['Append']](' ')
  }
  operations[['KEYWORDS']][['WHERE']]  <- \(input) {
    input |>
      utilities[['Append']]('WHERE') |>
      utilities[['Append']](' ')
  }
  operations[['KEYWORDS']][['INSERT']] <- \(input = '') {
    input |>
      utilities[['Append']]('INSERT') |>
      utilities[['Append']](' ')
  }
  operations[['KEYWORDS']][['INTO']] <- \(input) {
    input |>
      utilities[['Append']]('INTO') |>
      utilities[['Append']](' ')
  }
  operations[['KEYWORDS']][['VALUES']] <- \(input) {
    input |>
      utilities[['Append']]('VALUES') |>
      utilities[['Append']](' ')
  }
  operations[['KEYWORDS']][['UPDATE']] <- \(input = '') {
    input |>
      utilities[['Append']]('UPDATE') |>
      utilities[['Append']](' ')
  }
  operations[['KEYWORDS']][['SET']] <- \(input) {
    input |>
      utilities[['Append']]('SET') |>
      utilities[['Append']](' ')
  }
  operations[['KEYWORDS']][['DELETE']] <- \(input = '') {
    input |>
      utilities[['Append']]('DELETE') |>
      utilities[['Append']](' ')
  }
  return(operations)
}
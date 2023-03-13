SQL.Broker <- \(...){
  utilities <-
    Utility.Broker() |> 
    Utility.Service()|>
    Utility.Processing()

  operations <- list()
  operations[['UTILITIES']] <- list()
  operations[['UTILITIES']][['SCHEMA']] <- \(input, table) {
    table |>
      utilities[['Inclose']]() |>
      utilities[['Prepend']]('[dbo].') |>
      utilities[['Append']](' ') |>
      utilities[['Prepend']](input)
  }
  operations[['UTILITIES']][['INCLOSE']] <- \(field) {
    field |> 
      utilities[['Inclose']]()
  }
  operations[['FUNCTIONS']] <- list()
  operations[['FUNCTIONS']][['LOWER']] <- \(field, alias) {
    field |> 
      utilities[['Prepend']]('LOWER(') |> 
      utilities[['Append']](') as ')   |> 
      utilities[['Append']](alias)
  }
  operations[['KEYWORDS']] <- list()
  operations[['KEYWORDS']][['SELECT']] <- \(input) {
    input |>
      utilities[['Append']]('SELECT') |>
      utilities[['Append']](' ')
  }
  operations[['KEYWORDS']][['FROM']] <- \(input) {
    input |>
      utilities[['Append']]('FROM') |>
      utilities[['Append']](' ')
  }
  operations[['KEYWORDS']][['WHERE']] <- \(input) {
    input |>
      utilities[['Append']]('WHERE') |>
      utilities[['Append']](' ')
  }
  operations[['INCLOSE']] <- \(field) {
    field |> 
      utilities[['Inclose']]()
  }
  operations[['LOWER']] <- \(field, alias) {
    field |> 
      utilities[['Prepend']]('LOWER(') |> 
      utilities[['Append']](') as ')   |> 
      utilities[['Append']](alias)
  }
  operations[['SELECT']] <- \(fields) {
    fields |> 
      utilities[['Collapse']]()         |> 
      utilities[['Prepend']]('SELECT ') |>
      utilities[['Append']](' ')
  }
  operations[['FROM']] <- \(statement, table) {
    table |> 
      utilities[['Inclose']]()          |>
      utilities[['Prepend']]('[dbo].')  |>
      utilities[['Prepend']]('FROM ')   |> 
      utilities[['Prepend']](statement) |>
      utilities[['Append']](' ')
  }
  operations[['WHERE']] <- \(from, field, value) {
    field |> 
      utilities[['Inclose']]()          |>
      utilities[['Prepend']]('WHERE ')  |> 
      utilities[['Append']](" = ")      |>
      utilities[['Append']](value)      |>
      utilities[['Prepend']](from)      |>
      utilities[['Append']](' ')
  }
  operations[['INSERT']] <- \(table, fields) {
    fields |> 
      utilities[['Collapse']]()              |> 
      utilities[['Inclose']]('Round')        |> 
      utilities[['Prepend']]('] ')           |>
      utilities[['Prepend']](table)          |>
      utilities[['Prepend']]('[')            |>
      utilities[['Prepend']]('[dbo].')       |>
      utilities[['Prepend']]('INSERT INTO ') |>
      utilities[['Append']](' ') 
  }
  operations[['VALUES']] <- \(insert, values) {
    values |>
      utilities[['Collapse']]()         |>
      utilities[['Inclose']]('Round')   |>
      utilities[['Prepend']]('VALUES ') |>
      utilities[['Prepend']](insert)    |>
      utilities[['Append']](' ')
  }
  operations[['UPDATE']] <- \(table) {
    table |>
      utilities[['Inclose']]()          |>
      utilities[['Prepend']]('[dbo].')  |>
      utilities[['Prepend']]('UPDATE ') |>
      utilities[['Append']](' ')
  }
  return(operations)
}
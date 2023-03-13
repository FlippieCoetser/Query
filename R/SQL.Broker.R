SQL.Broker <- \(...){
  utilities <-
    Utility.Broker() |> 
    Utility.Service()|>
    Utility.Processing()

  operations <- list()
  operations[['UTILITIES']] <- utilities
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
      utilities[['Collapse']]() |> 
      utilities[['Prepend']]('SELECT ')
  }
  operations[['FROM']] <- \(statement, table) {
    table |> 
      utilities[['Inclose']]() |>
      utilities[['Prepend']](' FROM [dbo].') |> 
      utilities[['Prepend']](statement)
  }
  operations[['WHERE']] <- \(from, field, value) {
    field |> 
      utilities[['Inclose']]()          |>
      utilities[['Prepend']](' WHERE ') |> 
      utilities[['Append']](" = ")      |>
      utilities[['Append']](value)      |>
      utilities[['Prepend']](from)
  }
  operations[['INSERT']] <- \(table, fields) {
    fields |> 
      utilities[['Collapse']]() |> 
      utilities[['Inclose']]('Round') |> 
      utilities[['Prepend']]('] ') |>
      utilities[['Prepend']](table) |>
      utilities[['Prepend']]('INSERT INTO [dbo].[')  
  }
  operations[['VALUES']] <- \(insert, values) {
    values |>
      utilities[['Collapse']]() |>
      utilities[['Inclose']]('Round')    |>
      utilities[['Prepend']](' VALUES ') |>
      utilities[['Prepend']](insert) 
  }
  return(operations)
}
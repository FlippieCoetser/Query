SQL.Broker <- \(...){
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  operations <- list()
  operations[['INCLOSE']] <- \(field) {
    field |> 
      utilities[['IncloseInSquareBrackets']]()
  }
  operations[['LOWER']] <- \(field, alias) {
    field |> 
      utilities[['Prepend']]('LOWER(') |> 
      utilities[['Append']](') as ')   |> 
      utilities[['Append']](alias)
  }
  operations[['SELECT']] <- \(fields) {
    fields |> 
      paste(collapse = ', ') |> 
      utilities[['Prepend']]('SELECT ')
  }
  operations[['FROM']] <- \(statement, table) {
    table |> 
      utilities[['IncloseInSquareBrackets']]() |>
      utilities[['Prepend']](' FROM [dbo].') |> 
      utilities[['Prepend']](statement)
  }
  operations[['WHERE']] <- \(from, field, value) {
    field |> 
      utilities[['IncloseInSquareBrackets']]()         |>
      utilities[['Prepend']](' WHERE')  |> 
      utilities[['Append']](" = '")     |>
      utilities[['Append']](value)      |>
      utilities[['Append']]("'")        |>
      utilities[['Prepend']](from)
  }
  operations[['INSERT']] <- \(table, fields) {
    fields |> 
      paste(collapse = ', ') |> 
      utilities[['Prepend']]('] (') |> 
      utilities[['Append']](')') |>
      utilities[['Prepend']](table) |>
      utilities[['Prepend']]('INSERT INTO [dbo].[')  
  }
  operations[['VALUES']] <- \(insert, values) {
    "'" |>
      paste(values, sep = '') |>
      paste("'", sep = '')    |>
      paste(collapse = ', ')  |>
      utilities[['Prepend']](' VALUES (') |>
      utilities[['Append']](')') |>
      utilities[['Prepend']](insert) 
  }
  return(operations)
}
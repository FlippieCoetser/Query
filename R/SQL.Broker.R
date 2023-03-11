SQL.Broker <- \(...){
  utilities <-
    Utility.Broker() |> 
    Utility.Service()

  operations <- list()
  operations[['INCLOSE']] <- \(field) {
    field |> 
      utilities[['Prepend']]('[') |> 
      utilities[['Append']](']')
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
      operations[['INCLOSE']]() |>
      utilities[['Prepend']](' FROM [dbo].') |> 
      utilities[['Prepend']](statement)
  }
  operations[['WHERE']] <- \(from, field, value) {
    field |> 
      operations[['INCLOSE']]()         |>
      utilities[['Prepend']](' WHERE')  |> 
      utilities[['Append']](" = '")     |>
      utilities[['Append']](value)      |>
      utilities[['Append']]("'")        |>
      utilities[['Prepend']](from)
  }
  return(operations)
}
SQL.Orchestration <- \(args) {
  dql   <- DQL.Service()
  dml   <- DML.Service()
  utilities <- SQL.Utility.Service() 

  orchestrations <- list()
  orchestrations[['SELECT']] <- \(fields = '*') {
    selections <- list()
    selections[[1]] <- \() dql[['SELECT']]() |> utilities[['*']]() 
    selections[[2]] <- \() dql[['SELECT']]() |> utilities[['FIELDS']](fields) 
    selections[[(fields |> is.list()) + 1]]()    
  }
  orchestrations[['FROM']]   <- \(input, table) {
    input |>
      dql[['FROM']]()        |> 
      utilities[['SCHEMA']]()    |> 
      utilities[['TABLE']](table)
  }
  orchestrations[['WHERE']] <- \(input, key, value) {
    input |>
      dql[['WHERE']]()      |> 
      utilities[['KEY']](key)   |> 
      utilities[['OPERATOR']]() |> 
      utilities[['VALUE']](value) 
  }
  orchestrations[['INSERT']] <- \(table, keyValues) {
    dml[['INSERT']]()            |>
    dml[['INTO']]()              |>
    utilities[['SCHEMA']]()      |>
    utilities[['TABLE']](table)  |>
    utilities[['KEYS']](keyValues)
  }
  orchestrations[['VALUES']] <- \(input, keyValues) {
    input |>
      dml[['VALUES']]() |>
      utilities[['NEWVALUES']](keyValues)
  }
  orchestrations[['UPDATE']] <- \(table) {
    dml[['UPDATE']]() |>
    utilities[['SCHEMA']]() |>
    utilities[['TABLE']](table)
  }
  orchestrations[['SET']] <- \(input, keyValues) {
    input |>
      dml[['SET']]() |>
      utilities[['KEYVALUES']](keyValues)
  }
  orchestrations[['DELETE']] <- \() {
    dml[['DELETE']]()
  }
  return(orchestrations)
}
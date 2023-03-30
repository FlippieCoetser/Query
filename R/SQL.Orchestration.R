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
    dml[['INSERT']]() |>
    dml[['INTO']]()   |>
    dml[['SCHEMA']]() |>
    dml[['TABLE']](table)  |>
    dml[['KEYS']](keyValues)
  }
  return(orchestrations)
}
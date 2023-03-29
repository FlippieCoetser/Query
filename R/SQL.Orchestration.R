SQL.Orchestration <- \(args) {
  service   <- DQL.Service()
  processor <- service |> DQL.Processing()
  utilities <- SQL.Utility.Service() 


  orchestrations <- list()
  orchestrations[['SELECT']] <- \(fields = '*') {

    selections <- list()
    selections[[1]] <- \() service[['SELECT']]() |> service[['*']]() 
    selections[[2]] <- \() service[['SELECT']]() |> utilities[['FIELDS']](fields) 

    selections[[(fields |> is.list()) + 1]]()    
  }
  return(orchestrations)
}
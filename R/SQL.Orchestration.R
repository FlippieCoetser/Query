SQL.Orchestration <- \(args) {
  processor <- DQL.Service() |> DQL.Processing()

  orchestrations <- list()
  orchestrations[['SELECT']] <- \(fields = '*') {
    processor[['SELECT']](fields) 
  }
  return(orchestrations)
}
String.Utility.Processing <- \(service) {
  processors <- list()
  processors[['Inclose']] <- \(field) { 
    field |> service[['Inclose']]('[',']')    
  }
  return(processors)
}
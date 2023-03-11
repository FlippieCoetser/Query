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
  operations[['LOWER']] <- \(field) {
    
  }
  return(operations)
}
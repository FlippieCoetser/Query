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
  return(operations)
}
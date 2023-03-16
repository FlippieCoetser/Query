String.Utility.Processing <- \(service) {
  processors <- list()
  processors[['Inclose']] <- \(field, type = 'Square') { 
    types <- list()
    types[['Square']] <- \(field) field |> service[['Inclose']]('[',']')   
    types[['Round']]  <- \(field) field |> service[['Inclose']]('(',')') 

    types[[type]](field)
  }
  return(processors)
}
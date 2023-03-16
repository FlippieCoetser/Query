String.Utility.Processing <- \(service) {
  processors <- list()
  processors[['Append']]  <- \(field, string) {
    field |> service[['Append']](string)
  }
  processors[['Inclose']] <- \(field, type = 'Square') { 
    types <- list()
    types[['Square']] <- \(field) field |> service[['Inclose']]('[',']')   
    types[['Round']]  <- \(field) field |> service[['Inclose']]('(',')') 
    types[['Quotes']] <- \(field) field |> service[['Inclose']]("'","'")

    types[[type]](field)
  }
  return(processors)
}
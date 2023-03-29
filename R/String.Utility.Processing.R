String.Utility.Processing <- \(service) {
  processors <- list()
  processors[['Append']]   <- \(string.one, string.two) {
    string.one |> service[['Append']](string.two)
  }
  processors[['Prepend']]  <- \(string.one, string.two) {
    string.one |> service[['Prepend']](string.two)
  }
  processors[['Inclose']]  <- \(value, type = 'Square') { 
    types <- list()
    types[['Square']] <- \(value) value |> service[['Inclose']]('[',']')   
    types[['Round']]  <- \(value) value |> service[['Inclose']]('(',')') 
    types[['Quotes']] <- \(value) value |> service[['Inclose']]("'","'")

    types[[type]](value)
  }
  processors[['Collapse']] <- \(items) {
    items |> service[['Collapse']]()
  }
  processors[['Pair']] <- \(keys, values) {
    keys |> service[['Pair']](values)
  }
  return(processors)
}
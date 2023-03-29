String.Utility.Service <- \() {
  validate <- String.Utility.Validation()
  
  services <- list()
  services[['Append']]   <- \(string.one, string.two) {
    string.one |> validate[['Exist']]()
    string.two |> validate[['Exist']]()

    string.one |> paste(string.two, sep = '')
  }
  services[['Prepend']]  <- \(string.one, string.two) {
    string.one |> validate[['Exist']]()
    string.two |> validate[['Exist']]()

    string.two |> paste(string.one, sep = '')
  }
  services[['Inclose']]  <- \(value, before, after) {
    value  |> validate[['Exist']]()
    before |> validate[['Exist']]() |> validate[['IsCharacter']]()
    after  |> validate[['Exist']]() |> validate[['IsCharacter']]()

    before |> paste(value, sep = '') |> paste(after, sep = '')
  }
  services[['Collapse']] <- \(items) {
    items |> validate[['Exist']]() 

    items |> paste(collapse = ', ')
  }
  services[['Pair']]     <- \(keys, values) {
    keys   |> validate[['Exist']]() 
    values |> validate[['Exist']]()
    
    keys |> paste(values, sep = ' = ')
  }
  return(services)
}
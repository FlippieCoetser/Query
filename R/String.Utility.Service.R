String.Utility.Service <- \() {
  validate <- String.Utility.Validation()
  
  services <- list()
  services[['Append']]  <- \(field, string) {
    field  |> validate[['Exist']]()
    string |> validate[['Exist']]()

    field |> paste(string, sep = '')
  }
  services[['Prepend']] <- \(field, string) {
    field  |> validate[['Exist']]()
    string |> validate[['Exist']]()

    string |> paste(field, sep = '')
  }
  services[['Inclose']] <- \(field, before, after) {
    field   |> validate[['Exist']]()
    before  |> validate[['Exist']]() |> validate[['IsString']]()
    after   |> validate[['Exist']]() |> validate[['IsString']]()

    before |> paste(field, sep = '') |> paste(after, sep = '')
  }
  services[['Collapse']] <- \(items) {
    items |> paste(collapse = ', ')
  }
  services[['CreateKeyValuePairs']] <- \(keys, values) {
    
  }
  return(services)
}
String.Utility.Service <- \(broker) {
  validate <- String.Utility.Validation()
  
  services <- list()
  services[['Append']] <- \(field, string) {
    field  |> validate[['Exist']]()
    string |> validate[['Exist']]()

    field |> paste(string, sep = '')
  }
  services[['Prepend']] <- \(field, string) {
    string |> paste(field, sep = '')
  }
  return(services)
}
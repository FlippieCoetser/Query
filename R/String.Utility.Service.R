String.Utility.Service <- \(broker) {
  validate <- String.Utility.Validation()
  
  services <- list()
  services[['Append']] <- \(field, string) {
    field  |> validate[['Exist']]()

    string |> validate[['Exist']]()

    field |> broker[['Append']](string)
  }
  return(services)
}
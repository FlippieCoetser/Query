Utility.Service <- \(broker) {
  validate <- Utility.Validation()

  services <- list()
  services[['Prepend']] <- \(field, string) {
    field |>
      validate[['Exist']]() |>
      validate[['IsCharacter']]()

    string |>
      validate[['Exist']]() |>
      validate[['IsCharacter']]()

    field |> 
      broker[['Prepend']](string)
  }
  return(services)
}
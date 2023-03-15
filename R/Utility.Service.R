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
  services[['Append']]  <- \(field, string) {
    field |>
      validate[['Exist']]() |>
      validate[['IsCharacter']]()

    string |>
      validate[['Exist']]() |>
      validate[['IsCharacter']]()

    field |> 
      broker[['Append']](string)
  }
  services[['IncloseInSquareBrackets']] <- \(field) {
    field |>
      broker[['IncloseInSquareBrackets']]()
  }
  services[['IncloseInRoundBrackets']] <- \(field) {
    field |>
      broker[['IncloseInRoundBrackets']]()
  }
  services[['IncloseInQuotes']] <- \(field) {
    field |>
      broker[['IncloseInQuotes']]()
  }
  services[['CollapseWithComma']] <- \(fields) {
    fields |>
      validate[['Exist']]()

    fields |>
      broker[['CollapseWithComma']]()
  }
  return(services)
}
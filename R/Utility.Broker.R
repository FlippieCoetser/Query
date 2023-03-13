Utility.Broker <- \() {
  operations <- list()
  operations[['Prepend']] <- \(field, string) {
    string |> paste(field, sep = '')
  }
  operations[['Append']] <- \(field, string) {
    field |> paste(string, sep = '')
  }
  operations[['IncloseInSquareBrackets']] <- \(field) {
    field |> 
      operations[['Prepend']]('[') |> 
      operations[['Append']](']')
  }
  operations[['IncloseInRoundBrackets']] <- \(field) {
    field |> 
      operations[['Prepend']]('(') |> 
      operations[['Append']](')')
  }
  operations[['IncloseInQuotes']] <- \(field) {
    field |> 
      operations[['Prepend']]("'") |> 
      operations[['Append']]("'")
  }
  operations[['CollapseWithComma']] <- \(fields) {
    fields |>
      paste(collapse = ', ')
  }
  return(operations)
}
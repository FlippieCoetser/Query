Utility.Processing <- \(service) {
  processors <- list()
  processors[['Prepend']] <- \(field, string) {
    field |> service[['Prepend']](string)
  }
  processors[['Append']] <- \(field, string) {
    field |> service[['Append']](string)
  }
  processors[['Inclose']] <- \(field, type = 'Square') {
    types <- list()
    types[['Square']] <- service[['IncloseInSquareBrackets']]
    types[['Round']]  <- service[['IncloseInRoundBrackets']]
    types[['Quotes']] <- service[['IncloseInQuotes']]
    
    field |> types[[type]]()
  }
  processors[['CollapseWithComma']] <- \(fields) {
    fields |> service[['CollapseWithComma']]()
  }
  return(processors)
}
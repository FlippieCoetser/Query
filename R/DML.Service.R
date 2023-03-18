DML.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['INSERT']]   <- \(input = '') {
    'INSERT' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input)
  }
  services[['INTO']] <- \(input) {
    'INTO' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input) 
  }
  services[['SCHEMA']] <- \(input, schema = 'dbo') {
    
  }
  services[['VALUES']] <- \(input) {
    'VALUES' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input) 
  }
  services[['KEYS']] <- \(input, keyValues) {
    keyValues |>
      names()                         |>
      utilities[['Inclose']]()        |>
      utilities[['Collapse']]()       |>
      utilities[['Inclose']]('Round') |>
      utilities[['Append']](' ')      |>
      utilities[['Prepend']](input) 
  }
  services[['NEWVALUES']] <- \(input, keyValues) {
    keyValues |>
      utilities[['Inclose']]('Quotes') |>
      utilities[['Collapse']]()        |>
      utilities[['Inclose']]('Round')  |>
      utilities[['Append']](' ')       |>
      utilities[['Prepend']](input) 
  }
  return(services)
}
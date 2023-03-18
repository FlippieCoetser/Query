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
  services[['VALUES']] <- \(input) {
    'VALUES' |>
      utilities[['Append']](' ')   |>
      utilities[['Prepend']](input) 
  }
  services[['KEYS']] <- \(input, keys) {
    
  }
  return(services)
}
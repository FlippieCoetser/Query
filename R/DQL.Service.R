DQL.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['SELECT']] <- \(input = '') {
    input |>
      utilities[['Append']]('SELECT') |>
      utilities[['Append']](' ')
  }
  services[['FIELDS']] <- \(input, fields) {
    
  }
  return(services)
}
SQL.Utility.Service <- \() {
  utilities <-
    String.Utility.Service() |>
    String.Utility.Processing()

  services <- list()
  services[['BRACKET']] <- \(value) {
    value |> utilities[['Inclose']]()
  }
  return(services)
}
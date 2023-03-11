Utility.Service <- \(broker) {
  services <- list()
  services[['Prepend']] <- \(field, string) {
    field |> broker[['Prepend']](string)
  }
  return(services)
}
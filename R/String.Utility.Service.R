String.Utility.Service <- \(broker) {
  services <- list()
  services[['Append']] <- \(field, string) {
    field |> broker[['Append']](string)
  }
  return(services)
}
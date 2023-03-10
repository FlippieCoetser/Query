IQR.Service <- \(broker) {
  validate <- IQR.Validation()

  services <- list()

  services[['IQRFromQuartiles']] <- \(quartiles) {
    quartiles |>
      validate[['Exist']]()            |>
      validate[['IsList']]()           |>
      validate[['HasFirstQuartile']]() |>
      validate[['HasThirdQuartile']]()

    quartiles |> 
      broker[['IQRFromQuartiles']]()
  }
  services[['IQRFromSample']] <- \(sample) {
    sample |>
      validate[['Exist']]() |>
      validate[['IsNumeric']]()

    sample |> 
      broker[['IQRFromSample']]()
  }

  return(services)
}
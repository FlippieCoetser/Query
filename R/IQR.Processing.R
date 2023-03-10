IQR.Processing <- \(service) {
  processors <- list()

  processors[['IQR']] <- \(input) {
    if (input |> is.numeric()) {
      input |> service[['IQRFromSample']]()
    } else {
      input |> service[['IQRFromQuartiles']]()
    } 
  }

  return(processors)
}
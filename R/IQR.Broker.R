IQR.Broker <- \() {
  quartile <- Quartile.Service()

  operations <- list()

  operations[['IQRFromQuartiles']] <- \(quartiles) {
    quartiles[['third']] - quartiles[['first']]
  }
  operations[['IQRFromSample']]    <- \(sample) {
    quartiles <- list()
    quartiles[['first']] <- sample |> quartile[['first']]()
    quartiles[['third']] <- sample |> quartile[['third']]()

    quartiles |> operations[['IQRFromQuartiles']]()
  }

  return(operations)
}
test_that('IQR.Broker exist',{
  IQR.Broker |>
    is.null()      |>
      expect_equal(FALSE)
})
test_that('IQR.Broker() returns a list of operations',{
  IQR.Broker() |>
    is.list()  |>
      expect_equal(TRUE)
})

# IQR From Quartiles
test_that('broker instance has IQRFromQuartiles operations',{
  # Given
  broker <- IQR.Broker()

  # Then 
  broker[['IQRFromQuartiles']] |>
    is.null()   |>
      expect_equal(FALSE) 
})
test_that("quartiles |> broker[['IQRFromQuartiles']]() returns InterQuartileRange",{
  # Given
  broker <- IQR.Broker()

  quartile <- Quartile.Service()
  data <- 1000 |> rnorm(10,5)

  quartiles <- list()
  quartiles[['first']] <- data |> quartile[['first']]()
  quartiles[['third']] <- data |> quartile[['third']]()

  # When 
  IQR <- quartiles[['third']] - quartiles[['first']]

  # Then 
  quartiles |>
    broker[['IQRFromQuartiles']]() |>
      expect_equal(IQR) 
})

# IQR From Sample
test_that('broker instance has IQRFromSample operations',{
    # Given
  broker <- IQR.Broker()

  # Then 
  broker[['IQRFromSample']] |>
    is.null()   |>
      expect_equal(FALSE) 
})
test_that("quartiles |> broker[['IQRFromSample']]() returns InterQuartileRange",{
  # Given
  broker <- IQR.Broker()

  quartile <- Quartile.Service()
  data <- 1000 |> rnorm(10,5)

  quartiles <- list()
  quartiles[['first']] <- data |> quartile[['first']]()
  quartiles[['third']] <- data |> quartile[['third']]()

  # When 
  IQR <- quartiles[['third']] - quartiles[['first']]

  # Then 
  data |>
    broker[['IQRFromSample']]() |>
      expect_equal(IQR) 
})
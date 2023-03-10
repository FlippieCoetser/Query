test_that('IQR.Service exist',{
  IQR.Service |>
    is.null()      |>
      expect_equal(FALSE)
})
test_that("IQR.Service() returns list of services",{
  # Given
  services <- 
    IQR.Broker() |>
    IQR.Service()

  # Then
  services |>
    is.list()      |>
      expect_equal(TRUE)
})

# IQR From Quartiles
test_that('service instance has IQRFromQuartiles service',{
  # Given
  services <- 
    IQR.Broker() |>
    IQR.Service()

  # Then
  services[['IQRFromQuartiles']] |>
    is.null()                    |>
      expect_equal(FALSE)
})
test_that("quartiles |> service[['IQRFromQuartiles']]() returns Interquartile range",{
  # Given
  service <- 
    IQR.Broker() |>
    IQR.Service()

  quartile <- Quartile.Service()
  data <- 1000 |> rnorm(10,5)

  quartiles <- list()
  quartiles[['first']] <- data |> quartile[['first']]()
  quartiles[['third']] <- data |> quartile[['third']]()

  # When
  IQR <- (quartiles[['third']] - quartiles[['first']])

  # Then
  quartiles |>
    service[['IQRFromQuartiles']]() |>
      expect_equal(IQR)
})

# IQR From Sample
test_that('service instance has IQRFromSample service',{
  # Given
  services <- 
    IQR.Broker() |>
    IQR.Service()

  # Then
  services[['IQRFromSample']] |>
    is.null()                 |>
      expect_equal(FALSE)
})
test_that("quartiles |> service[['IQRFromSample']]() returns Interquartile range",{
  # Given
  service <- 
    IQR.Broker() |>
    IQR.Service()

  quartile <- Quartile.Service()
  data <- 1000 |> rnorm(10,5)

  quartiles <- list()
  quartiles[['first']] <- data |> quartile[['first']]()
  quartiles[['third']] <- data |> quartile[['third']]()

  # When
  IQR <- (quartiles[['third']] - quartiles[['first']])

  # Then
  data |>
    service[['IQRFromSample']]() |>
      expect_equal(IQR)
})
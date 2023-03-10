test_that('IQR.Processing exist',{
  IQR.Processing   |>
    is.null()      |>
      expect_equal(FALSE)
})
test_that('IQR.Processing() returns a list of processors',{
  IQR.Processing() |>
    is.list()      |>
      expect_equal(TRUE)
})

# IQR Processor
test_that("processor instance has IQR",{
  # Given
  processors <-
    IQR.Broker()  |>
    IQR.Service() |>
    IQR.Processing()

  # Then
  processors[['IQR']] |>
    is.null() |>
      expect_equal(FALSE)
})
test_that("quartiles |> processor[['IQR']]() returns Interquartile range",{
  # Given
  processors <-
    IQR.Broker()  |>
    IQR.Service() |>
    IQR.Processing()

  quartile <- Quartile.Service()
  data <- 1000 |> rnorm(10,5)

  quartiles <- list()
  quartiles[['first']] <- data |> quartile[['first']]()
  quartiles[['third']] <- data |> quartile[['third']]()

  # When
  IQR <- (quartiles[['third']] - quartiles[['first']])

  # Then
  data |>
    processors[['IQR']]() |>
      expect_equal(IQR)
})
test_that("sample |> processor[['IQR']]() returns Interquartile range",{
  # Given
  processors <-
    IQR.Broker()  |>
    IQR.Service() |>
    IQR.Processing()

  quartile <- Quartile.Service()
  sample <- 1000 |> rnorm(10,5)

  quartiles <- list()
  quartiles[['first']] <- sample |> quartile[['first']]()
  quartiles[['third']] <- sample |> quartile[['third']]()

  # When
  IQR <- (quartiles[['third']] - quartiles[['first']])

  # Then
  sample |>
    processors[['IQR']]() |>
      expect_equal(IQR)
})
test_that("Quartile.Service exist",{
  Quartile.Service |>
    is.null()      |>
      expect_equal(FALSE)
})
test_that("Quartile.Service returns list of services",{
  Quartile.Service() |>
    is.list()        |>
      expect_equal(TRUE)
})

# First Quartile
test_that("quartile instance has first service",{
  # Given
  quartile <- Quartile.Service()

  # Then
  quartile[['first']] |>
    is.null()        |>
      expect_equal(FALSE)
})
test_that("data |> quartile[['first']]() return the first quartile of data",{
  # Given
  quartile <- Quartile.Service()
  data <- 1000 |> rnorm(10,5)

  value.expected <- data |> quantile(0.25)

  # Then
  data |>
    quartile[['first']]() |>
      expect_equal(value.expected)
})
test_that("data |> quartile[['first']]() throw exception when data is null",{
  # Given
  quartile <- Quartile.Service()

  # Then
  NULL |>
    quartile[['first']]() |>
      expect_error()
})
test_that("data |> quartile[['first']]() throw exception when data is not numeric",{
  # Given
  quartile <- Quartile.Service()

  # Then
  '' |>
    quartile[['first']]() |>
      expect_error()
})

# Third Quartile
test_that("quartile instance has third service",{
  # Given
  quartile <- Quartile.Service()

  # Then
  quartile[['third']] |>
    is.null()        |>
      expect_equal(FALSE)
})
test_that("data |> quartile[['third']]() return the third quartile of data",{
  # Given
  quartile <- Quartile.Service()
  data <- 1000 |> rnorm(10,5)

  value.expected <- data |> quantile(0.75)

  # Then
  data |>
    quartile[['third']]() |>
      expect_equal(value.expected)
})
test_that("data |> quartile[['third']]() throw exception when data is null",{
  # Given
  quartile <- Quartile.Service()

  # Then 
  NULL |>
    quartile[['third']]() |>
      expect_error()
})
test_that("data |> quartile[['third']]() throw exception when data is not numeric",{
  # Given
  quartile <- Quartile.Service()

  # Then
  '' |>
    quartile[['third']]() |>
      expect_error()
})

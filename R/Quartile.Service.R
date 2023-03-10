#' Quartile Utility Services
#'
#' @description
#' `Quartile.Service()` returns a set of utility functions that can be used to analyze data:
#' * The first function: `first`, calculates and returns the 25th percentile of a sample data set.
#' * The second function: `third`, calculates and returns the 75th percentile of a sample data set.
#' @usage NULL
#' @returns A `list` of utility functions: 
#' * `first(data)`
#' * `third(data)`
#' @examples
#' quartile <- Quartile.Service()
#' 
#' quartile.first <- 
#'   1000 |> rnorm(10,5) |> quartile[['first']]()
#' 
#' rm(quartile.first)
#' rm(quartile)
#' @export
Quartile.Service <- \() {
  validator <- Quartile.Validation()

  services <- list()

  services[['first']] <- \(data) {
    data |>
      validator[['Exist']]() |>
      validator[['IsNumeric']]()

    data |> 
      stats::quantile(0.25)
  }
  services[['third']] <- \(data) {
    data |>
      validator[['Exist']]() |>
      validator[['IsNumeric']]()

    data |> 
      stats::quantile(0.75)
  }

  return(services)
}
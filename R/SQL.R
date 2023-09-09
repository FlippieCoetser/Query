#' SQL Statement Generator
#'
#' @description
#' Generate SQL statement during runtime.
#' @usage NULL
#' @returns A `list` of utility functions: 
#' @export 
SQL <- \() {
  SQL.Orchestration()
}

#' SQL Utility Functions
#'
#' @description
#' Generate SQL statement during runtime.
#' @usage NULL
#' @returns A `list` of utility functions: 
#' @export
SQL.Utilities <- \() {
  SQL.Utility.Service()
}

#' SQL Functions
#'
#' @description
#' Generate SQL statement during runtime.
#' @usage NULL
#' @returns A `list` of utility functions: 
#' @export
SQL.Functions <- \() {
  SQL.Functions.Service()
}

.onLoad <- \(libname, pkgname) {
  assign('sql', SQL(), envir = .GlobalEnv)
  assign('sql.utilities', SQL.Utilities(), envir = .GlobalEnv)
  assign('sql.functions', SQL.Functions(), envir = .GlobalEnv)
}
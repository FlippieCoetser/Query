IQR.Validation <- \(){
  exception <- IQR.Exceptions()
  
  validators <- list()
  
  validators[['Exist']]     <- \(data) {
    data |> is.null() |> exception[['NullException']]()
    return(data)
  }
  validators[['IsNumeric']] <- \(data) {
    data |> is.numeric() |> isFALSE() |> exception[['NumericException']]()
    return(data)
  }
  validators[['IsList']] <- \(data) {
    data |> is.list() |> isFALSE() |> exception[['ListException']]()
    return(data)
  }
  validators[['HasFirstQuartile']] <- \(data) {
    data[['first']] |> is.null() |> exception[['FirstQuartileMissingException']]()
    return(data)
  }
  validators[['HasThirdQuartile']] <- \(data) {
    data[['third']] |> is.null() |> exception[['ThirdQuartileMissingException']]()
    return(data)
  }

  return(validators)
}
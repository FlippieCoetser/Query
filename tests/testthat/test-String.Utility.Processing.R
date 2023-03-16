test_that('String.Utility.Processing exist',{
  String.Utility.Processing   |>
    is.null() |>
      expect_equal(FALSE)
})
test_that('String.Utility.Processing() return list of processors',{
  String.Utility.Processing() |>
    is.list() |>
      expect_equal(TRUE)
})

# Inclose Processor
test_that('processors contain Inclose processor',{
  # Given 
  processor <- 
    String.Utility.Service()
    String.Utility.Processing()

  # Then
  processor[['Inclose']] |>
    Exist()              |>
      expect_equal(TRUE)
})
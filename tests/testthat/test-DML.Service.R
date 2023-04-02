describe("Given DML.Service",{
  it("exist",{
    # Given
    DML.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("When service <- DML.Service()",{
  it("then service is a list",{
    # Given
    service <- DML.Service()

    # Then
    service |> is.list() |> expect_equal(TRUE)
  })
  it("then service contains INSERT service",{
    # Given
    service <- DML.Service()

    # Then
    service[['INSERT']] |> Exist() |> expect_equal(TRUE)
  })
  it("then service contains INTO service",{
    # Given
    service <- DML.Service()

    # Then
    service[['INTO']] |> Exist() |> expect_equal(TRUE)
  })
  it("then service contains VALUES service",{
    # Given
    service <- DML.Service()

    # Then
    service[['VALUES']] |> Exist() |> expect_equal(TRUE)
  })
  it("then service contains UPDATE service",{
    # Given
    service <- DML.Service()

    # Then
    service[['UPDATE']] |> Exist() |> expect_equal(TRUE)
  })
  it("then service contains SET service",{
    # Given
    service <- DML.Service()

    # Then
    service[['SET']] |> Exist() |> expect_equal(TRUE)
  })
  it("then service contains DELETE service",{
    # Given
    service <- DML.Service()

    # Then
    service[['DELETE']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When input |> service[['INSERT']]()",{
  it("then INSERT keyword is returned",{
    # Given
    service <- DML.Service()

    input  <- 'input '
    output <- 'input INSERT '

    # Then
    input |> service[['INSERT']]() |> expect_equal(output)
  })
})

describe("When input |> service[['INTO']]()",{
  it("then INTO keyword is returned",{
    # Given
    service <- DML.Service()

    input  <- 'input '
    output <- 'input INTO '

    # Then
    input |> service[['INTO']]() |> expect_equal(output)
  })
})

describe("When input |> service[['VALUES']]()",{
  it("then VALUES keyword is returned",{
    # Given
    service <- DML.Service()

    input  <- 'input '
    output <- 'input VALUES '

    # Then
    input |> service[['VALUES']]() |> expect_equal(output)
  })
})

describe("When input |> service[['UPDATE']]()",{
  it("then UPDATE keyword is returned",{
    # Given
    service <- DML.Service()

    input  <- 'input '
    output <- 'input UPDATE '

    # Then
    input |> service[['UPDATE']]() |> expect_equal(output)
  })
})

describe("When input |> service[['SET']]()",{
  it("then SET keyword is returned",{
    # Given
    service <- DML.Service()

    input  <- 'input '
    output <- 'input SET '

    # Then
    input |> service[['SET']]() |> expect_equal(output)
  })
})

describe("When input |> service[['DELETE']]()",{
  it("then DELETE keyword is returned",{
    # Given
    service <- DML.Service()

    input  <- 'input '
    output <- 'input DELETE '

    # Then
    input |> service[['DELETE']]() |> expect_equal(output)
  })
})
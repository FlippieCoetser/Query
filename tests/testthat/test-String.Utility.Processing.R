describe("Given String.Utility.Processing",{
  it("exist",{
    # Given
    String.Utility.Processing |> is.null() |> expect_equal(FALSE)
  })
})

describe("When processors <- String.Utility.Processing()",{
  it("then processors is a list",{
    # Given
    services <- String.Utility.Processing()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
  it("then processors contains Append processor",{
    # Given
    processors <- String.Utility.Processing()

    # Then
    processors[['Append']] |> Exist() |> expect_equal(TRUE)
  })
  it("then services contains Prepend processor",{
    # Given
    processors <- String.Utility.Processing()

    # Then
    processors[['Prepend']] |> Exist() |> expect_equal(TRUE)
  })
  it("then processors contains Inclose processor",{
    # Given
    processors <- String.Utility.Processing()

    # Then
    processors[['Inclose']] |> Exist() |> expect_equal(TRUE)
  })
  it("then processors contains Collapse processor",{
    # Given
    processors <- String.Utility.Processing()

    # Then
    processors[['Collapse']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When string.one |> process[['Append']](string.two)",{
  it("then string.one is appended to string.two",{
    # Given
    process <- String.Utility.Service() |> String.Utility.Processing()

    # When
    string.one <- 'string.one'
    string.two <- 'string.two'

    # Then
    string.one |> process[['Append']](string.two) |> expect_equal('string.onestring.two')
  })
})

describe("When string.one |> process[['Prepend']](string.two)",{
  it("then string.two is appended to string.one",{
    # Given
    process <- String.Utility.Service() |> String.Utility.Processing()

    # When
    string.one <- 'string.one'
    string.two <- 'string.two'

    # Then
    string.one |> process[['Prepend']](string.two) |> expect_equal('string.twostring.one')
  })
})

describe("When value |> process[['Inclose']]()",{
  it("then value is inclosed with square brackets",{
    # Given
    process <- String.Utility.Service() |> String.Utility.Processing()

    # When
    value <- 'value'

    # Then
    value |> process[['Inclose']]() |> expect_equal('[value]')
  })
})
describe("When value |> process[['Inclose']]('Square')",{
  it("then value is inclosed with square brackets",{
    # Given
    process <- String.Utility.Service() |> String.Utility.Processing()

    # When
    value <- 'value'
    type  <- 'Square'

    # Then
    value |> process[['Inclose']](type) |> expect_equal('[value]')
  })
})
describe("When value |> process[['Inclose']]('Round')",{
  it("then value is inclosed with round brackets",{
    # Given
    process <- String.Utility.Service() |> String.Utility.Processing()

    # When
    value <- 'value'
    type  <- 'Round'

    # Then
    value |> process[['Inclose']](type) |> expect_equal('(value)')
  })
})
describe("When value |> process[['Inclose']]('Quotes')",{
  it("then value is inclosed with round brackets",{
    # Given
    process <- String.Utility.Service() |> String.Utility.Processing()

    # When
    value <- 'value'
    type  <- 'Quotes'

    # Then
    value |> process[['Inclose']](type) |> expect_equal("'value'")
  })
})

describe("When items |> process[['Collapse']]()",{
  it("then items are collapsed using comma separator",{
    # Given
    process <- String.Utility.Service() |> String.Utility.Processing()

    # When
    items <- list('one','two','three'
    )

    # Then
    items |> process[['Collapse']]() |> expect_equal('one, two, three')
  })
})

describe("When keys |> process[['CreateKeyValuePairs']](values)",{
  it("then keys and values are combined into key value pairs",{
    # Given
    process <- String.Utility.Service() |> String.Utility.Processing()

    # When
    keys   <- list(1, 2, 3)
    values <- list('one', 'two', 'three')

    # Then
    keys |> 
      process[['CreateKeyValuePairs']](values) |> 
        expect_equal(c('1 = one','2 = two','3 = three'))
  })
})

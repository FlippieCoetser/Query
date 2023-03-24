describe("Given String.Utility.Service",{
  it("exist",{
    # Given
    String.Utility.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("When services <- String.Utility.Service()",{
  it("then services is a list",{
    # Given
    services <- String.Utility.Service()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
  it("then services contains Append service",{
    # Given
    services <- String.Utility.Service()

    # Then
    services[['Append']] |> Exist() |> expect_equal(TRUE)
  })
  it("then services contains Prepend service",{
    # Given
    services <- String.Utility.Service()

    # Then
    services[['Prepend']] |> Exist() |> expect_equal(TRUE)
  })
  it("then services contains Inclose service",{
    # Given
    services <- String.Utility.Service()

    # Then
    services[['Inclose']] |> Exist() |> expect_equal(TRUE)
  })
  it("then services contains Collapse service",{
    # Given
    services <- String.Utility.Service()

    # Then
    services[['Collapse']] |> Exist() |> expect_equal(TRUE)
  })
})

describe("When string.one |> service[['Append']](string.two)",{
  it("then string.one is appended to string.two",{
    # Given
    service <- String.Utility.Service()

    # When
    string.one <- 'string.one'
    string.two <- 'string.two'

    # Then
    string.one |> service[['Append']](string.two) |> expect_equal('string.onestring.two')
  })
  it("then an argument is null exception is thrown if string.one is NULL",{
    # Given
    service <- String.Utility.Service()

    # When
    string.one <- NULL
    string.two <- 'string.two'

    # Then
    string.one |> service[['Append']](string.two) |> expect_error('argument is NULL')
  })
  it("then an argument is null exception is thrown if string.two is NULL",{
    # Given
    service <- String.Utility.Service()

    # When
    string.one <- 'string.one'
    string.two <- NULL

    # Then
    string.one |> service[['Append']](string.two) |> expect_error('argument is NULL')
  })
})

describe("When string.one |> service[['Prepend']](string.two)",{
  it("then string.one is prepended to string.two",{
    # Given
    service <- String.Utility.Service()

    # When
    string.one <- 'string.one'
    string.two <- 'string.two'

    # Then
    string.one |> service[['Prepend']](string.two) |> expect_equal('string.twostring.one')
  })
  it("then an argument is null exception is thrown if string.one is NULL",{
    # Given
    service <- String.Utility.Service()

    # When
    string.one <- NULL
    string.two <- 'string.two'

    # Then
    string.one |> service[['Prepend']](string.two) |> expect_error('argument is NULL')
  })
  it("then an argument is null exception is thrown if string.two is NULL",{
    # Given
    service <- String.Utility.Service()

    # When
    string.one <- 'string.one'
    string.two <- NULL

    # Then
    string.one |> service[['Prepend']](string.two) |> expect_error('argument is NULL')
  })
})

describe("When value |> service[['Inclose']](before, after)",{
  it("then value is inclosed with before and after",{
    # Given
    service <- String.Utility.Service()

    # When
    value  <- 'value'
    before <- 'before'
    after  <- 'after'

    # Then
    value |> service[['Inclose']](before, after) |> expect_equal('beforevalueafter')
  })
  it("then an argument is null exception is thrown if value is NULL",{
    # Given
    service <- String.Utility.Service()

    # When
    value  <- NULL
    before <- 'before'
    after  <- 'after'

    # Then
    value |> service[['Inclose']](before, after) |> expect_error('argument is NULL')
  })
  it("then an argument is null exception is thrown if before is NULL",{
    # Given
    service <- String.Utility.Service()

    # When
    value  <- 'value'
    before <- NULL
    after  <- 'after'

    # Then
    value |> service[['Inclose']](before, after) |> expect_error('argument is NULL')
  })
  it("then an argument not character exception is thrown if before is not character",{
    # Given
    service <- String.Utility.Service()

    # When
    value  <- 'value'
    before <- 1
    after  <- 'after'

    # Then
    value |> service[['Inclose']](before, after) |> expect_error('argument is not of type Character')
  })
  it("then an argument is null exception is thrown if after is NULL",{
    # Given
    service <- String.Utility.Service()

    # When
    value  <- 'value'
    before <- 'before'
    after  <- NULL

    # Then
    value |> service[['Inclose']](before, after) |> expect_error('argument is NULL')
  })
  it("then an argument not character exception is thrown if after is not character",{
    # Given
    service <- String.Utility.Service()

    # When
    value  <- 'value'
    before <- 'before'
    after  <- 1

    # Then
    value |> service[['Inclose']](before, after) |> expect_error('argument is not of type Character')
  })
})

describe("When items |> service[['Collapse']]()",{
  it("then items are collapsed using comma separator",{
    # Given
    service <- String.Utility.Service()

    # When
    items <- list('one', 'two', 'three')

    # Then
    items |> service[['Collapse']]() |> expect_equal('one, two, three')
  })
  it("then an argument is null exception is thrown if items is NULL",{
    # Given
    service <- String.Utility.Service()

    # When
    items <- NULL

    # Then
    items |> service[['Collapse']]() |> expect_error('argument is NULL')
  })
})

describe("When keys |> service[['CreateKeyValuePairs']](values)",{
  it("then key value pairs are created",{
    # Given
    service <- String.Utility.Service()

    # When
    keys   <- list(1, 2, 3)
    values <- list('one', 'two', 'three')

    # Then
    keys |> service[['CreateKeyValuePairs']](values) |> expect_equal(c('1 = one', '2 = two', '3 = three'))
  })
  it("then an argument is null exception is thrown if keys is NULL",{
    # Given
    service <- String.Utility.Service()

    # When
    keys   <- NULL
    values <- list('one', 'two', 'three')

    # Then
    keys |> service[['CreateKeyValuePairs']](values) |> expect_error('argument is NULL')
  })
  it("then an argument is null exception is thrown if values is NULL",{
    # Given
    service <- String.Utility.Service()

    # When
    keys   <- list(1, 2, 3)
    values <- NULL

    # Then
    keys |> service[['CreateKeyValuePairs']](values) |> expect_error('argument is NULL')
  })
})

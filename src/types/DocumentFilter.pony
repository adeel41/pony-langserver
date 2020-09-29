class DocumentFilter
    let language: (String | None)
    let scheme: (String | None)
    let pattern: (String | None)

    new create(language': (String | None), scheme': (String | None), pattern': (String | None)) =>
        language = language'
        scheme = scheme'
        pattern = pattern'
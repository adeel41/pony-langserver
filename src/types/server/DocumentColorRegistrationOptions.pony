class DocumentColorRegistrationOptions
    let documentSelector: (DocumentSelector | None)
    let id: (String | None)
    let workDoneProgress: (Bool | None)

    new create() =>
        documentSelector = None
        id = None
        workDoneProgress = None

class ImplementationRegistrationOptions
    let documentSelector: (DocumentSelector | None)
    let workDoneProgress: (Bool | None)
    let id: (String | None)

    new create() =>
        documentSelector = None
        workDoneProgress = None
        id = None

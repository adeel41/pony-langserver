class RenameOptions
    let workDoneProgress: (Bool | None)
    let prepareProvider: (Bool | None)

    new create() =>
        workDoneProgress = None
        prepareProvider = None
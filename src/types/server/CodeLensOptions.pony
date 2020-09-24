class CodeLensOptions
    let workDoneProgress: (Bool | None)
    let resolveProvider: (Bool | None)

    new create() =>
        workDoneProgress = None
        resolveProvider = None
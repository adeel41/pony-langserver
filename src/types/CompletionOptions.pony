class CompletionOptions
    let workDoneProgress: (Bool | None)
    let triggerCharacters: (Array[String] | None)
    let allCommitCharacters: (Array[String] | None)
    let resolveProvider: (Bool | None)

    new create() =>
        workDoneProgress = None
        triggerCharacters = None
        allCommitCharacters = None
        resolveProvider = None
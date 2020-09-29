class CodeActionOptions
    let workDoneProgress: (Bool | None)
    let codeActionKinds: (Array[CodeActionKind] | None)

    new create() =>
        workDoneProgress = None
        codeActionKinds = None
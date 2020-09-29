class ExecuteCommandOptions
    let workDoneProgress: (Bool | None)
    let commands: Array[String]

    new create(commands': Array[String]) =>
        workDoneProgress = None
        commands = commands'

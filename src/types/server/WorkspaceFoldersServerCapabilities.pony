class WorkspaceFoldersServerCapabilities
    let supported: (Bool | None)
    let changeNotifications: (String | Bool | None)

    new create(supported': Bool, changeNotifications': (String | Bool)) =>
        supported = supported'
        changeNotifications = changeNotifications'
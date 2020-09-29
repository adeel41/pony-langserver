class InitializeResult
    let capabilities: ServerCapabilities
    let serverInfo: (ServerInfo | None)

    new create(capabilities': ServerCapabilities, serverInfo': ServerInfo) =>
        capabilities = capabilities'
        serverInfo = serverInfo'
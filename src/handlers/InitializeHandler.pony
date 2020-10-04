use "../types"

primitive InitializeHandler
    fun handle(params: InitializeParams) : ResponseMessage =>

        let textDocumentSync = TextDocumentSyncOptions(true, TextDocumentSyncKindFull)
        let capabilities = ServerCapabilities(textDocumentSync)
        let serverInfo = ServerInfo("Neigh - Pony Language Server", "0.0.1")
        let result = InitializeResult(capabilities, serverInfo)
        ResponseMessage(1, result)
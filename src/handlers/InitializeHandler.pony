use "../types"

primitive InitializeHandler
    fun handle(params: InitializeParams, requestId: I64) : ResponseMessage =>

        let textDocumentSync = TextDocumentSyncOptions(true, TextDocumentSyncKindFull)
        let capabilities = ServerCapabilities(textDocumentSync)
        let serverInfo = ServerInfo("Neigh - Pony Language Server", "0.0.1")
        let result = InitializeResult(capabilities, serverInfo)
        ResponseMessage(requestId, result)
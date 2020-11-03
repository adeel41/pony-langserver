use "../types"
use model = "../model"

primitive InitializeHandler
    fun handle(app: model.App, params: InitializeParams, requestId: I64) : ResponseMessage =>

        (let name, let version) = 
            match params.clientInfo
            | let clientInfo: ClientInfo =>
                (clientInfo.name, try clientInfo.version as String else "" end)
            else
                ("", "")
            end

        app.setClient(name, version)

        let textDocumentSync = TextDocumentSyncOptions(true, TextDocumentSyncKindFull)
        let capabilities = ServerCapabilities(textDocumentSync)
        let serverInfo = ServerInfo("Neigh - Pony Language Server", "0.0.1")
        let result = InitializeResult(capabilities, serverInfo)
        ResponseMessage(requestId, result)
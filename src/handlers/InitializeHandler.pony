use "collections"
use "../types"
use model = "../model"

primitive InitializeHandler
    fun handle(app: model.App, params: InitializeParams, requestId: I64) : ResponseMessage =>

        let client = match params.clientInfo
            | let clientInfo: ClientInfo =>
                model.Client(clientInfo.name, try clientInfo.version as String else "" end)
            else
                model.Client.empty()
            end

        let workspace = match params.rootPath
            | let rootPath: String =>
                let rootUri = try params.rootUri as String else "" end
                let name = try (params.workspaceFolders as Array[WorkspaceFolder])(0)?.name else "" end
                //we have the path. send this path. and a notfication thing.
                // that notification will 
                // model.DocumentsFetcher
                // find all files. then foreach.
                model.Workspace(name, rootPath, rootUri)
        end

        app.initialize(client, workspace)

        let textDocumentSync = TextDocumentSyncOptions(true, TextDocumentSyncKindFull)
        let capabilities = ServerCapabilities(textDocumentSync)
        let serverInfo = ServerInfo("Neigh - Pony Language Server", "0.0.1")
        let result = InitializeResult(capabilities, serverInfo)
        ResponseMessage(requestId, result)
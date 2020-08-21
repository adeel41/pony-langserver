use "json"
use "collections"

class InitializeParams
    let processId: (I64 | None)
    let clientInfo: (ClientInfo | None)
    let rootPath: (String | None)
    let rootUri: (String | None)
    let initializationOptions: (Map[String, String] | None)
    let capabilities: ClientCapabilities
    let trace: Tracing
    let workDoneToken: (String | I32 | None)
    let workspaceFolders: (List[WorkspaceFolder] | None)

    new create(json: JsonObject box) =>
        processId = try json.data("processId")? as I64 else None end
        clientInfo = try ClientInfo(json.data("clientInfo")? as JsonObject box)? else None end
        rootPath = try json.data("rootPath")? as String else None end
        rootUri = try json.data("rootUri")? as String else None end
        initializationOptions = None
        capabilities = try ClientCapabilities(json.data("capabilities")? as JsonObject box) else ClientCapabilities.empty() end
        trace = TracingOff
        workDoneToken = None
        workspaceFolders = None

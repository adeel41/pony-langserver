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
    let workspaceFolders: (Array[WorkspaceFolder] | None)

    new create(json: JsonObject box) =>
        processId = try json.data("processId")? as I64 end
        clientInfo = try ClientInfo(json.data("clientInfo")? as JsonObject box)? end
        rootPath = try json.data("rootPath")? as String end
        rootUri = try json.data("rootUri")? as String end
        initializationOptions = None
        capabilities = try ClientCapabilities(json.data("capabilities")? as JsonObject box) else ClientCapabilities.empty() end
        trace = TracingOff
        workDoneToken = None
        workspaceFolders = try
            let result = Array[WorkspaceFolder]
            let arr = json.data("workspaceFolders")? as JsonArray box
            for value in arr.data.values() do
                match value
                | let valueItem: JsonObject box =>
                    result.push( WorkspaceFolder(valueItem))
                end
            end
            result
        end

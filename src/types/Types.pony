use "json"
use "Debug"
use "collections"

primitive TracingOff
primitive TracingMessages
primitive TracingVerbose
type Tracing is (TracingOff | TracingMessages | TracingVerbose)

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
        rootPath = None
        rootUri = None
        initializationOptions = None
        capabilities = ClientCapabilities
        trace = TracingOff
        workDoneToken = None
        workspaceFolders = None
        // processId = json.data("processId")? as I64
        // clientInfo = ClientInfo(json.data("clientInfo")? as JsonObject box)
        // rootPath = json.data("rootPath")? as String
        // rootUri = json.data("rootUri")? as String
        // initializationOptions = None
        // capabilities = ClientCapabilities(json.data("capabilities")? as JsonObject box)?
        // trace = TracingOff
        // workDoneToken = None
        // workspaceFolders = None //todo: convert json array to a list end

class ClientInfo
    let name: String
    let version: (String | None)

    new create(json: JsonObject box) ? =>
        name = try json.data("name")? as String else "" end
        version = json.data("version")? as String


class ClientCapabilities
    let workspace: (Workspace | None)
    new create() =>
        workspace = None
    // new create(json: JsonObject box) ? =>
    //     workspace = Workspace(json.data("workspace")? as JsonObject box)

class WorkspaceFolder
    let uri: String
    let name: String
    new create(json: JsonObject) ? =>
        uri = json.data("uri")? as String
        name = json.data("name")? as String

//todo: incomplete end
class Workspace
    let applyEdit : (Bool | None)
    let workspaceEdit: (WorkspaceEditClientCapabilities | None)
    new create(json: JsonObject box) =>
        applyEdit = None
        workspaceEdit = None

class WorkspaceEditClientCapabilities

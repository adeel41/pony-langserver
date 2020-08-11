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

    new create(json: JsonObject) ? =>
        processId = json.data("processId")? as I64
        clientInfo = ClientInfo(json.data("clientInfo")? as JsonObject)
        rootPath = json.data("rootPath")? as String
        rootUri = json.data("rootUri")? as String
        initializationOptions = None
        capabilities = ClientCapabilities(json.data("capabilities")? as JsonObject)?
        trace = TracingOff
        workDoneToken = None
        workspaceFolders = None //todo: convert json array to a list end

class ClientInfo
    let name: String
    let version: (String | None)

    new create(json: JsonObject) =>
        name = ""
        version = None


class ClientCapabilities
    let workspace: (Workspace | None)
    new create(json: JsonObject) ? =>
        workspace = Workspace(json.data("workspace")? as JsonObject)

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
    new create(json: JsonObject) =>
        applyEdit = None
        workspaceEdit = None

class WorkspaceEditClientCapabilities

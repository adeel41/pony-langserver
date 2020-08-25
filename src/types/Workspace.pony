use "json"

class Workspace
    let applyEdit : (Bool | None)
    let workspaceEdit: (WorkspaceEditClientCapabilities | None)
    let didChangeConfiguration: (DidChangeConfigurationClientCapabilities | None)
    let didChangeWatchedFiles: (DidChangeWatchedFilesClientCapabilities | None)
    let symbol: (WorkspaceSymbolClientCapabilities | None)
    let executeCommand: (ExecuteCommandClientCapabilities | None)
    let workspaceFolders: (Bool | None)
    let configuration: (Bool | None)

    new create(json: JsonObject box) =>
        applyEdit = try json.data("applyEdit")? as Bool else None end
        workspaceEdit = try WorkspaceEditClientCapabilities(json.data("workspaceEdit")? as JsonObject box) else None end
        didChangeConfiguration = try DidChangeConfigurationClientCapabilities(json.data("didChangeConfiguration")? as JsonObject box) else None end
        didChangeWatchedFiles = try DidChangeWatchedFilesClientCapabilities(json.data("didChangeWatchedFiles")? as JsonObject box) else None end
        symbol = None
        executeCommand = None
        workspaceFolders = None
        configuration = None

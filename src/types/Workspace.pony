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
        applyEdit = None
        workspaceEdit = None
        didChangeConfiguration = None
        didChangeWatchedFiles = None
        symbol = None
        executeCommand = None
        workspaceFolders = None
        configuration = None

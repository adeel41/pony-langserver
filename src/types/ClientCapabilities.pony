use "json"

class ClientCapabilities
    let workspace: (Workspace | None)
    let textDocument: (TextDocumentClientCapabilities | None)
    let window: (WindowClientCapabilities | None)
    let experimental: (JsonObject | None)

    new create(json: JsonObject box) =>
        workspace = try Workspace(json.data("workspace")? as JsonObject box) else None end
        textDocument = None
        window =  None
        experimental = None

    new empty() =>
        workspace = None
        textDocument = None
        window =  None
        experimental = None

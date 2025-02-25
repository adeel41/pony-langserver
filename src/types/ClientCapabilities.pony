use "json"

class ClientCapabilities
    let workspace: (Workspace | None)
    let textDocument: (TextDocumentClientCapabilities | None)
    let window: (WindowClientCapabilities | None)
    let experimental: (JsonObject | None)

    new create(json: JsonObject box) =>
        workspace = try Workspace(json.data("workspace")? as JsonObject box) else None end
        textDocument = try TextDocumentClientCapabilities(json.data("textDocument")? as JsonObject box) else None end
        window =  try WindowClientCapabilities(json.data("window")? as JsonObject box) else None end
        experimental = None

    new empty() =>
        workspace = None
        textDocument = None
        window =  None
        experimental = None

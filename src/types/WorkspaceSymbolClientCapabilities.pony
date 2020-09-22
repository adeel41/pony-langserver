use "json"
use "Debug"

class WorkspaceSymbolClientCapabilities
    let dynamicRegistration: (Bool | None)
    let symbolKind: (SymbolKindValueSet | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
        symbolKind = try SymbolKindValueSet(json.data("symbolKind")? as JsonObject box) else None end

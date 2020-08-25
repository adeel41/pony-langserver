use "json"

class WorkspaceSymbolClientCapabilities
    let dynamicRegistration: (Bool | None)
    let symbolKind: (SymbolKinds | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
        symbolKind = None


class SymbolKinds
    let valueSet: (Array[SymbolKind] | None)
use "json"

class DocumentSymbolClientCapabilities
    let dynamicRegistration: (Bool | None)
    let hierarchicalDocumentSymbolSupport: (Bool | None)
    let tagSupport: (SymbolTagValueSet | None)
    let symbolKind: (SymbolKindValueSet | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool end
        hierarchicalDocumentSymbolSupport = try json.data("hierarchicalDocumentSymbolSupport")? as Bool end
        tagSupport = try SymbolTagValueSet(json.data("tagSupport")? as JsonObject box) end
        symbolKind = try SymbolKindValueSet(json.data("symbolKind")? as JsonObject box) end

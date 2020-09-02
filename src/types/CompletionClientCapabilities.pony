use "json"

class CompletionClientCapabilities
    let dynamicRegistration: (Bool | None)
    let completionItem: (CompletionClientCapabilitiesCompletionItem | None)
    let completionItemKind: (CompletionClientCapabilitiesCompletionItemKind | None)
    let contextSupport: (Bool | None)

    new create(json: JsonObject box)  =>
        dynamicRegistration = None
        completionItem = None
        completionItemKind = None
        contextSupport = None


class CompletionClientCapabilitiesCompletionItem
    let snippetSupport: (Bool | None)
    let commitCharactersSupport: (Bool | None)
    let documentationFormat: (Array[MarkupKind] | None)
    let deprecatedSupport: (Bool | None)
    let preselectSupport: (Bool | None)
    let tagSupport: (CompletionItemTagSupport | None)
    let insertReplaceSupport: (Bool | None)
    let resolveAdditionalTextEditsSupport: (Bool | None)


    new create(json: JsonObject box) =>
        snippetSupport = None
        commitCharactersSupport = None
        documentationFormat = None
        deprecatedSupport = None
        preselectSupport = None
        tagSupport = None
        insertReplaceSupport = None
        resolveAdditionalTextEditsSupport = None


class CompletionItemTagSupport
    let valueSet: Array[CompletionItemTag]

    new create(json: JsonObject box) =>
        valueSet = Array[CompletionItemTag]        

class CompletionClientCapabilitiesCompletionItemKind
    let valueSet : (Array[CompletionItemKind] | None)

    new create(json: JsonObject box) =>
        valueSet = None
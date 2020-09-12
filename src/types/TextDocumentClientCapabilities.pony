use "json"

class TextDocumentClientCapabilities
    let synchronization: (TextDocumentSyncClientCapabilities | None)
    let completion: (CompletionClientCapabilities | None)
    let hover: (HoverClientCapabilities | None)
    let signatureHelp: (SignatureHelpClientCapabilities | None)
    let declaration: (DeclarationClientCapabilities | None)
    let definition: (DefinitionClientCapabilities | None)
    let typeDefinition: (TypeDefinitionClientCapabilities | None)
    let implementation: (ImplementationClientCapabilities | None)
    let references: (ReferenceClientCapabilities | None)
    let documentHighlight: (DocumentHighlightClientCapabilities | None)
    let documentSymbol: (DocumentSymbolClientCapabilities | None)
    let codeAction: (CodeActionClientCapabilities | None)
    let codeLens: (CodeLensClientCapabilities | None)
    let documentLink: (DocumentLinkClientCapabilities | None)
    let colorProvider: (DocumentColorClientCapabilities | None)
    let formatting: (DocumentFormattingClientCapabilities | None)
    let rangeFormatting: (DocumentRangeFormattingClientCapabilities | None)
    let onTypeFormatting: (DocumentOnTypeFormattingClientCapabilities | None)
    let rename: (RenameClientCapabilities | None)
    let publishDiagnostics: (PublishDiagnosticsClientCapabilities | None)
    let foldingRange: (FoldingRangeClientCapabilities | None)
    let selectionRange: (SelectionRangeClientCapabilities | None)
    let semanticTokens: (SemanticTokensClientCapabilities | None)

    new create(json: JsonObject box) =>
        synchronization = try TextDocumentSyncClientCapabilities(json.data("synchronization")? as JsonObject box) else None end
        completion = try CompletionClientCapabilities(json.data("completion")? as JsonObject box) else None end
        hover = try HoverClientCapabilities(json.data("hover")? as JsonObject box) else None end
        signatureHelp = try SignatureHelpClientCapabilities(json.data("signatureHelp")? as JsonObject box) else None end
        declaration = None
        definition = try DefinitionClientCapabilities(json.data("declaration")? as JsonObject box) else None end
        typeDefinition = None
        implementation = None
        references = try ReferenceClientCapabilities(json.data("references")? as JsonObject box) else None end
        documentHighlight = None
        documentSymbol = None
        codeAction = None
        codeLens = None
        documentLink = None
        colorProvider = None
        formatting = None
        rangeFormatting = None
        onTypeFormatting = None
        rename = None
        publishDiagnostics = None
        foldingRange = None
        selectionRange = None
        semanticTokens = None

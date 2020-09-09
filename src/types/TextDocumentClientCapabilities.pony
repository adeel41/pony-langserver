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
        signatureHelp = None
        declaration = None
        definition = None
        typeDefinition = None
        implementation = None
        references = None
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

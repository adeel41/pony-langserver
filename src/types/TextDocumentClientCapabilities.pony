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
        declaration = try DeclarationClientCapabilities(json.data("declaration")? as JsonObject box) else None end
        definition = try DefinitionClientCapabilities(json.data("declaration")? as JsonObject box) else None end
        typeDefinition = try TypeDefinitionClientCapabilities(json.data("typeDefinition")? as JsonObject box) else None end
        implementation = try ImplementationClientCapabilities(json.data("implementation")? as JsonObject box) else None end
        references = try ReferenceClientCapabilities(json.data("references")? as JsonObject box) else None end
        documentHighlight = try DocumentHighlightClientCapabilities(json.data("documentHighlight")? as JsonObject box) else None end
        documentSymbol = try DocumentSymbolClientCapabilities(json.data("documentSymbol")? as JsonObject box) else None end
        codeAction = try CodeActionClientCapabilities(json.data("codeAction")? as JsonObject box) else None end
        codeLens = try CodeLensClientCapabilities(json.data("codeLens")? as JsonObject box) else None end
        documentLink = try DocumentLinkClientCapabilities(json.data("documentLink")? as JsonObject box) else None end
        colorProvider = try DocumentColorClientCapabilities(json.data("colorProvider")? as JsonObject box) else None end
        formatting = try DocumentFormattingClientCapabilities(json.data("formatting")? as JsonObject box) else None end
        rangeFormatting = try DocumentRangeFormattingClientCapabilities(json.data("rangeFormatting")? as JsonObject box) else None end
        onTypeFormatting = try DocumentOnTypeFormattingClientCapabilities(json.data("onTypeFormatting")? as JsonObject box) else None end
        rename = try RenameClientCapabilities(json.data("rename")? as JsonObject box) else None end
        publishDiagnostics = try PublishDiagnosticsClientCapabilities(json.data("publishDiagnostics")? as JsonObject box) else None end
        foldingRange = try FoldingRangeClientCapabilities(json.data("foldingRange")? as JsonObject box) else None end
        selectionRange = try SelectionRangeClientCapabilities(json.data("selectionRange")? as JsonObject box) else None end
        semanticTokens = try SemanticTokensClientCapabilities(json.data("semanticTokens")? as JsonObject box) else None end

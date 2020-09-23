class ServerCapabilities
    let textDocumentSync: (TextDocumentSyncOptions | I64)
    let completionProvider: (CompletionOptions | None)
    let hoverProvider: (Bool | HoverOptions | None)
    let signatureHelpProvider: (SignatureHelpOptions | None)
    let declarationProvider: (Bool | DeclarationOptions | DeclarationRegistrationOptions | None)
    let definitionProvider: (Bool | DefinitionOptions | None)
    let typeDefinitionProvider: (Bool | TypeDefinitionOptions | TypeDefinitionRegistrationOptions | None)
    let implementationProvider: (Bool | ImplementationOptions | ImplementationRegistrationOptions | None)
    let referencesProvider: (Bool | ReferenceOptions | None)
    let documentHighlightProvider: (Bool | DocumentHighlightOptions | None)
    let documentSymbolProvider: (Bool | DocumentSymbolOptions | None)
    let codeActionProvider: (Bool | CodeActionOptions | None)
    let codeLensProvider: (CodeLensOptions | None)
    let documentLinkProvider: (DocumentLinkOptions | None)
    let colorProvider: (Bool | DocumentColorOptions | DocumentColorRegistrationOptions | None)
    let documentFormattingProvider: (Bool | DocumentFormattingOptions | None)
    let documentRangeFormattingProvider: (Bool | DocumentRangeFormattingOptions | None)
    let documentOnTypeFormattingProvider: (DocumentOnTypeFormattingOptions | None)
    let renameProvider: (Bool | RenameOptions | None)
    let foldingRangeProvider: (Bool | FoldingRangeOptions | FoldingRangeRegistrationOptions | None)
    let executeCommandProvider: (ExecuteCommandOptions | None)
    let selectionRangeProvider: (Bool | SelectionRangeOptions | SelectionRangeRegistrationOptions | None)
    let workspaceSymbolProvider: (Bool | None)
    let workspace: (Workspace | None)
    let experimental: None

    new create() =>
        textDocumentSync = 1
        completionProvider = None
        hoverProvider = None
        signatureHelpProvider = None
        declarationProvider = None
        definitionProvider = None
        typeDefinitionProvider = None
        implementationProvider = None
        referencesProvider = None
        documentHighlightProvider = None
        documentSymbolProvider = None
        codeActionProvider = None
        codeLensProvider = None
        documentLinkProvider = None
        colorProvider = None
        documentFormattingProvider = None
        documentRangeFormattingProvider = None
        documentOnTypeFormattingProvider = None
        renameProvider = None
        foldingRangeProvider = None
        executeCommandProvider = None
        selectionRangeProvider = None
        workspaceSymbolProvider = None
        workspace = None
        experimental = None


class ReferenceOptions
class DocumentHighlightOptions
class DocumentSymbolOptions
class CodeActionOptions
class CodeLensOptions
class DocumentLinkOptions
class DocumentColorOptions
class DocumentColorRegistrationOptions
class DocumentFormattingOptions
class DocumentRangeFormattingOptions
class DocumentOnTypeFormattingOptions
class RenameOptions
class FoldingRangeOptions
class FoldingRangeRegistrationOptions
class ExecuteCommandOptions
class SelectionRangeOptions
class SelectionRangeRegistrationOptions

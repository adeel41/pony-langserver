class ServerCapabilities
    let textDocumentSync: (TextDocumentSyncOptions | I64)
    """ 
    Defines how text documents are synced. Is either a detailed structure defining each notification or
	for backwards compatibility the TextDocumentSyncKind number. If omitted it defaults to `TextDocumentSyncKind.None`."""

    let completionProvider: (CompletionOptions | None)
    """
    The server provides completion support. """

    let hoverProvider: (Bool | HoverOptions | None)
    """
    The server provides hover support. """

    let signatureHelpProvider: (SignatureHelpOptions | None)
    """
    The server provides signature help support. """

    let declarationProvider: (Bool | DeclarationOptions | DeclarationRegistrationOptions | None)
    """
    The server provides go to declaration support. """

    let definitionProvider: (Bool | DefinitionOptions | None)
    """
    The server provides goto definition support. """

    let typeDefinitionProvider: (Bool | TypeDefinitionOptions | TypeDefinitionRegistrationOptions | None)
    """
    The server provides goto type definition support. """

    let implementationProvider: (Bool | ImplementationOptions | ImplementationRegistrationOptions | None)
    """
    The server provides goto implementation support. """

    let referencesProvider: (Bool | ReferenceOptions | None)
    """
    The server provides find references support. """

    let documentHighlightProvider: (Bool | DocumentHighlightOptions | None)
    """
    The server provides document highlight support. """

    let documentSymbolProvider: (Bool | DocumentSymbolOptions | None)
    """
    The server provides document symbol support. """

    let codeActionProvider: (Bool | CodeActionOptions | None)
    """
    The server provides code actions. The `CodeActionOptions` return type is only
	valid if the client signals code action literal support via the property
	`textDocument.codeAction.codeActionLiteralSupport`."""

    let codeLensProvider: (CodeLensOptions | None)
    """
    The server provides code lens. """

    let documentLinkProvider: (DocumentLinkOptions | None)
    """
    The server provides document link support. """

    let colorProvider: (Bool | DocumentColorOptions | DocumentColorRegistrationOptions | None)
    """
    The server provides color provider support. """

    let documentFormattingProvider: (Bool | DocumentFormattingOptions | None)
    """
    The server provides document formatting. """

    let documentRangeFormattingProvider: (Bool | DocumentRangeFormattingOptions | None)
    """
    The server provides document range formatting. """

    let documentOnTypeFormattingProvider: (DocumentOnTypeFormattingOptions | None)
    """
    The server provides document formatting on typing. """

    let renameProvider: (Bool | RenameOptions | None)
    """
    The server provides rename support. RenameOptions may only be
	specified if the client states that it supports
	`prepareSupport` in its initial `initialize` request. """

    let foldingRangeProvider: (Bool | FoldingRangeOptions | FoldingRangeRegistrationOptions | None)
    """
    The server provides folding provider support. """

    let executeCommandProvider: (ExecuteCommandOptions | None)
    """
    The server provides execute command support. """

    let selectionRangeProvider: (Bool | SelectionRangeOptions | SelectionRangeRegistrationOptions | None)
    """
    The server provides selection range support. """

    let workspaceSymbolProvider: (Bool | None)
    """
    The server provides workspace symbol support. """

    let workspace: (Workspace | None)
    """
    Workspace specific server capabilities """

    let experimental: None
    """
    Experimental server capabilities. """

    new create(textDocumentSync': TextDocumentSyncOptions) =>
        textDocumentSync = textDocumentSync'
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
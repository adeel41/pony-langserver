use "../types"
use "json"

primitive TestData
    fun initializeParams():String => """
        {"jsonrpc":"2.0","id":0,"method":"initialize","params":{"processId":19480,"clientInfo":{"name":"vscode","version":"1.47.3"},"rootPath":null,"rootUri":null,"capabilities":{"workspace":{"applyEdit":true,"workspaceEdit":{"documentChanges":true,"resourceOperations":["create","rename","delete"],"failureHandling":"textOnlyTransactional"},"didChangeConfiguration":{"dynamicRegistration":true},"didChangeWatchedFiles":{"dynamicRegistration":true},"symbol":{"dynamicRegistration":true,"symbolKind":{"valueSet":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]}},"executeCommand":{"dynamicRegistration":true},"configuration":true,"workspaceFolders":true},"textDocument":{"publishDiagnostics":{"relatedInformation":true,"versionSupport":false,"tagSupport":{"valueSet":[1,2]}},"synchronization":{"dynamicRegistration":true,"willSave":true,"willSaveWaitUntil":true,"didSave":true},"completion":{"dynamicRegistration":true,"contextSupport":true,"completionItem":{"snippetSupport":true,"commitCharactersSupport":true,"documentationFormat":["markdown","plaintext"],"deprecatedSupport":true,"preselectSupport":true,"tagSupport":{"valueSet":[1]}},"completionItemKind":{"valueSet":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]}},"hover":{"dynamicRegistration":true,"contentFormat":["markdown","plaintext"]},"signatureHelp":{"dynamicRegistration":true,"signatureInformation":{"documentationFormat":["markdown","plaintext"],"parameterInformation":{"labelOffsetSupport":true}},"contextSupport":true},"definition":{"dynamicRegistration":true,"linkSupport":true},"references":{"dynamicRegistration":true},"documentHighlight":{"dynamicRegistration":true},"documentSymbol":{"dynamicRegistration":true,"symbolKind":{"valueSet":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]},"hierarchicalDocumentSymbolSupport":true},"codeAction":{"dynamicRegistration":true,"isPreferredSupport":true,"codeActionLiteralSupport":{"codeActionKind":{"valueSet":["","quickfix","refactor","refactor.extract","refactor.inline","refactor.rewrite","source","source.organizeImports"]}}},"codeLens":{"dynamicRegistration":true},"formatting":{"dynamicRegistration":true},"rangeFormatting":{"dynamicRegistration":true},"onTypeFormatting":{"dynamicRegistration":true},"rename":{"dynamicRegistration":true,"prepareSupport":true},"documentLink":{"dynamicRegistration":true,"tooltipSupport":true},"typeDefinition":{"dynamicRegistration":true,"linkSupport":true},"implementation":{"dynamicRegistration":true,"linkSupport":true},"colorProvider":{"dynamicRegistration":true},"foldingRange":{"dynamicRegistration":true,"rangeLimit":5000,"lineFoldingOnly":true},"declaration":{"dynamicRegistration":true,"linkSupport":true},"selectionRange":{"dynamicRegistration":true}},"window":{"workDoneProgress":true}},"trace":"off","workspaceFolders":null}}"""

    fun getInitializeParams() : (InitializeParams | None) =>
        try
            let json = JsonDoc
            json.parse(TestData.initializeParams())?
            let request_message = RequestMessage(json.data as JsonObject)?
            request_message.get_params()
        end

    fun getClientInfo() : (ClientInfo | None) =>
        try
            (TestData.getInitializeParams() as InitializeParams).clientInfo
        end

    fun getClientCapabilities() : (ClientCapabilities | None) =>
        try
            (TestData.getInitializeParams() as InitializeParams).capabilities
        end

    fun getWorkspace() : (Workspace | None) =>
        try
            (getClientCapabilities() as ClientCapabilities).workspace
        end

    fun getWorkspaceEditClientCapabilities() : ( WorkspaceEditClientCapabilities | None ) =>
        try
            (TestData.getWorkspace() as Workspace).workspaceEdit
        end

    fun getTextDocumentClientCapabilities() : (TextDocumentClientCapabilities | None) =>
        try
            (TestData.getClientCapabilities() as ClientCapabilities).textDocument
        end

    fun getTextDocumentSyncClientCapabilities() : (TextDocumentSyncClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).synchronization
        end

    fun getCompletionClientCapabilities() : (CompletionClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).completion
        end

    fun getCompletionClientCapabilitiesCompletionItem() : (CompletionClientCapabilitiesCompletionItem | None) =>
        try
            (TestData.getCompletionClientCapabilities() as CompletionClientCapabilities).completionItem
        end

    fun getHoverClientCapabilities() : (HoverClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).hover
        end        

    fun getSignatureHelpClientCapabilities() : (SignatureHelpClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).signatureHelp
        end

    fun getDefinitionClientCapabilities() : (DefinitionClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).definition
        end

    fun getReferenceClientCapabilities() : (ReferenceClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).references
        end

    fun getDocumentHighlightClientCapabilities() : (DocumentHighlightClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).documentHighlight
        end

    fun getCodeLensClientCapabilities() : (CodeLensClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).codeLens
        end

    fun getSemanticTokensClientCapabilities() : (SemanticTokensClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).semanticTokens
        end
    
    fun getSelectionRangeClientCapabilities() : (SelectionRangeClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).selectionRange
        end

    fun getFoldingRangeClientCapabilities() : (FoldingRangeClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).foldingRange
        end

    fun getPublishDiagnosticsClientCapabilities() : (PublishDiagnosticsClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).publishDiagnostics
        end

    fun getRenameClientCapabilities() : (RenameClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).rename
        end

    fun getDocumentOnTypeFormattingClientCapabilities() : (DocumentOnTypeFormattingClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).onTypeFormatting
        end

    fun getDocumentRangeFormattingClientCapabilities() : (DocumentRangeFormattingClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).rangeFormatting
        end

    fun getDocumentFormattingClientCapabilities() : (DocumentFormattingClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).formatting
        end

    fun getDocumentColorClientCapabilities() : (DocumentColorClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).colorProvider
        end

    fun getDocumentLinkClientCapabilities() : (DocumentLinkClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).documentLink
        end

    fun getCodeActionClientCapabilities() : (CodeActionClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).codeAction
        end

    fun getDocumentSymbolClientCapabilities() : (DocumentSymbolClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).documentSymbol
        end

    fun getImplementationClientCapabilities() : (ImplementationClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).implementation
        end

    fun getTypeDefinitionClientCapabilities() : (TypeDefinitionClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).typeDefinition
        end
        
    fun getDeclarationClientCapabilities() : (DeclarationClientCapabilities | None) =>
        try
            (TestData.getTextDocumentClientCapabilities() as TextDocumentClientCapabilities).declaration
        end

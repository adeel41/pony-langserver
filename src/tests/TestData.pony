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
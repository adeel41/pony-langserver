use "ponytest"
use "json"
use "../types"
use "Debug"

class _TestInitializeParams is UnitTest
    let _msg: String = """
{"jsonrpc":"2.0","id":0,"method":"initialize","params":{"processId":19480,"clientInfo":{"name":"vscode","version":"1.47.3"},"rootPath":null,"rootUri":null,"capabilities":{"workspace":{"applyEdit":true,"workspaceEdit":{"documentChanges":true,"resourceOperations":["create","rename","delete"],"failureHandling":"textOnlyTransactional"},"didChangeConfiguration":{"dynamicRegistration":true},"didChangeWatchedFiles":{"dynamicRegistration":true},"symbol":{"dynamicRegistration":true,"symbolKind":{"valueSet":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]}},"executeCommand":{"dynamicRegistration":true},"configuration":true,"workspaceFolders":true},"textDocument":{"publishDiagnostics":{"relatedInformation":true,"versionSupport":false,"tagSupport":{"valueSet":[1,2]}},"synchronization":{"dynamicRegistration":true,"willSave":true,"willSaveWaitUntil":true,"didSave":true},"completion":{"dynamicRegistration":true,"contextSupport":true,"completionItem":{"snippetSupport":true,"commitCharactersSupport":true,"documentationFormat":["markdown","plaintext"],"deprecatedSupport":true,"preselectSupport":true,"tagSupport":{"valueSet":[1]}},"completionItemKind":{"valueSet":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]}},"hover":{"dynamicRegistration":true,"contentFormat":["markdown","plaintext"]},"signatureHelp":{"dynamicRegistration":true,"signatureInformation":{"documentationFormat":["markdown","plaintext"],"parameterInformation":{"labelOffsetSupport":true}},"contextSupport":true},"definition":{"dynamicRegistration":true,"linkSupport":true},"references":{"dynamicRegistration":true},"documentHighlight":{"dynamicRegistration":true},"documentSymbol":{"dynamicRegistration":true,"symbolKind":{"valueSet":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]},"hierarchicalDocumentSymbolSupport":true},"codeAction":{"dynamicRegistration":true,"isPreferredSupport":true,"codeActionLiteralSupport":{"codeActionKind":{"valueSet":["","quickfix","refactor","refactor.extract","refactor.inline","refactor.rewrite","source","source.organizeImports"]}}},"codeLens":{"dynamicRegistration":true},"formatting":{"dynamicRegistration":true},"rangeFormatting":{"dynamicRegistration":true},"onTypeFormatting":{"dynamicRegistration":true},"rename":{"dynamicRegistration":true,"prepareSupport":true},"documentLink":{"dynamicRegistration":true,"tooltipSupport":true},"typeDefinition":{"dynamicRegistration":true,"linkSupport":true},"implementation":{"dynamicRegistration":true,"linkSupport":true},"colorProvider":{"dynamicRegistration":true},"foldingRange":{"dynamicRegistration":true,"rangeLimit":5000,"lineFoldingOnly":true},"declaration":{"dynamicRegistration":true,"linkSupport":true},"selectionRange":{"dynamicRegistration":true}},"window":{"workDoneProgress":true}},"trace":"off","workspaceFolders":null}}"""

    fun name() : String => "Request Message: InitializeParams"

    fun apply(h: TestHelper) =>
        let json = JsonDoc
        try json.parse(_msg)? else h.fail("unable to parse json") end

        var params : (InitializeParams | None) = None
        try        
           let request_message = RequestMessage(json.data as JsonObject)?
           params = request_message.get_params()?
        else
            h.fail("Error when called get_params() on request_message")
        end

        match params
        | let p:InitializeParams =>

            h.assert_false(p.processId is None, "ProcessId is None") 
            h.assert_eq[I64](19480, try p.processId as I64 else 0 end, "No ProcessId found")

            h.assert_false(p.clientInfo is None, "ClientInfo is None")
            clientInfoAsserts(h, p.clientInfo)
            capabilitiesWorkspaceAsserts(h, p.capabilities)
            capabilitiesTextDocumentAsserts(h, p.capabilities.textDocument)

        else
            h.fail("Should have received an InitializedParams type")
        end

    fun clientInfoAsserts(h:TestHelper, clientInfo': (ClientInfo|None) ) =>
        match clientInfo'
        | let clientInfo: ClientInfo =>
            h.assert_eq[String]("vscode", clientInfo.name)
            h.assert_false(clientInfo.version is None, "clientInfo.version is None")
            h.assert_eq[String]("1.47.3", try clientInfo.version as String else "" end)
        else
            h.fail("p.clientInfo is not of type ClientInfo")
        end

    fun capabilitiesWorkspaceAsserts(h:TestHelper, capabilities:ClientCapabilities) =>
        match capabilities.workspace
        | let workspace: Workspace =>
                h.assert_true(try workspace.applyEdit as Bool else false end)
                workspaceEditAsserts(h, workspace.workspaceEdit)

                match workspace.didChangeConfiguration
                | let didChangeConfiguration: DidChangeConfigurationClientCapabilities =>
                    h.assert_true(try didChangeConfiguration.dynamicRegistration as Bool else false end)
                else
                    h.fail("workspace.didChangeConfiguration is not of type DidChangeConfigurationClientCapabilities")
                end

                match workspace.didChangeWatchedFiles
                | let didChangeWatchedFiles: DidChangeWatchedFilesClientCapabilities =>
                    h.assert_true(try didChangeWatchedFiles.dynamicRegistration as Bool else false end)
                else
                    h.fail("workspace.didChangeWatchedFiles is not of type DidChangeWatchedFilesClientCapabilities")
                end

                match workspace.symbol
                | let symbol: WorkspaceSymbolClientCapabilities =>
                    h.assert_true(try symbol.dynamicRegistration as Bool else false end )
                    h.assert_eq[I32](26, try ((symbol.symbolKind as SymbolKinds).valueSet as Array[SymbolKind]).size().i32() else 0 end)
                else
                    h.fail("workspace.symbol is not of type WorkspaceSymbolClientCapabilities")
                end

                match workspace.executeCommand
                | let executeCommand: ExecuteCommandClientCapabilities =>
                    h.assert_true(try executeCommand.dynamicRegistration as Bool else false end)
                else
                    h.fail("workspace.executeCommand is not of type ExecuteCommandClientCapabilities")
                end

                h.assert_true(try workspace.configuration as Bool else false end)
                h.assert_true(try workspace.workspaceFolders as Bool else false end)

        else
            h.fail("capabilities.workspace is not of type Workspace")
        end

    fun workspaceEditAsserts(h: TestHelper, workspaceEdit': (WorkspaceEditClientCapabilities|None)) =>
        match workspaceEdit'
        | let workspaceEdit: WorkspaceEditClientCapabilities =>
            h.assert_true(try workspaceEdit.documentChanges as Bool else false end)
            let resourceOperationsExpected:Array[ResourceOperationKind] = [ResourceOperationKindCreate;ResourceOperationKindRename;ResourceOperationKindDelete]
            let emptyResourceOperations: Array[ResourceOperationKind] = []

            match workspaceEdit.resourceOperations
            | let resourceOperations: Array[ResourceOperationKind] =>
                h.assert_true( try resourceOperations(0)? is ResourceOperationKindCreate else false end )
                h.assert_true( try resourceOperations(1)? is ResourceOperationKindRename else false end )
                h.assert_true( try resourceOperations(2)? is ResourceOperationKindDelete else false end )
            else
                h.fail("workspaceEdit.resourceOperations does not contain ResourceOperationKind")
            end                
            h.assert_true(workspaceEdit.failureHandling is FailureHandlingKindTextOnlyTransactional)
        else
            h.fail("workspace.workspaceEdit is not of type WorkspaceEditClientCapabilities")
        end

    fun capabilitiesTextDocumentAsserts(h: TestHelper, textDocument': (TextDocumentClientCapabilities | None)) =>
        match textDocument'
        | let textDocument: TextDocumentClientCapabilities =>
            
            h.assert_eq[I32](1, 1)
        else
            h.fail("capabilities.textDocument is not of type TextDocumentClientCapabilities")
        end
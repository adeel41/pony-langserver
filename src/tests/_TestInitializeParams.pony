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
           params = request_message.get_params()
        else
            h.fail("Error when called get_params() on request_message")
        end

        match params
        | let p:InitializeParams =>

            h.assert_false(p.processId is None, "ProcessId is None") 
            h.assert_eq[I64](19480, try p.processId as I64 else 0 end, "No ProcessId found")
            h.assert_false(p.clientInfo is None, "ClientInfo is None")

            capabilitiesTextDocumentAsserts(h, p.capabilities.textDocument)

        else
            h.fail("Should have received an InitializedParams type")
        end

    fun capabilitiesTextDocumentAsserts(h: TestHelper, textDocument': (TextDocumentClientCapabilities | None)) =>
        match textDocument'
        | let textDocument: TextDocumentClientCapabilities =>
            // match textDocument.synchronization 
            // | let synchronization: TextDocumentSyncClientCapabilities =>
            //     h.assert_true(try synchronization.dynamicRegistration as Bool else false end)
            //     h.assert_true(try synchronization.willSave as Bool else false end)
            //     h.assert_true(try synchronization.willSaveWaitUntil as Bool else false end)
            //     h.assert_true(try synchronization.didSave as Bool else false end)
            // else
            //     h.fail("workspace.textDocument.synchronization is not of type TextDocumentSyncClientCapabilities")
            // end

            match textDocument.completion
            | let completion: CompletionClientCapabilities =>
                h.assert_true(try completion.dynamicRegistration as Bool else false end)
                h.assert_true(try completion.contextSupport as Bool else false end)
                match completion.completionItem
                | let completionItem: CompletionClientCapabilitiesCompletionItem =>
                    h.assert_true(try completionItem.snippetSupport as Bool else false end)
                    h.assert_true(try completionItem.commitCharactersSupport as Bool else false end)
                    match completionItem.documentationFormat
                    | let documentationFormat: Array[MarkupKind] =>
                        h.assert_true(try documentationFormat(0)? is MarkupKindMarkdown else false end) 
                        h.assert_true(try documentationFormat(1)? is MarkupKindPlainText else false end)
                    else
                        h.fail("completionItem.documentationFormat does not contain MarkupKind")
                    end
                    h.assert_true(try completionItem.deprecatedSupport as Bool else false end)
                    h.assert_true(try completionItem.preselectSupport as Bool else false end)
                    match completionItem.tagSupport
                    | let tagSupport: CompletionItemTagSupport =>
                        h.assert_true(try tagSupport.valueSet(0)? is CompletionItemTagDeprecated else false end)
                    else
                        h.fail("completionItem.tagSupport is not of type CompletionItemTagSupport")
                    end
                else
                    h.fail("completion.completionItem is not of type CompletionClientCapabilitiesCompletionItem")
                end
                match completion.completionItemKind
                | let completionItemKind: CompletionClientCapabilitiesCompletionItemKind =>
                    match completionItemKind.valueSet
                    | let valueSet: Array[CompletionItemKind] =>
                        h.assert_eq[I32](25, valueSet.size().i32())
                    else
                        h.fail("completionItemKind.valueSet is not of type Array[CompletionItemKind]")
                    end
                else
                    h.fail("completion.completionItemKind is not of type CompletionClientCapabilitiesCompletionItemKind")
                end
            else
                h.fail("textDocument.completion is not of type CompletionClientCapabilities")
            end
        else
            h.fail("capabilities.textDocument is not of type TextDocumentClientCapabilities")
        end
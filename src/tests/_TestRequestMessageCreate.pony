use "ponytest"
use "json"
use "../types/client"
use "Debug"

class _TestRequestMessageCreate is UnitTest
    let _msg: String = """
{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"processId":19480,"clientInfo":{"name":"vscode","version":"1.47.3"},"rootPath":null,"rootUri":null,"capabilities":{"workspace":{"applyEdit":true,"workspaceEdit":{"documentChanges":true,"resourceOperations":["create","rename","delete"],"failureHandling":"textOnlyTransactional"},"didChangeConfiguration":{"dynamicRegistration":true},"didChangeWatchedFiles":{"dynamicRegistration":true},"symbol":{"dynamicRegistration":true,"symbolKind":{"valueSet":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]}},"executeCommand":{"dynamicRegistration":true},"configuration":true,"workspaceFolders":true},"textDocument":{"publishDiagnostics":{"relatedInformation":true,"versionSupport":false,"tagSupport":{"valueSet":[1,2]}},"synchronization":{"dynamicRegistration":true,"willSave":true,"willSaveWaitUntil":true,"didSave":true},"completion":{"dynamicRegistration":true,"contextSupport":true,"completionItem":{"snippetSupport":true,"commitCharactersSupport":true,"documentationFormat":["markdown","plaintext"],"deprecatedSupport":true,"preselectSupport":true,"tagSupport":{"valueSet":[1]}},"completionItemKind":{"valueSet":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]}},"hover":{"dynamicRegistration":true,"contentFormat":["markdown","plaintext"]},"signatureHelp":{"dynamicRegistration":true,"signatureInformation":{"documentationFormat":["markdown","plaintext"],"parameterInformation":{"labelOffsetSupport":true}},"contextSupport":true},"definition":{"dynamicRegistration":true,"linkSupport":true},"references":{"dynamicRegistration":true},"documentHighlight":{"dynamicRegistration":true},"documentSymbol":{"dynamicRegistration":true,"symbolKind":{"valueSet":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]},"hierarchicalDocumentSymbolSupport":true},"codeAction":{"dynamicRegistration":true,"isPreferredSupport":true,"codeActionLiteralSupport":{"codeActionKind":{"valueSet":["","quickfix","refactor","refactor.extract","refactor.inline","refactor.rewrite","source","source.organizeImports"]}}},"codeLens":{"dynamicRegistration":true},"formatting":{"dynamicRegistration":true},"rangeFormatting":{"dynamicRegistration":true},"onTypeFormatting":{"dynamicRegistration":true},"rename":{"dynamicRegistration":true,"prepareSupport":true},"documentLink":{"dynamicRegistration":true,"tooltipSupport":true},"typeDefinition":{"dynamicRegistration":true,"linkSupport":true},"implementation":{"dynamicRegistration":true,"linkSupport":true},"colorProvider":{"dynamicRegistration":true},"foldingRange":{"dynamicRegistration":true,"rangeLimit":5000,"lineFoldingOnly":true},"declaration":{"dynamicRegistration":true,"linkSupport":true},"selectionRange":{"dynamicRegistration":true}},"window":{"workDoneProgress":true}},"trace":"off","workspaceFolders":null}}"""

    fun name() : String => "RequestMessage:Create"

    fun apply(h: TestHelper) =>
        let json = JsonDoc
        try
            json.parse(_msg)?
            let request_message = RequestMessage(json.data as JsonObject)?
            h.assert_eq[I64](1, request_message.id)
            h.assert_eq[String]("initialize", request_message.method)
        end

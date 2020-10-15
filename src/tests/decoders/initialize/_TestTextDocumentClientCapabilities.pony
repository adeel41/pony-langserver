use "../../../types"
use "ponytest"

class iso _TestTextDocumentClientCapabilities is UnitTest
    fun name() : String => "decoders:initialize:TextDocumentClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getTextDocumentClientCapabilities()
        match data'
        | let data:TextDocumentClientCapabilities =>
            h.assert_false(data.publishDiagnostics is None, "publishDiagnostics is None")
            h.assert_false(data.synchronization is None, "synchronization is None")
            h.assert_false(data.completion is None, "completion is None")
            h.assert_false(data.hover is None, "hover is None")
            h.assert_false(data.signatureHelp is None, "signatureHelp is None")
            h.assert_false(data.declaration is None, "declaration is None")
            h.assert_false(data.definition is None, "definition is None")
            h.assert_false(data.typeDefinition is None, "typeDefinition is None")
            h.assert_false(data.implementation is None, "implementation is None")
            h.assert_false(data.references is None, "references is None")
            h.assert_false(data.documentHighlight is None, "documentHighlight is None")
            h.assert_false(data.documentSymbol is None, "documentSymbol is None")
            h.assert_false(data.codeAction is None, "codeAction is None")
            h.assert_false(data.codeLens is None, "codeLens is None")
            h.assert_false(data.documentLink is None, "documentLink is None")
            h.assert_false(data.colorProvider is None, "colorProvider is None")
            h.assert_false(data.formatting is None, "formatting is None")
            h.assert_false(data.rangeFormatting is None, "rangeFormatting is None")
            h.assert_false(data.onTypeFormatting is None, "onTypeFormatting is None")
            h.assert_false(data.rename is None, "rename is None")
            h.assert_false(data.publishDiagnostics is None, "publishDiagnostics is None")
            h.assert_false(data.foldingRange is None, "foldingRange is None")
            h.assert_false(data.selectionRange is None, "selectionRange is None")
            // h.assert_true(data.semanticTokens is None, "semanticTokens is None")
        else
            h.fail("data is not of type TextDocumentClientCapabilities")
        end

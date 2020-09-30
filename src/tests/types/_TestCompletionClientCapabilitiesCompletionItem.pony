use "ponytest"
use "../../types"

class iso _TestCompletionClientCapabilitiesCompletionItem is UnitTest
    fun name() : String => "CompletionClientCapabilitiesCompletionItem"
    fun apply(h: TestHelper) =>
        let data' = TestData.getCompletionClientCapabilitiesCompletionItem()
        match data'
        | let data: CompletionClientCapabilitiesCompletionItem =>
            h.assert_true(try data.snippetSupport as Bool else false end)
            h.assert_true(try data.commitCharactersSupport as Bool else false end)
            match data.documentationFormat
            | let documentationFormat: Array[MarkupKind] =>
                h.assert_true(try documentationFormat(0)? is MarkupKindMarkdown else false end) 
                h.assert_true(try documentationFormat(1)? is MarkupKindPlainText else false end)
            else
                h.fail("documentationFormat does not contain MarkupKind")
            end
            h.assert_true(try data.deprecatedSupport as Bool else false end)
            h.assert_true(try data.preselectSupport as Bool else false end)
            match data.tagSupport
            | let tagSupport: CompletionItemTagSupport =>
                h.assert_true(try tagSupport.valueSet(0)? is CompletionItemTagDeprecated else false end)
            else
                h.fail("tagSupport is not of type CompletionItemTagSupport")
            end
        else
            h.fail("data is not of type CompletionClientCapabilitiesCompletionItem")
        end
use "ponytest"
use "../../types"

class iso _TestCompletionClientCapabilities is UnitTest
    fun name() : String => "CompletionClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getCompletionClientCapabilities()
        match data'
        | let data: CompletionClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_true(try data.contextSupport as Bool else false end)
            h.assert_false(data.completionItem is None)
            h.assert_false(data.completionItemKind is None)
            match data.completionItemKind
            | let completionItemKind : CompletionClientCapabilitiesCompletionItemKind =>
                match completionItemKind.valueSet
                | let valueSet: Array[CompletionItemKind] =>
                    h.assert_eq[I32](25, valueSet.size().i32())
                else
                    h.fail("data.completionItemKind.valueSet is not of type Array[CompletionItemKind]")
                end
            else
                h.fail("data.completionItemKind is not of type CompletionClientCapabilitiesCompletionItemKind")
            end
        else
            h.fail("data is not of type CompletionClientCapabilities")
        end

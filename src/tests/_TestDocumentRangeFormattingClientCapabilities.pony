use "ponytest"
use "../types/client"

class iso _TestDocumentRangeFormattingClientCapabilities is UnitTest
    fun name() : String => "DocumentRangeFormattingClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDocumentRangeFormattingClientCapabilities()
        match data'
        | let data: DocumentRangeFormattingClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        end
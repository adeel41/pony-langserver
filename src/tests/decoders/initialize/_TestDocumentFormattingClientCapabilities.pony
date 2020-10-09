use "ponytest"
use "../../../types"

class iso _TestDocumentFormattingClientCapabilities is UnitTest
    fun name() : String => "types:DocumentFormattingClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDocumentFormattingClientCapabilities()
        match data'
        | let data: DocumentFormattingClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        end
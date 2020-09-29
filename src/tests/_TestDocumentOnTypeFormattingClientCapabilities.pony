use "ponytest"
use "../types"

class iso _TestDocumentOnTypeFormattingClientCapabilities is UnitTest
    fun name() : String => "DocumentOnTypeFormattingClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDocumentOnTypeFormattingClientCapabilities()
        match data'
        | let data: DocumentOnTypeFormattingClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        end
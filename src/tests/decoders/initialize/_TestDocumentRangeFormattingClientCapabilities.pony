use "ponytest"
use "../../../types"

class iso _TestDocumentRangeFormattingClientCapabilities is UnitTest
    fun name() : String => "decoders:initialize:DocumentRangeFormattingClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDocumentRangeFormattingClientCapabilities()
        match data'
        | let data: DocumentRangeFormattingClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        end
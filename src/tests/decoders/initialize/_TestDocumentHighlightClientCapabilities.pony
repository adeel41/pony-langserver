use "ponytest"
use "../../../types"

class iso _TestDocumentHighlightClientCapabilities is UnitTest
    fun name() : String => "decoders:initialize:DocumentHighlightClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDocumentHighlightClientCapabilities()
        match data'
        | let data: DocumentHighlightClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        else
            h.fail("data is not of type DocumentHighlightClientCapabilities")
        end
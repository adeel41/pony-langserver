use "ponytest"
use "../../types"

class iso _TestDocumentColorClientCapabilities is UnitTest
    fun name() : String => "types:DocumentColorClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDocumentColorClientCapabilities()
        match data'
        | let data: DocumentColorClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        end
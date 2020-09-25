use "ponytest"
use "../types/client"

class iso _TestDocumentColorClientCapabilities is UnitTest
    fun name() : String => "DocumentColorClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDocumentColorClientCapabilities()
        match data'
        | let data: DocumentColorClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        end
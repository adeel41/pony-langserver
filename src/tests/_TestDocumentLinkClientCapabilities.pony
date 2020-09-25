use "ponytest"
use "../types/client"

class iso _TestDocumentLinkClientCapabilities is UnitTest
    fun name() : String => "DocumentLinkClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDocumentLinkClientCapabilities()
        match data'
        | let data: DocumentLinkClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_true(try data.tooltipSupport as Bool else false end)
        end
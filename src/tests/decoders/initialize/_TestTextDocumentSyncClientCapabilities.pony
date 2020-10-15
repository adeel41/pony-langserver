use "../../../types"
use "ponytest"

class iso _TestTextDocumentSyncClientCapabilities is UnitTest
    fun name() : String => "decoders:initialize:TextDocumentSyncClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getTextDocumentSyncClientCapabilities()
        match data'
        | let data: TextDocumentSyncClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_true(try data.willSave as Bool else false end)
            h.assert_true(try data.willSaveWaitUntil as Bool else false end)
            h.assert_true(try data.didSave as Bool else false end)
        else
            h.fail("data is not of type TextDocumentSyncClientCapabilities")
        end
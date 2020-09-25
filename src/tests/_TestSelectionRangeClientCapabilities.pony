use "ponytest"
use "../types/client"

class iso _TestSelectionRangeClientCapabilities is UnitTest
    fun name() : String => "SelectionRangeClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getSelectionRangeClientCapabilities()
        match data'
        | let data : SelectionRangeClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        end
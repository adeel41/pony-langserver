use "ponytest"
use "../../types"

class iso _TestSelectionRangeClientCapabilities is UnitTest
    fun name() : String => "types:SelectionRangeClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getSelectionRangeClientCapabilities()
        match data'
        | let data : SelectionRangeClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        end
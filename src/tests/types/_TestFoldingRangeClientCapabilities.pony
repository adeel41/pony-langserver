use "ponytest"
use "../../types"

class iso _TestFoldingRangeClientCapabilities  is UnitTest
    fun name() : String => "FoldingRangeClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getFoldingRangeClientCapabilities()
        match data'
        | let data: FoldingRangeClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_eq[I64](5000, try data.rangeLimit as I64 else 0 end)
            h.assert_true(try data.lineFoldingOnly as Bool else false end)
        end
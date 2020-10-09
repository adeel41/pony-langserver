use "ponytest"
use "../../../types"

class iso _TestHoverClientCapabilities is UnitTest
    fun name() : String => "types:HoverClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getHoverClientCapabilities()
        match data'
        | let data: HoverClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end, "dynamicRegistration is not true")
            h.assert_eq[I32](2, try (data.contentFormat as Array[MarkupKind]).size().i32() else 0 end, "error while processing `contentFormat`.")
        else
            h.fail("data is not of type HoverClientCapabilities")
        end
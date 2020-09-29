use "ponytest"
use "../types"

class iso _TestImplementationClientCapabilities is UnitTest
    fun name() : String => "ImplementationClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getImplementationClientCapabilities()
        match data'
        | let data: ImplementationClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_true(try data.linkSupport as Bool else false end)
        end
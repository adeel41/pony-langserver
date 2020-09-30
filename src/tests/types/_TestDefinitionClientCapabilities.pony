use "ponytest"
use "../../types"

class iso _TestDefinitionClientCapabilities is UnitTest
    fun name() : String => "DefinitionClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDefinitionClientCapabilities()
        match data'
        | let data: DefinitionClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_true(try data.linkSupport as Bool else false end)
        end
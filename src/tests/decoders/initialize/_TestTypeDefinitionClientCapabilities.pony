use "ponytest"
use "../../../types"

class iso _TestTypeDefinitionClientCapabilities is UnitTest
    fun name() : String => "decoders:initialize:TypeDefinitionClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getTypeDefinitionClientCapabilities()
        match data'
        | let data: TypeDefinitionClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_true(try data.linkSupport as Bool else false end)
        end
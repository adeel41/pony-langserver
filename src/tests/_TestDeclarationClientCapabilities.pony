use "ponytest"
use "../types"

class iso _TestDeclarationClientCapabilities is UnitTest
    fun name() : String => "DeclarationClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDeclarationClientCapabilities()
        match data'
        | let data: DeclarationClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_true(try data.linkSupport as Bool else false end)
        end
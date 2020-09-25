use "ponytest"
use "../types/client"

class iso _TestRenameClientCapabilities is UnitTest
    fun name() : String => "RenameClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getRenameClientCapabilities()
        match data'
        | let data: RenameClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_true(try data.prepareSupport as Bool else false end)
        end
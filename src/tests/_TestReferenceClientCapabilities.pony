use "ponytest"
use "../types/client"

class iso _TestReferenceClientCapabilities is UnitTest
    fun name() : String => "ReferenceClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getReferenceClientCapabilities()
        match data'
        | let data: ReferenceClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        else
            h.fail("data is not of type ReferenceClientCapabilities")
        end
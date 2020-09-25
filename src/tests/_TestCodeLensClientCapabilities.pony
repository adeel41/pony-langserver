use "ponytest"
use "../types/client"

class iso _TestCodeLensClientCapabilities is UnitTest
    fun name(): String => "CodeLensClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getCodeLensClientCapabilities()
        match data'
        | let data: CodeLensClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        else
            h.fail("data is not of type CodeLensClientCapabilities")
        end
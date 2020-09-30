use "ponytest"
use "../../types"

class iso _TestCodeLensClientCapabilities is UnitTest
    fun name(): String => "types:CodeLensClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getCodeLensClientCapabilities()
        match data'
        | let data: CodeLensClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
        else
            h.fail("data is not of type CodeLensClientCapabilities")
        end
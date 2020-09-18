use "ponytest"
use "../types"

class iso _TestSemanticTokensClientCapabilities is UnitTest
    fun name() : String => "SemanticTokensClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getSemanticTokensClientCapabilities()
        match data'
        | let data : SemanticTokensClientCapabilities =>
            h.assert_false(true)
        else
            h.fail("data is not of type SemanticTokensClientCapabilities")
        end
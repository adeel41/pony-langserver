use "ponytest"
use "../types"

class iso _TestPublishDiagnosticsClientCapabilities is UnitTest
    fun name() : String => "PublishDiagnosticsClientCapabilities"
    fun apply(h: TestHelper) => 
        let data' = TestData.getPublishDiagnosticsClientCapabilities()
        match data'
        | let data: PublishDiagnosticsClientCapabilities =>
            h.assert_true(try data.relatedInformation as Bool else false end)
            h.assert_false(try data.versionSupport as Bool else true end)
            h.assert_eq[I64](2, try (data.tagSupport as DiagnosticTagSupport).valueSet.size().i64() else 0 end)
        end
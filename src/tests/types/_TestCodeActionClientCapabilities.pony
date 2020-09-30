use "ponytest"
use "../../types"

class iso _TestCodeActionClientCapabilities is UnitTest
    fun name() : String => "CodeActionClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getCodeActionClientCapabilities()
        match data'
        | let data: CodeActionClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_true(try data.isPreferredSupport as Bool else false end)
            match data.codeActionLiteralSupport
            | let codeActionLiteralSupport : CodeActionLiteralSupportClientCapabilities =>
                h.assert_eq[I64](8, codeActionLiteralSupport.codeActionKind.valueSet.size().i64())
            else
                h.fail("data.codeActionLiteralSupport is not of type CodeActionLiteralSupportClientCapabilities")
            end
        end
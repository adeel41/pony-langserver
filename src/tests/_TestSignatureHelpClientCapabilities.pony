use "ponytest"
use "../types"

class iso _TestSignatureHelpClientCapabilities is UnitTest
    fun name() : String => "SignatureHelpClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getSignatureHelpClientCapabilities()
        match data'
        | let data: SignatureHelpClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            match data.signatureInformation
            | let signatureInformation: SignatureHelpSignatureInformation =>
                h.assert_eq[I32](2, try (signatureInformation.documentationFormat as Array[MarkupKind]).size().i32() else 0  end )
                h.assert_true(try (signatureInformation.parameterInformation as SignatureHelpParameterInformation).labelOffsetSupport as Bool else false end)
            else
                h.fail("data.signatureInformation is not of type SignatureHelpSignatureInformation") 
            end
            h.assert_true(try data.contextSupport as Bool else false end)
        else
            h.fail("data is not of type SignatureHelpClientCapabilities")
        end
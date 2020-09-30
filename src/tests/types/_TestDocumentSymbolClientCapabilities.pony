use "ponytest"
use "../../types"

class iso _TestDocumentSymbolClientCapabilities is UnitTest
    fun name() : String => "types:DocumentSymbolClientCapabilities"
    fun apply(h: TestHelper) =>
        let data' = TestData.getDocumentSymbolClientCapabilities()
        match data'
        | let data: DocumentSymbolClientCapabilities =>
            h.assert_true(try data.dynamicRegistration as Bool else false end)
            h.assert_true(try data.hierarchicalDocumentSymbolSupport as Bool else false end)
            h.assert_eq[I64](26, try 
                ((data.symbolKind as SymbolKindValueSet)
                .valueSet as Array[SymbolKind])
                .size().i64() else 0 end )
        end
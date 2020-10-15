use "ponytest"
use "json"
use "../../../../types"
use "Debug"

class _TestDidOpenTextDocumentParams is UnitTest

    fun name() : String => "decoders:textDocument:didOpen:DidOpenTextDocumentParams"

    fun apply(h: TestHelper) =>
        var json': (JsonObject | None) = TestData.get_params()
        match json'
        | let json: JsonObject =>
            try
                let instance = DidOpenTextDocumentParams(json)?
            else
                h.fail("unable to convert data into DidOpenTextDocumentParams")
            end
        else
            h.fail("unable to parse json") 
        end

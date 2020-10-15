use "ponytest"
use "../../../../types"

class _TestTextDocumentItem is UnitTest
    fun name() : String => "decoders:textDocument:didOpen:TextDocumentItem"
    fun apply(h: TestHelper) =>
        var data': (TextDocumentItem | None) = TestData.get_textDocument()
        match data'
        | let data: TextDocumentItem =>
            h.assert_eq[String]("file:///d%3A/Coding/Pony/http_server/http_server/handler.pony", data.uri)
            h.assert_eq[String]("pony", data.languageId)
            h.assert_eq[I64](1, data.version)
            h.assert_true(data.text.size().u32() > 0 )
        else
            h.fail("unable to convert data into a TextDocumentItem")
        end

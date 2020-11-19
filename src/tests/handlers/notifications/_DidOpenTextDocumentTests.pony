use "ponytest"
use "../../../types"
use "../../../handlers"
use model = "../../../model"
use parsing = "../../../parsing"
use "../../data"
use "json"
use "debug"

class _DidOpenTextDocumentTests is UnitTest

    fun name() : String => "handlers:notifications:didOpen:TextDocument"
    fun apply(h: TestHelper) =>
        let json = TextDocumentDidOpenNotificationData.get_as_json()
        let content = try 
                let params = json.data("params")? as JsonObject
                let textDocumentJson = params.data("textDocument")? as JsonObject
                textDocumentJson.data("text")? as String
        else "" end
        parsing.PonyDocumentParser.parse(content)
        //todo: use parser to read content and extract class name. and set active document

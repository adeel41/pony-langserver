use "json"

class DidOpenTextDocumentParams
    let textDocument: TextDocumentItem

    new create(json: JsonObject) ? =>
        textDocument = TextDocumentItem(json.data("textDocument")? as JsonObject)

use "json"

class DidOpenTextDocumentParams
    let textDocument: TextDocumentItem

    new create(json: JsonObject box) ? =>
        textDocument = TextDocumentItem(json.data("textDocument")? as JsonObject box)

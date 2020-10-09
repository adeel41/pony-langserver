use "json"

class RequestMessage
    let id: I64
    let method: String
    let _params: (JsonObject box | None)

    new create(json: JsonObject) ? =>
        id = json.data("id")? as I64
        method = json.data("method")? as String
        _params = try json.data("params")? as JsonObject box else None end

    fun get_params() : (None | InitializeParams) =>
        match method
        | "initialize" => try InitializeParams(_params as JsonObject box) end
        else
            None
        end

class DidOpenTextDocumentParams
    let textDocument: TextDocumentItem

    new create(json: JsonObject) =>
        textDocument = TextDocumentItem(json)

class TextDocumentItem
    let uri: String
    """
    The text document's URI.
    """

    let languageId: String
    """
    The text document's language identifier.
    """

    let version: I64
    """
    The version number of this document (it will increase after each
	change, including undo/redo).
    """

    let text: String
    """
    The content of the opened text document.
    """

    new create(json: JsonObject) =>
        uri = ""
        languageId = ""
        version = 0
        text = ""
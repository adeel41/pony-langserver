use "json"

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

    new create(json: JsonObject box) =>
        uri = try json.data("uri")? as String else "" end
        languageId = try json.data("languageId")? as String else "" end
        version = try json.data("version")? as I64 else 0 end
        text = try json.data("text")? as String else "" end
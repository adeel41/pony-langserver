use "json"

class Notification
    let method: String
    let _params: (JsonObject box | JsonArray box | None)

    new create(json: JsonObject box) ? =>
        method = json.data("method")? as String
        _params = try json.data("params")? as JsonObject box else None end

    fun get_params() : NotificationTypes =>
        match method
        | "initialized" => InitializedParams
        | "textDocument/didOpen" => try DidOpenTextDocumentParams(_params as JsonObject box)? else None end
        else
            None
        end
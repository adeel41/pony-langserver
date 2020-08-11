use "json"

class RequestMessage
    let id: I64
    let method: String
    let params: (JsonArray | None)

    new create(json: JsonObject) ? =>
        id = json.data("id")? as I64
        method = json.data("method")? as String
        params = json.data("params")? as JsonArray
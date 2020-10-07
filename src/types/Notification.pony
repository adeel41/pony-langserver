use "json"

class Notification
    let method: String
    let _params: (JsonObject box | JsonArray box | None)

    new create(json: JsonObject box) ? =>
        method = json.data("method")? as String
        _params = try json.data("params")? as JsonObject box else None end
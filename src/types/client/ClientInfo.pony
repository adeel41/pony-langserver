use "json"

class ClientInfo
    let name: String
    let version: (String | None)

    new create(json: JsonObject box) ? =>
        name = try json.data("name")? as String else "" end
        version = json.data("version")? as String

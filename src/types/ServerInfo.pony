use "json"

class ServerInfo
    let name: String
    let version: (String | None)

    new create(name':String, version':String) =>
        name = name'
        version = version'

    fun to_json() : JsonObject =>
        let json = JsonObject
        json.data("name") = name
        try json.data("version") = version as String end
        json
use "json"

class WorkspaceFolder
    let uri: String
    let name: String
    new create(json: JsonObject box) =>
        uri = try json.data("uri")? as String else "" end
        name = try json.data("name")? as String else "" end

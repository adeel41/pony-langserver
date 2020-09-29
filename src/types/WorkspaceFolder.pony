use "json"

class WorkspaceFolder
    let uri: String
    let name: String
    new create(json: JsonObject) ? =>
        uri = json.data("uri")? as String
        name = json.data("name")? as String

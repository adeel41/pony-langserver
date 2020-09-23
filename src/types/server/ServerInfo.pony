class ServerInfo
    let name: String
    let version: (String | None)

    new create(name':String, version':String) =>
        name = name'
        version = version'
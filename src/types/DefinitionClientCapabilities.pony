use "json"

class DefinitionClientCapabilities
    let dynamicRegistration: (Bool | None)
    let linkSupport: (Bool | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
        linkSupport = try json.data("linkSupport")? as Bool else None end
use "json"

class DeclarationClientCapabilities
    let dynamicRegistration: (Bool | None)
    let linkSupport: (Bool | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool end
        linkSupport = try json.data("linkSupport")? as Bool end

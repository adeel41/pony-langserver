use "json"

class CodeLensClientCapabilities
    let dynamicRegistration : (Bool | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
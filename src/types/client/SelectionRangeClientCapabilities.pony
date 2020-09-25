use "json"

class SelectionRangeClientCapabilities
    let dynamicRegistration: (Bool | None)
    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
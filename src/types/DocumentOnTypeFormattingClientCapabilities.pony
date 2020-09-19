use "json"

class DocumentOnTypeFormattingClientCapabilities
    let dynamicRegistration: (Bool | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool end

use "json"

class RenameClientCapabilities
    let dynamicRegistration: (Bool | None)
    let prepareSupport: (Bool | None)
    let prepareSupportDefaultBehavior: (Bool | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool end
        prepareSupport = try json.data("prepareSupport")? as Bool end
        prepareSupportDefaultBehavior = try json.data("prepareSupportDefaultBehaviour")? as Bool end        
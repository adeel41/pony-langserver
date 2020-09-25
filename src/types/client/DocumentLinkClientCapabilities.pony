use "json"

class DocumentLinkClientCapabilities
    let dynamicRegistration: (Bool | None)
    let tooltipSupport: (Bool | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool end
        tooltipSupport = try json.data("tooltipSupport")? as Bool end

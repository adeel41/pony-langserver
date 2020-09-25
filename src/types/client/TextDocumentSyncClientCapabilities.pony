use "json"

class TextDocumentSyncClientCapabilities
    let dynamicRegistration: (Bool | None)
    let willSave: (Bool | None)
    let willSaveWaitUntil: (Bool | None)
    let didSave: (Bool | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
        willSave = try json.data("willSave")? as Bool else None end
        willSaveWaitUntil = try json.data("willSaveWaitUntil")? as Bool else None end
        didSave = try json.data("didSave")? as Bool else None end
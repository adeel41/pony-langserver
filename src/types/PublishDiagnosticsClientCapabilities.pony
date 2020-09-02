use "json"

class PublishDiagnosticsClientCapabilities
    let relatedInformation: (Bool | None)

    new create(json: JsonObject) =>
        relatedInformation = None

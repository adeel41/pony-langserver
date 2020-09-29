use "json"

class SignatureHelpClientCapabilities
    let dynamicRegistration: (Bool | None)
    let signatureInformation: (SignatureHelpSignatureInformation | None)
    let contextSupport: (Bool | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
        signatureInformation = try SignatureHelpSignatureInformation(json.data("signatureInformation")? as JsonObject box) else None end
        contextSupport = try json.data("contextSupport")? as Bool else None end


class SignatureHelpSignatureInformation
    let documentationFormat: (Array[MarkupKind] | None)
    let parameterInformation: (SignatureHelpParameterInformation | None)

    new create(json: JsonObject box) =>
        documentationFormat = DocumentationFormatFactory(json)
        parameterInformation = try SignatureHelpParameterInformation(json.data("parameterInformation")? as JsonObject box) else None end

class SignatureHelpParameterInformation
    let labelOffsetSupport: (Bool | None)

    new create(json : JsonObject box) =>
        labelOffsetSupport = try json.data("labelOffsetSupport")? as Bool else None end
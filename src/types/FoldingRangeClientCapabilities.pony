use "json"

class FoldingRangeClientCapabilities
    let dynamicRegistration: (Bool | None)
    let rangeLimit: (I64 | None)
    let lineFoldingOnly: (Bool | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
        rangeLimit = try json.data("rangeLimit")? as I64 else None end
        lineFoldingOnly = try json.data("lineFoldingOnly")? as Bool else None end
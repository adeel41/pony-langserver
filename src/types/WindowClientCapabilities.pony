use "json"

class WindowClientCapabilities
    let workDoneProgress: (Bool | None)
    new create(json: JsonObject box) =>
        workDoneProgress = try json.data("workDoneProgress")? as Bool else None end

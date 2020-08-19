use "json"

class RequestMessage
    let id: I64
    let method: String
    let _params: (JsonObject box | None)

    new create(json: JsonObject) ? =>
        id = json.data("id")? as I64
        method = json.data("method")? as String
        _params = try json.data("params")? as JsonObject box else None end

    fun get_params() : (None | InitializeParams) ? =>
        match method
        | "initialize" => InitializeParams(_params as JsonObject box)?
        else
            None            
        end
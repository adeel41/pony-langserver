use "json"

class SemanticTokensClientCapabilities
    let dynamicRegistration: (Bool | None)
    let requests: SemanticTokensRequestsClientCapabilities
    let tokenType: Array[String]
    let tokenModifiers: Array[String]
    let formats: Array[TokenFormat]

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
        requests = try SemanticTokensRequestsClientCapabilities(json.data("requests")? as JsonObject box) else SemanticTokensRequestsClientCapabilities.empty() end
        tokenType = 
            try
                let result = Array[String]
                let arr = json.data("tokenType")? as JsonArray box
                for v' in arr.data.values() do
                    match v'
                    | let v : String => result.push(v)
                    end                    
                end
                result
            else
                Array[String]()
            end
        tokenModifiers = 
            try
                let result = Array[String]
                let arr = json.data("tokenModifiers")? as JsonArray box
                for v in arr.data.values() do
                    match v
                    | let v_str : String => result.push(v_str)
                    end
                end
                result
            else
                Array[String]()
            end
        formats = 
            try
                let result = Array[TokenFormat]
                let arr = json.data("formats")? as JsonArray box
                for v in arr.data.values() do
                    match v
                    | "relative" => result.push(TokenFormatRelative)
                    end
                end
                result
            else
                Array[TokenFormat]()
            end


class SemanticTokensRequestsClientCapabilities
    let range: (Bool | None)
    let full: (Bool | SemanticTokensRequestsFullClientCapabilities)

    new empty() =>
        range = None
        full = SemanticTokensRequestsFullClientCapabilities.empty()

    new create(json: JsonObject box) =>
        range = try json.data("range")? as Bool else None end
        full = 
            try 
                match json.data("full")?
                | let full_bool : Bool =>
                    full_bool 
                | let full_json : JsonObject box =>
                    SemanticTokensRequestsFullClientCapabilities(full_json) 
                else
                    SemanticTokensRequestsFullClientCapabilities.empty()
                end
            else
                SemanticTokensRequestsFullClientCapabilities.empty()
            end

class SemanticTokensRequestsFullClientCapabilities
    let delta: (Bool | None)

    new empty() =>
        delta = None

    new create(json: JsonObject box) =>
        delta = try json.data("delta")? as Bool else None end
use "json"

class HoverClientCapabilities
    let dynamicRegistration : (Bool | None)
    let contentFormat : (Array[MarkupKind] | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
        contentFormat =  try
            let result = Array[MarkupKind](2)
            let arr = json.data("contentFormat")? as JsonArray box
            for value in arr.data.values() do 
                match value
                | "markdown" => result.push(MarkupKindMarkdown)
                | "plaintext" => result.push(MarkupKindPlainText) 
                end
            end
            result
        else
            None
        end
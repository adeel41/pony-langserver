use "json"

class SymbolTagValueSet
    let valueSet: Array[SymbolTag]

    new create(json: JsonObject box) =>
        valueSet = 
            try
                let result = Array[SymbolTag](1)
                let arr = json.data("valueSet")? as JsonArray box
                for value in arr.data.values() do
                    match value
                    | let v: I64 =>
                        if v == 1 then result.push(SymbolTag) end 
                    end
                end
                result
            else
                Array[SymbolTag](0)
            end


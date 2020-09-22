use "json"

class SymbolKindValueSet
    let valueSet: (Array[SymbolKind] | None) 

    new create(json: JsonObject box) =>
        valueSet = 
            try
                let result = Array[SymbolKind]
                let arr = json.data("valueSet")? as JsonArray box
                for value' in arr.data.values() do
                    match value'
                    | let value: I64 =>
                        match value
                        | 1 => result.push(SymbolKindFile)
                        | 2 => result.push(SymbolKindModule)
                        | 3 => result.push(SymbolKindNamespace)
                        | 4 => result.push(SymbolKindPackage)
                        | 5 => result.push(SymbolKindClass)
                        | 6 => result.push(SymbolKindMethod)
                        | 7 => result.push(SymbolKindProperty)
                        | 8 => result.push(SymbolKindField)
                        | 9 => result.push(SymbolKindConstructor)
                        | 10 => result.push(SymbolKindEnum)
                        | 11 => result.push(SymbolKindInterface)
                        | 12 => result.push(SymbolKindFunction)
                        | 13 => result.push(SymbolKindVariable)
                        | 14 => result.push(SymbolKindConstant)
                        | 15 => result.push(SymbolKindString)
                        | 16 => result.push(SymbolKindNumber)
                        | 17 => result.push(SymbolKindBoolean)
                        | 18 => result.push(SymbolKindArray)
                        | 19 => result.push(SymbolKindObject)
                        | 20 => result.push(SymbolKindKey)
                        | 21 => result.push(SymbolKindNull)
                        | 22 => result.push(SymbolKindEnumMember)
                        | 23 => result.push(SymbolKindStruct)
                        | 24 => result.push(SymbolKindEvent)
                        | 25 => result.push(SymbolKindOperator)
                        | 26 => result.push(SymbolKindTypeParameter)
                        end
                    end
                end
                result
            end
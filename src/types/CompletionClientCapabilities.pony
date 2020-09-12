use "json"

class CompletionClientCapabilities
    let dynamicRegistration: (Bool | None)
    let completionItem: (CompletionClientCapabilitiesCompletionItem | None)
    let completionItemKind: (CompletionClientCapabilitiesCompletionItemKind | None)
    let contextSupport: (Bool | None)

    new create(json: JsonObject box)  =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool else None end
        completionItem = try CompletionClientCapabilitiesCompletionItem(json.data("completionItem")? as JsonObject box) else None end
        completionItemKind = try CompletionClientCapabilitiesCompletionItemKind(json.data("completionItemKind")? as JsonObject box) else None end
        contextSupport = try json.data("contextSupport")? as Bool else None end


class CompletionClientCapabilitiesCompletionItem
    let snippetSupport: (Bool | None)
    let commitCharactersSupport: (Bool | None)
    let documentationFormat: (Array[MarkupKind] | None)
    let deprecatedSupport: (Bool | None)
    let preselectSupport: (Bool | None)
    let tagSupport: (CompletionItemTagSupport | None)
    let insertReplaceSupport: (Bool | None)
    let resolveAdditionalTextEditsSupport: (Bool | None)


    new create(json: JsonObject box) =>
        snippetSupport = try json.data("snippetSupport")? as Bool else None end
        commitCharactersSupport = try json.data("commitCharactersSupport")? as Bool else None end        
        documentationFormat = DocumentationFormatFactory(json)
        deprecatedSupport = try json.data("deprecatedSupport")? as Bool else None end
        preselectSupport = try json.data("preselectSupport")? as Bool else None end
        tagSupport = try CompletionItemTagSupport(json.data("tagSupport")? as JsonObject box) else None end
        insertReplaceSupport = try json.data("insertReplaceSupport")? as Bool else None end
        resolveAdditionalTextEditsSupport = try json.data("resolveAdditionalTextEditsSupport")? as Bool else None end


class CompletionItemTagSupport
    let valueSet: Array[CompletionItemTag]

    new create(json: JsonObject box) =>
        valueSet = 
            try
                let result = Array[CompletionItemTag](1)
                let arr = json.data("valueSet")? as JsonArray box
                for value in arr.data.values() do
                    match value
                    | let v: I64 =>
                        if v == 1 then result.push(CompletionItemTagDeprecated) end 
                    end
                end
                result
            else
                Array[CompletionItemTag](0)
            end
        
                

class CompletionClientCapabilitiesCompletionItemKind
    let valueSet : (Array[CompletionItemKind] | None)

    new create(json: JsonObject box) =>
        valueSet = 
            try
                let result = Array[CompletionItemKind]
                let arr = json.data("valueSet")? as JsonArray box
                for v in arr.data.values() do
                    match v
                    | let v':I64 =>
                        match v'
                        | 1 => result.push(CompletionItemKindText)
                        | 2 => result.push(CompletionItemKindMethod)
                        | 3 => result.push(CompletionItemKindFunction)
                        | 4 => result.push(CompletionItemKindConstructor)
                        | 5 => result.push(CompletionItemKindField)
                        | 6 => result.push(CompletionItemKindVariable)
                        | 7 => result.push(CompletionItemKindClass)
                        | 8 => result.push(CompletionItemKindInterface)
                        | 9 => result.push(CompletionItemKindModule)
                        | 10 => result.push(CompletionItemKindProperty)
                        | 11 => result.push(CompletionItemKindUnit)
                        | 12 => result.push(CompletionItemKindValue)
                        | 13 => result.push(CompletionItemKindEnum)
                        | 14 => result.push(CompletionItemKindKeyword)
                        | 15 => result.push(CompletionItemKindSnippet)
                        | 16 => result.push(CompletionItemKindColor)
                        | 17 => result.push(CompletionItemKindFile)
                        | 18 => result.push(CompletionItemKindReference)
                        | 19 => result.push(CompletionItemKindFolder)
                        | 20 => result.push(CompletionItemKindEnumMember)
                        | 21 => result.push(CompletionItemKindConstant)
                        | 22 => result.push(CompletionItemKindStruct)
                        | 23 => result.push(CompletionItemKindEvent)
                        | 24 => result.push(CompletionItemKindOperator)
                        | 25 => result.push(CompletionItemKindTypeParameter)
                        end
                    end
                end
                result
            else
                None
            end
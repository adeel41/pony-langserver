use "json"

class CodeActionClientCapabilities
    let dynamicRegistration: (Bool | None)
    let isPreferredSupport: (Bool | None)
    let codeActionLiteralSupport: (CodeActionLiteralSupportClientCapabilities | None)

    new create(json: JsonObject box) =>
        dynamicRegistration = try json.data("dynamicRegistration")? as Bool end        
        isPreferredSupport = try json.data("isPreferredSupport")? as Bool end
        codeActionLiteralSupport = try CodeActionLiteralSupportClientCapabilities(json.data("codeActionLiteralSupport")? as JsonObject box) end 

class CodeActionLiteralSupportClientCapabilities
    let codeActionKind: CodeActionLiteralSupportActionKindClientCapabilities

    new create(json: JsonObject box) =>
        codeActionKind =
            try
                CodeActionLiteralSupportActionKindClientCapabilities(json.data("codeActionKind")? as JsonObject box)
            else
                CodeActionLiteralSupportActionKindClientCapabilities.empty()
            end

class CodeActionLiteralSupportActionKindClientCapabilities
    let valueSet: Array[CodeActionKind]

    new empty() =>
        valueSet = Array[CodeActionKind]
    new create(json: JsonObject box) =>
        valueSet =
            try
                let result = Array[CodeActionKind]
                let arr = json.data("valueSet")? as JsonArray box
                for value in arr.data.values() do
                    match value
                    | "" => result.push(CodeActionKindEmpty)
                    | "quickfix" => result.push(CodeActionKindQuickFix)
                    | "refactor" => result.push(CodeActionKindRefactor)
                    | "refactor.extract" => result.push(CodeActionKindRefactorExtract)
                    | "refactor.inline" => result.push(CodeActionKindRefactorInline)
                    | "refactor.rewrite" => result.push(CodeActionKindRefactorRewrite)
                    | "source" => result.push(CodeActionKindSource)
                    | "source.organizeImports" =>  result.push(CodeActionKindSourceOrganizeImports)
                    end 
                end
                result
            else
                Array[CodeActionKind]
            end

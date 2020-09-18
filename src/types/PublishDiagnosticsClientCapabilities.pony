use "json"

class PublishDiagnosticsClientCapabilities
    let relatedInformation: (Bool | None)
    let tagSupport: (DiagnosticTagSupport | None)
    let versionSupport: (Bool | None)

    new create(json: JsonObject box) =>
        relatedInformation = try json.data("relatedInformation")? as Bool end
        tagSupport = try DiagnosticTagSupport(json.data("tagSupport")? as JsonObject box) end
        versionSupport = try json.data("versionSupport")? as Bool end

class DiagnosticTagSupport
    let valueSet: Array[DiagnosticTag]

    new create(json: JsonObject box) =>
        valueSet = 
            try
                let result = Array[DiagnosticTag]
                let arr = json.data("valueSet")? as JsonArray box
                for value' in arr.data.values() do 
                    match value'
                    | let value: I64 =>
                        match value
                        | 1 => result.push(DiagnosticTagUnnecessary)
                        | 2 => result.push(DiagnosticTagDeprecated)
                        end
                    end
                end
                result
            else
                Array[DiagnosticTag]()
            end
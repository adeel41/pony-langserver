use "json"

class WorkspaceEditClientCapabilities
    let documentChanges: (Bool | None)
    let resourceOperations: (Array[ResourceOperationKind] | None)
    let failureHandling: (FailureHandlingKind | None)

    new create(json: JsonObject box) =>
        documentChanges = try json.data("documentChanges")? as Bool else None end
        resourceOperations = 
            try 
                let result = Array[ResourceOperationKind](3)
                let arr = json.data("resourceOperations")? as JsonArray box
                for operation in arr.data.values() do
                    match operation
                    | "create" => result.push(ResourceOperationKindCreate)
                    | "rename" => result.push(ResourceOperationKindRename)
                    | "delete" => result.push(ResourceOperationKindDelete)
                    end
                end
                result
            else
                None
            end
        
        failureHandling =
            try
                match json.data("failureHandling")? as String
                | "abort" => FailureHandlingKindAbort
                | "transactional" => FailureHandlingKindTransactional
                | "undo" => FailureHandlingKindUndo
                | "textOnlyTransactional" => FailureHandlingKindTextOnlyTransactional
                end
            else
                None
            end
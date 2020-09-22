use "json"

primitive TracingOff
primitive TracingMessages
primitive TracingVerbose
type Tracing is (TracingOff | TracingMessages | TracingVerbose)

primitive ResourceOperationKindCreate
primitive ResourceOperationKindRename
primitive ResourceOperationKindDelete
type ResourceOperationKind is (ResourceOperationKindCreate | ResourceOperationKindRename | ResourceOperationKindDelete)

primitive FailureHandlingKindAbort
primitive FailureHandlingKindTransactional
primitive FailureHandlingKindUndo
primitive FailureHandlingKindTextOnlyTransactional
type FailureHandlingKind is (FailureHandlingKindAbort | FailureHandlingKindTransactional | FailureHandlingKindUndo | FailureHandlingKindTextOnlyTransactional)

primitive SymbolKindFile
primitive SymbolKindModule
primitive SymbolKindNamespace
primitive SymbolKindPackage
primitive SymbolKindClass
primitive SymbolKindMethod
primitive SymbolKindProperty
primitive SymbolKindField
primitive SymbolKindConstructor
primitive SymbolKindEnum
primitive SymbolKindInterface
primitive SymbolKindFunction
primitive SymbolKindVariable
primitive SymbolKindConstant
primitive SymbolKindString
primitive SymbolKindNumber
primitive SymbolKindBoolean
primitive SymbolKindArray
primitive SymbolKindObject
primitive SymbolKindKey
primitive SymbolKindNull
primitive SymbolKindEnumMember
primitive SymbolKindStruct
primitive SymbolKindEvent
primitive SymbolKindOperator
primitive SymbolKindTypeParameter

type SymbolKind is ( SymbolKindFile
    | SymbolKindModule
    | SymbolKindNamespace
    | SymbolKindPackage
    | SymbolKindClass
    | SymbolKindMethod
    | SymbolKindProperty
    | SymbolKindField
    | SymbolKindConstructor
    | SymbolKindEnum
    | SymbolKindInterface
    | SymbolKindFunction
    | SymbolKindVariable
    | SymbolKindConstant
    | SymbolKindString
    | SymbolKindNumber
    | SymbolKindBoolean
    | SymbolKindArray
    | SymbolKindObject
    | SymbolKindKey
    | SymbolKindNull
    | SymbolKindEnumMember
    | SymbolKindStruct
    | SymbolKindEvent
    | SymbolKindOperator
    | SymbolKindTypeParameter    
)

primitive MarkupKindPlainText
primitive MarkupKindMarkdown
type MarkupKind is ( MarkupKindPlainText | MarkupKindMarkdown)
primitive DocumentationFormatFactory
    fun apply(json: JsonObject box) : (Array[MarkupKind] | None) =>
        try 
            let result = Array[MarkupKind](2)
            let arr = json.data("documentationFormat")? as JsonArray box
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

//Are they are considered same as SymbolTag
primitive CompletionItemTagDeprecated
type CompletionItemTag is CompletionItemTagDeprecated

primitive CompletionItemKindText
primitive CompletionItemKindMethod
primitive CompletionItemKindFunction
primitive CompletionItemKindConstructor
primitive CompletionItemKindField
primitive CompletionItemKindVariable
primitive CompletionItemKindClass
primitive CompletionItemKindInterface
primitive CompletionItemKindModule
primitive CompletionItemKindProperty
primitive CompletionItemKindUnit
primitive CompletionItemKindValue
primitive CompletionItemKindEnum
primitive CompletionItemKindKeyword
primitive CompletionItemKindSnippet
primitive CompletionItemKindColor
primitive CompletionItemKindFile
primitive CompletionItemKindReference
primitive CompletionItemKindFolder
primitive CompletionItemKindEnumMember
primitive CompletionItemKindConstant
primitive CompletionItemKindStruct
primitive CompletionItemKindEvent
primitive CompletionItemKindOperator
primitive CompletionItemKindTypeParameter
type CompletionItemKind is ( CompletionItemKindText
    | CompletionItemKindMethod
    | CompletionItemKindFunction
    | CompletionItemKindConstructor
    | CompletionItemKindField
    | CompletionItemKindVariable
    | CompletionItemKindClass
    | CompletionItemKindInterface
    | CompletionItemKindModule
    | CompletionItemKindProperty
    | CompletionItemKindUnit
    | CompletionItemKindValue
    | CompletionItemKindEnum
    | CompletionItemKindKeyword
    | CompletionItemKindSnippet
    | CompletionItemKindColor
    | CompletionItemKindFile
    | CompletionItemKindReference
    | CompletionItemKindFolder
    | CompletionItemKindEnumMember
    | CompletionItemKindConstant
    | CompletionItemKindStruct
    | CompletionItemKindEvent
    | CompletionItemKindOperator
    | CompletionItemKindTypeParameter
)

primitive TokenFormatRelative
type TokenFormat is (TokenFormatRelative)

primitive DiagnosticTagUnnecessary
primitive DiagnosticTagDeprecated
type DiagnosticTag is (DiagnosticTagUnnecessary | DiagnosticTagDeprecated)

primitive CodeActionKindEmpty
primitive CodeActionKindQuickFix
primitive CodeActionKindRefactor
primitive CodeActionKindRefactorExtract
primitive CodeActionKindRefactorInline
primitive CodeActionKindRefactorRewrite
primitive CodeActionKindSource
primitive CodeActionKindSourceOrganizeImports
type CodeActionKind is ( CodeActionKindEmpty
    | CodeActionKindQuickFix
    | CodeActionKindRefactor
    | CodeActionKindRefactorExtract
    | CodeActionKindRefactorInline
    | CodeActionKindRefactorRewrite
    | CodeActionKindSource
    | CodeActionKindSourceOrganizeImports    
)

primitive SymbolTagDeprecated
type SymbolTag is SymbolTagDeprecated
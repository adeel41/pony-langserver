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
    | CompletionItemKindOperator
    | CompletionItemKindTypeParameter
)
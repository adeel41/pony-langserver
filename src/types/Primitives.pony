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
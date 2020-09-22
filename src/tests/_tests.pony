use "ponytest"
use "../types"

actor Main is TestList
    new create(env: Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        test(_TestClientCapabilities)
        test(_TestClientInfo)
        test(_TestCompletionClientCapabilities)
        test(_TestCompletionClientCapabilitiesCompletionItem)
        test(_TestEvelopeCreate)
        test(_TestEnvelopeOpen)
        test(_TestHoverClientCapabilities)
        test(_TestInitializeParams)

        test(_TestRequestMessageCreate)
        test(_TestRequestMessageGetParams)
        test(_TestTextDocumentClientCapabilities)
        test(_TestTextDocumentSyncClientCapabilities)
        test(_TestWorkspace)
        test(_TestWorkspaceEditClientCapabilities)
        test(_TestSignatureHelpClientCapabilities)
        test(_TestDefinitionClientCapabilities)

        test(_TestDeclarationClientCapabilities)
        test(_TestTypeDefinitionClientCapabilities)
        test(_TestImplementationClientCapabilities)
        test(_TestReferenceClientCapabilities)
        test(_TestDocumentHighlightClientCapabilities)

        test(_TestDocumentSymbolClientCapabilities)
        test(_TestCodeActionClientCapabilities)
        test(_TestCodeLensClientCapabilities)
        test(_TestDocumentLinkClientCapabilities)
        test(_TestDocumentColorClientCapabilities)
        test(_TestDocumentFormattingClientCapabilities)
        test(_TestDocumentRangeFormattingClientCapabilities)
        test(_TestDocumentOnTypeFormattingClientCapabilities)
        test(_TestRenameClientCapabilities)
        test(_TestPublishDiagnosticsClientCapabilities)
        test(_TestFoldingRangeClientCapabilities)
        test(_TestSelectionRangeClientCapabilities)
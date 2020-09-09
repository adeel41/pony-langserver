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



use "ponytest"

actor Main is TestList
    new create(env: Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        test(_TestContentLengthOnly)
        test(_TestContentLengthThenMessage)
        test(_TestMultipleEnvelopesInSingleRequest)
        test(_TestSingleEnvelopeInMultipleRequests)
        test(_TestSizeRestrictedMessage)

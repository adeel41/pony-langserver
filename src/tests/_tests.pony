use "ponytest"
use "../types"

actor Main is TestList
    new create(env: Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        test(_TestEvelopeCreate)
        test(_TestEnvelopeOpen)
        test(_TestRequestMessageCreate)
        test(_TestRequestMessageGetParams)
        // test(_TestInitialize)
use "ponytest"
use initialize = "package:initialize"
use textDocument = "package:textDocument"

actor Main is TestList
    new create(env: Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        initialize.Main.make().tests(test)
        textDocument.Main.make().tests(test)

use "ponytest"
use types = "types"
use handlers = "handlers"

actor Main is TestList
    new create(env: Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        types.Main.make().tests(test)
        handlers.Main.make().tests(test)

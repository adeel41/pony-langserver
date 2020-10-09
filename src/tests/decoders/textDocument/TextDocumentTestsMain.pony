use "ponytest"
use didOpen = "package:didOpen"

actor Main is TestList
    new create(env: Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        didOpen.Main.make().tests(test)

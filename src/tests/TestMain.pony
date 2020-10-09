use "ponytest"
use decoders = "package:decoders"
use handlers = "package:handlers"
use envelope = "package:envelope"

actor Main is TestList
    new create(env: Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        decoders.Main.make().tests(test)
        handlers.Main.make().tests(test)
        envelope.Main.make().tests(test)

use "ponytest"
use decoders = "package:decoders"
use handlers = "package:handlers"
use envelope = "package:envelope"
use request_messages = "package:request_messages"
use notifications = "notifications"

actor Main is TestList
    new create(env: Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        decoders.Main.make().tests(test)
        handlers.Main.make().tests(test)
        envelope.Main.make().tests(test)
        request_messages.Main.make().tests(test)
        notifications.Main.make().tests(test)

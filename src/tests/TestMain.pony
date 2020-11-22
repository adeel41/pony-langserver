use "ponytest"
use decoders = "decoders"
use handlers = "handlers"
use envelope = "envelope"
use request_messages = "request_messages"
use notifications = "notifications"
use raw_message_reader = "raw_message_reader"
use parsing = "parsing"

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
        raw_message_reader.Main.make().tests(test)
        parsing.Main.make().tests(test)

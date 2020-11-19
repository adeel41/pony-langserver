use "ponytest"
use notifications = "notifications"

actor Main is TestList
    new create(env: Env) =>
        PonyTest(env, this)

    new make() =>
        None

    fun tag tests(test: PonyTest) =>
        test(_MessageHandlerFactoryInitializeTest)
        test(_TestInitializeHandler)
        notifications.Main.make().tests(test)

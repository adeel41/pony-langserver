use "ponytest"

class iso _MessageHandlerFactoryTests is UnitTest

    fun name() : String => "MessageHandlerFactory"
    fun apply(h: TestHelper) =>
        h.assert_eq[I64](1, 2)
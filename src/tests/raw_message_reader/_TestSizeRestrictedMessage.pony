use "ponytest"
use "../../server"

class _TestSizeRestrictedMessage is UnitTest
    fun name() : String => "raw_messages:raw_message"
    fun apply(h: TestHelper) =>
        let message_1 = "0123456"
        let message_2 = "789"
        let extra_message = "1011" 

        let message = SizeRestrictedMessage(USize.from[I32](10))
        (var completed, var extra) = message.append(message_1)
        h.assert_false(completed)
        h.assert_eq[I32](0, extra.size().i32())

        (completed, extra) = message.append( message_2 + extra_message )
        h.assert_true(completed)
        h.assert_eq[I32](4, extra.size().i32())

        h.assert_eq[String](message_1 + message_2, message.get_content())

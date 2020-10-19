use "ponytest"
use "../../handlers"
use "../../types"

class _TestContentLengthOnly is UnitTest
    fun name() : String => "raw_messages:content_length_only"
    fun apply(h: TestHelper) =>
        let handler = recover ref RawMessageHandler end
        handler.process(TestData.message1())
        h.assert_eq[I32](2976, handler.get_message_size().i32())
        h.assert_eq[I32](0, try 
            (handler.get_envelopes() as Array[Envelope]).size().i32()
        else 0 end)


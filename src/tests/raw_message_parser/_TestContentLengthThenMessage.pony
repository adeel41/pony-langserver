use "ponytest"
use "../../handlers"
use "../../types"

class _TestContentLengthThenMessage is UnitTest
    fun name() : String => "raw_messages:content_length_then_message"
    fun apply(h: TestHelper) =>
        let handler = recover ref RawMessageHandler end
        handler.process(TestData.message1())
        handler.process(TestData.message2())

        h.assert_eq[I32](2976, handler.get_message_size().i32())        
        h.assert_eq[I32](1, try 
            (handler.get_envelopes() as Array[Envelope]).size().i32()
        else 0 end)

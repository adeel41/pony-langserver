use "ponytest"
use "../../handlers"
use "../../types"
use "../../server"

class _TestContentLengthThenMessage is UnitTest
    fun name() : String => "raw_messages:content_length_then_message"
    fun apply(h: TestHelper) =>
        let reader = recover ref RawMessageReader end
        reader.read(TestData.message1())
        reader.read(TestData.message2())

        h.assert_eq[I32](2976, reader.get_message_size().i32())        
        h.assert_eq[I32](1, try 
            (reader.get_envelopes() as Array[Envelope]).size().i32()
        else 0 end)

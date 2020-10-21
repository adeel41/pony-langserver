use "ponytest"
use "../../handlers"
use "../../types"
use "../../server"

class _TestContentLengthOnly is UnitTest
    fun name() : String => "raw_messages:content_length_only"
    fun apply(h: TestHelper) =>
        let reader = recover ref RawMessageReader end
        reader.read(TestData.message1())
        h.assert_eq[I32](2976, reader.get_message_size().i32())
        h.assert_eq[I32](0, try 
            (reader.get_envelopes() as Array[Envelope]).size().i32()
        else 0 end)


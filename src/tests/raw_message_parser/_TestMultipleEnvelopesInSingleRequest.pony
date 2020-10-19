use "ponytest"
use "../../handlers"
use "../../types"

class _TestMultipleEnvelopesInSingleRequest is UnitTest
    fun name() : String => "raw_messages:multiple_envelopes_in_single_request"
    fun apply(h: TestHelper) =>
        let handler = recover ref RawMessageHandler end
        handler.process(TestData.message5())
        
        h.assert_eq[I32](2, try 
            (handler.get_envelopes() as Array[Envelope]).size().i32()
        else 0 end)

use "ponytest"
use "../../handlers"
use "../../types"
use "../../server"

class _TestMultipleEnvelopesInSingleRequest is UnitTest
    fun name() : String => "raw_messages:multiple_envelopes_in_single_request"
    fun apply(h: TestHelper) =>
        let reader = recover ref RawMessageReader end
        reader.read(TestData.message5())
        
        h.assert_eq[I32](2, try 
            (reader.get_envelopes() as Array[Envelope] val).size().i32()
        else 0 end)

use "ponytest"
use "../../handlers"
use "../../types"
use "../../server"

class _TestSingleEnvelopeInMultipleRequests is UnitTest
    fun name() : String => "raw_messages:single_envelope_in_multiple_requests"
    fun apply(h: TestHelper) =>
        let reader = recover ref RawMessageReader end
        reader.read(TestData.largeMessagePart1())
        h.assert_eq[I32](0, get_total_envelopes(reader))

        reader.read(TestData.largeMessagePart2())
        h.assert_eq[I32](0, get_total_envelopes(reader))

        reader.read(TestData.largeMessagePart3())
        h.assert_eq[I32](1, get_total_envelopes(reader))

    fun get_total_envelopes(reader: RawMessageReader) : I32 =>
        try 
            (reader.get_envelopes() as Array[Envelope] val).size().i32()
        else 
            0 
        end
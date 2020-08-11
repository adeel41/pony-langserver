use "ponytest"

class iso _TestEvelopeCreation is UnitTest
    let _msg:String = """
Content-Length: 58


{"jsonrpc":"2.0","id":1,"method":"shutdown","params":null}"""

    fun name(): String => "Create envelope"

    fun apply(h: TestHelper) =>
        let envelope = Envelope(_msg.array())
        h.assert_eq[U16](58, envelope.length)
        h.assert_ne[String]("", envelope.content, "Envelope's content should not be empty")
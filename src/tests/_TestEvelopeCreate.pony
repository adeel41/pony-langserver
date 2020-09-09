use "ponytest"
use "../types"
use "json"
use "Debug"

class iso _TestEvelopeCreate is UnitTest
    let _msg:String = """
Content-Length: 58


{"jsonrpc":"2.0","id":1,"method":"shutdown","params":null}"""

    fun name(): String => "Envelope:Create"

    fun apply(h: TestHelper) =>
        let envelope = Envelope(_msg.array())
        h.assert_eq[U16](58, envelope.length)
        h.assert_ne[String]("", envelope.content, "Envelope's content should not be empty")
        h.assert_eq[String]("""{"jsonrpc":"2.0","id":1,"method":"shutdown","params":null}""", envelope.content)
        
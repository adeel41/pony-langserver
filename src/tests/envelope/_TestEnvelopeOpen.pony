use "ponytest"
use "../../types"

class iso _TestEnvelopeOpen is UnitTest
    let _content:String = """{"jsonrpc":"2.0","id":1,"method":"shutdown","params":null}"""

    fun name(): String => "types:Envelope:Open"
    fun apply(h: TestHelper) =>
        let envelope = Envelope(_content.size().u16(), _content)
        try
            let request_message = envelope.open()?
            h.assert_eq[I64](1, (request_message as RequestMessage).id)
            h.assert_eq[String]("shutdown", (request_message as RequestMessage).method )
        end

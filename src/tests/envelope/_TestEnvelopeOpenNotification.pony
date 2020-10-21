use "ponytest"
use "../../types"
use "../../server"

class iso _TestEnvelopeOpenNotification is UnitTest
    let _content:String = """{"jsonrpc":"2.0","method":"initialized","params":{}}"""

    fun name(): String => "envelope:Open:Notification"
    fun apply(h: TestHelper) =>
        let envelope = Envelope(_content.size().u16(), _content)
        try
            let notification = envelope.open()?
            h.assert_eq[String]("initialized", (notification as Notification).method )
        else
            h.fail("Unable to open envelope as a notification")
        end

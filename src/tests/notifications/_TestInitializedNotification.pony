use "ponytest"
use "json"
use "../../types"

class _TestInitializedNotification is UnitTest
    let _content:String = """{"jsonrpc":"2.0","method":"initialized","params":{}}"""
    fun name() : String => "notifications:initialized"
    fun apply(h: TestHelper) =>
        var params: NotificationTypes = None
        try
            let doc = JsonDoc
            doc.parse(_content)?
            let notification = Notification(doc.data as JsonObject)?
            params = notification.get_params()
        end

        match params
        | let p:InitializedParams =>
            None
        else
            h.fail("Should have received an InitializedParams type")
        end
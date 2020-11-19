use "ponytest"
use "json"
use "../../types"
use "../data"

class _TestTextDocumentDidOpenNotification is UnitTest
    let _content:String = TextDocumentDidOpenNotificationData.get_rpc_message()
    fun name() : String => "notifications:textDocument:didOpen"
    fun apply(h: TestHelper) =>
        var params: NotificationTypes = None
        try
            let doc = JsonDoc
            doc.parse(_content)?
            let notification = Notification(doc.data as JsonObject)?
            params = notification.get_params()
        end

        match params
        | let p:DidOpenTextDocumentParams =>
            None
        else
            h.fail("Should have received an DidOpenTextDocumentParams type")
        end
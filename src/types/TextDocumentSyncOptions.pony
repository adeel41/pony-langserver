use "json"

class TextDocumentSyncOptions
    let openClose: (Bool | None)
    let change: (TextDocumentSyncKind | None)

    new create(openClose': Bool, change': TextDocumentSyncKind) =>
        openClose = openClose'
        change = change'

    fun to_json() : JsonObject =>
        let json = JsonObject
        try
            json.data("openClose") = openClose as Bool    
            json.data("change") = (change as TextDocumentSyncKind).get_id()
        end
        json
class TextDocumentSyncOptions
    let openClose: (Bool | None)
    let change: (TextDocumentSyncKind | None)

    new create(openClose': Bool, change': TextDocumentSyncKind) =>
        openClose = openClose'
        change = change'
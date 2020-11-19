use "../types"
use model = "../model"

primitive DidOpenTextDocumentHandler
    fun handle(app: model.App, params: DidOpenTextDocumentParams) =>
        None
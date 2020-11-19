use "../types"
use model = "../model"

primitive NotificationHandlerFactory
    fun handle(app: model.App, message: Notification) =>
        match message.get_params()
        | let params : DidOpenTextDocumentParams =>
            DidOpenTextDocumentHandler.handle(app, params)
        end

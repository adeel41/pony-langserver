use "../types"
use model = "../model"

primitive NotificationHandlerFactory
    fun handle(app: model.App, message: Notification) =>
        None
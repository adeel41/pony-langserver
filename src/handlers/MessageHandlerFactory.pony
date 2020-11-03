use "../types"
use model = "../model"

primitive MessageHandlerFactory    
    fun handle(app: model.App, message: RequestMessage) : ResponseMessage =>
        match message.get_params()
        | let params : InitializeParams =>
            InitializeHandler.handle(app, params, message.id)
        else
            ResponseMessage.failed(message.id, ResponseError(123, "Message not supported on Server"))
        end
